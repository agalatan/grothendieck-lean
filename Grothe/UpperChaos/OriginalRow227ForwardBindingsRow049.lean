import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow049
import Grothe.UpperChaos.OriginalRow227TriangleForward0705
import Grothe.UpperChaos.OriginalRow227TriangleForward0706
import Grothe.UpperChaos.OriginalRow227TriangleForward0707
import Grothe.UpperChaos.OriginalRow227TriangleForward0708
import Grothe.UpperChaos.OriginalRow227TriangleForward0709
import Grothe.UpperChaos.OriginalRow227TriangleForward0710
import Grothe.UpperChaos.OriginalRow227TriangleForward0711
import Grothe.UpperChaos.OriginalRow227TriangleForward0712
import Grothe.UpperChaos.OriginalRow227TriangleForward0713
import Grothe.UpperChaos.OriginalRow227TriangleForward0714
import Grothe.UpperChaos.OriginalRow227TriangleForward0715
import Grothe.UpperChaos.OriginalRow227TriangleForward0716
import Grothe.UpperChaos.OriginalRow227TriangleForward0717

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0705 : OriginalRow227TriangleForward0705.entries.size = 32 := rfl

def entry0705 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0705.entries[i.val]'(by rw [size0705]; exact i.isLt)

theorem fields0705 (i : Fin 32) :
    (entry0705 i).IA = shift ∧ (entry0705 i).ID = S (48 + i.val + 1) ∧
      (entry0705 i).IC = S 49 ∧ (entry0705 i).Inext = T 48 (48 + i.val + 1) ∧
      (entry0705 i).Icur = T 48 (48 + i.val) ∧
      (entry0705 i).output = T 49 (48 + i.val) ∧
      (entry0705 i).charge = charge 48 (48 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0721_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0705 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (48 + i.val)) shift
      (S (48 + i.val + 1)) (S 49) (T 48 (48 + i.val + 1))
      (T 48 (48 + i.val)) (T 49 (48 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0705.entries OriginalRow227TriangleForward0705.checked
    ⟨i.val, by rw [size0705]; exact i.isLt⟩
  change (entry0705 i).check = true at h
  rcases fields0705 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0706 : OriginalRow227TriangleForward0706.entries.size = 32 := rfl

def entry0706 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0706.entries[i.val]'(by rw [size0706]; exact i.isLt)

theorem fields0706 (i : Fin 32) :
    (entry0706 i).IA = shift ∧ (entry0706 i).ID = S (80 + i.val + 1) ∧
      (entry0706 i).IC = S 49 ∧ (entry0706 i).Inext = T 48 (80 + i.val + 1) ∧
      (entry0706 i).Icur = T 48 (80 + i.val) ∧
      (entry0706 i).output = T 49 (80 + i.val) ∧
      (entry0706 i).charge = charge 48 (80 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0722_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0706 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (80 + i.val)) shift
      (S (80 + i.val + 1)) (S 49) (T 48 (80 + i.val + 1))
      (T 48 (80 + i.val)) (T 49 (80 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0706.entries OriginalRow227TriangleForward0706.checked
    ⟨i.val, by rw [size0706]; exact i.isLt⟩
  change (entry0706 i).check = true at h
  rcases fields0706 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0707 : OriginalRow227TriangleForward0707.entries.size = 32 := rfl

def entry0707 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0707.entries[i.val]'(by rw [size0707]; exact i.isLt)

theorem fields0707 (i : Fin 32) :
    (entry0707 i).IA = shift ∧ (entry0707 i).ID = S (112 + i.val + 1) ∧
      (entry0707 i).IC = S 49 ∧ (entry0707 i).Inext = T 48 (112 + i.val + 1) ∧
      (entry0707 i).Icur = T 48 (112 + i.val) ∧
      (entry0707 i).output = T 49 (112 + i.val) ∧
      (entry0707 i).charge = charge 48 (112 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0723_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0707 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (112 + i.val)) shift
      (S (112 + i.val + 1)) (S 49) (T 48 (112 + i.val + 1))
      (T 48 (112 + i.val)) (T 49 (112 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0707.entries OriginalRow227TriangleForward0707.checked
    ⟨i.val, by rw [size0707]; exact i.isLt⟩
  change (entry0707 i).check = true at h
  rcases fields0707 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0708 : OriginalRow227TriangleForward0708.entries.size = 32 := rfl

def entry0708 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0708.entries[i.val]'(by rw [size0708]; exact i.isLt)

theorem fields0708 (i : Fin 32) :
    (entry0708 i).IA = shift ∧ (entry0708 i).ID = S (144 + i.val + 1) ∧
      (entry0708 i).IC = S 49 ∧ (entry0708 i).Inext = T 48 (144 + i.val + 1) ∧
      (entry0708 i).Icur = T 48 (144 + i.val) ∧
      (entry0708 i).output = T 49 (144 + i.val) ∧
      (entry0708 i).charge = charge 48 (144 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0724_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0708 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (144 + i.val)) shift
      (S (144 + i.val + 1)) (S 49) (T 48 (144 + i.val + 1))
      (T 48 (144 + i.val)) (T 49 (144 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0708.entries OriginalRow227TriangleForward0708.checked
    ⟨i.val, by rw [size0708]; exact i.isLt⟩
  change (entry0708 i).check = true at h
  rcases fields0708 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0709 : OriginalRow227TriangleForward0709.entries.size = 32 := rfl

def entry0709 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0709.entries[i.val]'(by rw [size0709]; exact i.isLt)

theorem fields0709 (i : Fin 32) :
    (entry0709 i).IA = shift ∧ (entry0709 i).ID = S (176 + i.val + 1) ∧
      (entry0709 i).IC = S 49 ∧ (entry0709 i).Inext = T 48 (176 + i.val + 1) ∧
      (entry0709 i).Icur = T 48 (176 + i.val) ∧
      (entry0709 i).output = T 49 (176 + i.val) ∧
      (entry0709 i).charge = charge 48 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0725_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0709 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 49) (T 48 (176 + i.val + 1))
      (T 48 (176 + i.val)) (T 49 (176 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0709.entries OriginalRow227TriangleForward0709.checked
    ⟨i.val, by rw [size0709]; exact i.isLt⟩
  change (entry0709 i).check = true at h
  rcases fields0709 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0710 : OriginalRow227TriangleForward0710.entries.size = 32 := rfl

def entry0710 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0710.entries[i.val]'(by rw [size0710]; exact i.isLt)

theorem fields0710 (i : Fin 32) :
    (entry0710 i).IA = shift ∧ (entry0710 i).ID = S (208 + i.val + 1) ∧
      (entry0710 i).IC = S 49 ∧ (entry0710 i).Inext = T 48 (208 + i.val + 1) ∧
      (entry0710 i).Icur = T 48 (208 + i.val) ∧
      (entry0710 i).output = T 49 (208 + i.val) ∧
      (entry0710 i).charge = charge 48 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0726_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0710 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 49) (T 48 (208 + i.val + 1))
      (T 48 (208 + i.val)) (T 49 (208 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0710.entries OriginalRow227TriangleForward0710.checked
    ⟨i.val, by rw [size0710]; exact i.isLt⟩
  change (entry0710 i).check = true at h
  rcases fields0710 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0711 : OriginalRow227TriangleForward0711.entries.size = 32 := rfl

def entry0711 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0711.entries[i.val]'(by rw [size0711]; exact i.isLt)

theorem fields0711 (i : Fin 32) :
    (entry0711 i).IA = shift ∧ (entry0711 i).ID = S (240 + i.val + 1) ∧
      (entry0711 i).IC = S 49 ∧ (entry0711 i).Inext = T 48 (240 + i.val + 1) ∧
      (entry0711 i).Icur = T 48 (240 + i.val) ∧
      (entry0711 i).output = T 49 (240 + i.val) ∧
      (entry0711 i).charge = charge 48 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0727_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0711 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 49) (T 48 (240 + i.val + 1))
      (T 48 (240 + i.val)) (T 49 (240 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0711.entries OriginalRow227TriangleForward0711.checked
    ⟨i.val, by rw [size0711]; exact i.isLt⟩
  change (entry0711 i).check = true at h
  rcases fields0711 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0712 : OriginalRow227TriangleForward0712.entries.size = 32 := rfl

def entry0712 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0712.entries[i.val]'(by rw [size0712]; exact i.isLt)

theorem fields0712 (i : Fin 32) :
    (entry0712 i).IA = shift ∧ (entry0712 i).ID = S (272 + i.val + 1) ∧
      (entry0712 i).IC = S 49 ∧ (entry0712 i).Inext = T 48 (272 + i.val + 1) ∧
      (entry0712 i).Icur = T 48 (272 + i.val) ∧
      (entry0712 i).output = T 49 (272 + i.val) ∧
      (entry0712 i).charge = charge 48 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0728_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0712 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 49) (T 48 (272 + i.val + 1))
      (T 48 (272 + i.val)) (T 49 (272 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0712.entries OriginalRow227TriangleForward0712.checked
    ⟨i.val, by rw [size0712]; exact i.isLt⟩
  change (entry0712 i).check = true at h
  rcases fields0712 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0713 : OriginalRow227TriangleForward0713.entries.size = 32 := rfl

def entry0713 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0713.entries[i.val]'(by rw [size0713]; exact i.isLt)

theorem fields0713 (i : Fin 32) :
    (entry0713 i).IA = shift ∧ (entry0713 i).ID = S (304 + i.val + 1) ∧
      (entry0713 i).IC = S 49 ∧ (entry0713 i).Inext = T 48 (304 + i.val + 1) ∧
      (entry0713 i).Icur = T 48 (304 + i.val) ∧
      (entry0713 i).output = T 49 (304 + i.val) ∧
      (entry0713 i).charge = charge 48 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0729_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0713 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 49) (T 48 (304 + i.val + 1))
      (T 48 (304 + i.val)) (T 49 (304 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0713.entries OriginalRow227TriangleForward0713.checked
    ⟨i.val, by rw [size0713]; exact i.isLt⟩
  change (entry0713 i).check = true at h
  rcases fields0713 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0714 : OriginalRow227TriangleForward0714.entries.size = 32 := rfl

def entry0714 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0714.entries[i.val]'(by rw [size0714]; exact i.isLt)

theorem fields0714 (i : Fin 32) :
    (entry0714 i).IA = shift ∧ (entry0714 i).ID = S (336 + i.val + 1) ∧
      (entry0714 i).IC = S 49 ∧ (entry0714 i).Inext = T 48 (336 + i.val + 1) ∧
      (entry0714 i).Icur = T 48 (336 + i.val) ∧
      (entry0714 i).output = T 49 (336 + i.val) ∧
      (entry0714 i).charge = charge 48 (336 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0730_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0714 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (336 + i.val)) shift
      (S (336 + i.val + 1)) (S 49) (T 48 (336 + i.val + 1))
      (T 48 (336 + i.val)) (T 49 (336 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0714.entries OriginalRow227TriangleForward0714.checked
    ⟨i.val, by rw [size0714]; exact i.isLt⟩
  change (entry0714 i).check = true at h
  rcases fields0714 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0715 : OriginalRow227TriangleForward0715.entries.size = 32 := rfl

def entry0715 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0715.entries[i.val]'(by rw [size0715]; exact i.isLt)

theorem fields0715 (i : Fin 32) :
    (entry0715 i).IA = shift ∧ (entry0715 i).ID = S (368 + i.val + 1) ∧
      (entry0715 i).IC = S 49 ∧ (entry0715 i).Inext = T 48 (368 + i.val + 1) ∧
      (entry0715 i).Icur = T 48 (368 + i.val) ∧
      (entry0715 i).output = T 49 (368 + i.val) ∧
      (entry0715 i).charge = charge 48 (368 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0731_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0715 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (368 + i.val)) shift
      (S (368 + i.val + 1)) (S 49) (T 48 (368 + i.val + 1))
      (T 48 (368 + i.val)) (T 49 (368 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0715.entries OriginalRow227TriangleForward0715.checked
    ⟨i.val, by rw [size0715]; exact i.isLt⟩
  change (entry0715 i).check = true at h
  rcases fields0715 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0716 : OriginalRow227TriangleForward0716.entries.size = 32 := rfl

def entry0716 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0716.entries[i.val]'(by rw [size0716]; exact i.isLt)

theorem fields0716 (i : Fin 32) :
    (entry0716 i).IA = shift ∧ (entry0716 i).ID = S (400 + i.val + 1) ∧
      (entry0716 i).IC = S 49 ∧ (entry0716 i).Inext = T 48 (400 + i.val + 1) ∧
      (entry0716 i).Icur = T 48 (400 + i.val) ∧
      (entry0716 i).output = T 49 (400 + i.val) ∧
      (entry0716 i).charge = charge 48 (400 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0732_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0716 (i : Fin 32) :
    forwardStepOK (-768) (charge 48 (400 + i.val)) shift
      (S (400 + i.val + 1)) (S 49) (T 48 (400 + i.val + 1))
      (T 48 (400 + i.val)) (T 49 (400 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0716.entries OriginalRow227TriangleForward0716.checked
    ⟨i.val, by rw [size0716]; exact i.isLt⟩
  change (entry0716 i).check = true at h
  rcases fields0716 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0717 : OriginalRow227TriangleForward0717.entries.size = 21 := rfl

def entry0717 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0717.entries[i.val]'(by rw [size0717]; exact i.isLt)

theorem fields0717 (i : Fin 21) :
    (entry0717 i).IA = shift ∧ (entry0717 i).ID = S (432 + i.val + 1) ∧
      (entry0717 i).IC = S 49 ∧ (entry0717 i).Inext = T 48 (432 + i.val + 1) ∧
      (entry0717 i).Icur = T 48 (432 + i.val) ∧
      (entry0717 i).output = T 49 (432 + i.val) ∧
      (entry0717 i).charge = charge 48 (432 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root49).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow049.block0733_value ⟨20, by decide⟩).symm, rfl⟩

theorem step0717 (i : Fin 21) :
    forwardStepOK (-768) (charge 48 (432 + i.val)) shift
      (S (432 + i.val + 1)) (S 49) (T 48 (432 + i.val + 1))
      (T 48 (432 + i.val)) (T 49 (432 + i.val))
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0717.entries OriginalRow227TriangleForward0717.checked
    ⟨i.val, by rw [size0717]; exact i.isLt⟩
  change (entry0717 i).check = true at h
  rcases fields0717 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 48 ≤ d) (hhi : d < 453) :
    forwardStepOK (-768) (charge 48 d) shift (S (d + 1)) (S 49)
      (T 48 (d + 1)) (T 48 d) (T 49 d)
      (OriginalRow227Roots.root_pos 49 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 48 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h144 : d < 144
    ·
      by_cases h80 : d < 80
      ·
        have hi : d - 48 < 32 := by omega
        have heq : 48 + (d - 48) = d := by omega
        simpa only [heq] using step0705 ⟨d - 48, hi⟩
      ·
        by_cases h112 : d < 112
        ·
          have hi : d - 80 < 32 := by omega
          have heq : 80 + (d - 80) = d := by omega
          simpa only [heq] using step0706 ⟨d - 80, hi⟩
        ·
          have hi : d - 112 < 32 := by omega
          have heq : 112 + (d - 112) = d := by omega
          simpa only [heq] using step0707 ⟨d - 112, hi⟩
    ·
      by_cases h176 : d < 176
      ·
        have hi : d - 144 < 32 := by omega
        have heq : 144 + (d - 144) = d := by omega
        simpa only [heq] using step0708 ⟨d - 144, hi⟩
      ·
        by_cases h208 : d < 208
        ·
          have hi : d - 176 < 32 := by omega
          have heq : 176 + (d - 176) = d := by omega
          simpa only [heq] using step0709 ⟨d - 176, hi⟩
        ·
          have hi : d - 208 < 32 := by omega
          have heq : 208 + (d - 208) = d := by omega
          simpa only [heq] using step0710 ⟨d - 208, hi⟩
  ·
    by_cases h336 : d < 336
    ·
      by_cases h272 : d < 272
      ·
        have hi : d - 240 < 32 := by omega
        have heq : 240 + (d - 240) = d := by omega
        simpa only [heq] using step0711 ⟨d - 240, hi⟩
      ·
        by_cases h304 : d < 304
        ·
          have hi : d - 272 < 32 := by omega
          have heq : 272 + (d - 272) = d := by omega
          simpa only [heq] using step0712 ⟨d - 272, hi⟩
        ·
          have hi : d - 304 < 32 := by omega
          have heq : 304 + (d - 304) = d := by omega
          simpa only [heq] using step0713 ⟨d - 304, hi⟩
    ·
      by_cases h400 : d < 400
      ·
        by_cases h368 : d < 368
        ·
          have hi : d - 336 < 32 := by omega
          have heq : 336 + (d - 336) = d := by omega
          simpa only [heq] using step0714 ⟨d - 336, hi⟩
        ·
          have hi : d - 368 < 32 := by omega
          have heq : 368 + (d - 368) = d := by omega
          simpa only [heq] using step0715 ⟨d - 368, hi⟩
      ·
        by_cases h432 : d < 432
        ·
          have hi : d - 400 < 32 := by omega
          have heq : 400 + (d - 400) = d := by omega
          simpa only [heq] using step0716 ⟨d - 400, hi⟩
        ·
          have hi : d - 432 < 21 := by omega
          have heq : 432 + (d - 432) = d := by omega
          simpa only [heq] using step0717 ⟨d - 432, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0705,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0705,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0706,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0706,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0707,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0707,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0708,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0708,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0709,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0709,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0710,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0710,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0711,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0711,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0712,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0712,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0713,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0713,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0714,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0714,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0715,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0715,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0716,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0716,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.fields0717,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.step0717,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow049
