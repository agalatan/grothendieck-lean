import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow048
import Grothe.UpperChaos.OriginalRow227TriangleForward0692
import Grothe.UpperChaos.OriginalRow227TriangleForward0693
import Grothe.UpperChaos.OriginalRow227TriangleForward0694
import Grothe.UpperChaos.OriginalRow227TriangleForward0695
import Grothe.UpperChaos.OriginalRow227TriangleForward0696
import Grothe.UpperChaos.OriginalRow227TriangleForward0697
import Grothe.UpperChaos.OriginalRow227TriangleForward0698
import Grothe.UpperChaos.OriginalRow227TriangleForward0699
import Grothe.UpperChaos.OriginalRow227TriangleForward0700
import Grothe.UpperChaos.OriginalRow227TriangleForward0701
import Grothe.UpperChaos.OriginalRow227TriangleForward0702
import Grothe.UpperChaos.OriginalRow227TriangleForward0703
import Grothe.UpperChaos.OriginalRow227TriangleForward0704

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0692 : OriginalRow227TriangleForward0692.entries.size = 32 := rfl

def entry0692 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0692.entries[i.val]'(by rw [size0692]; exact i.isLt)

theorem fields0692 (i : Fin 32) :
    (entry0692 i).IA = shift ∧ (entry0692 i).ID = S (47 + i.val + 1) ∧
      (entry0692 i).IC = S 48 ∧ (entry0692 i).Inext = T 47 (47 + i.val + 1) ∧
      (entry0692 i).Icur = T 47 (47 + i.val) ∧
      (entry0692 i).output = T 48 (47 + i.val) ∧
      (entry0692 i).charge = charge 47 (47 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0708_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0692 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (47 + i.val)) shift
      (S (47 + i.val + 1)) (S 48) (T 47 (47 + i.val + 1))
      (T 47 (47 + i.val)) (T 48 (47 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0692.entries OriginalRow227TriangleForward0692.checked
    ⟨i.val, by rw [size0692]; exact i.isLt⟩
  change (entry0692 i).check = true at h
  rcases fields0692 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0693 : OriginalRow227TriangleForward0693.entries.size = 32 := rfl

def entry0693 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0693.entries[i.val]'(by rw [size0693]; exact i.isLt)

theorem fields0693 (i : Fin 32) :
    (entry0693 i).IA = shift ∧ (entry0693 i).ID = S (79 + i.val + 1) ∧
      (entry0693 i).IC = S 48 ∧ (entry0693 i).Inext = T 47 (79 + i.val + 1) ∧
      (entry0693 i).Icur = T 47 (79 + i.val) ∧
      (entry0693 i).output = T 48 (79 + i.val) ∧
      (entry0693 i).charge = charge 47 (79 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0709_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0693 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (79 + i.val)) shift
      (S (79 + i.val + 1)) (S 48) (T 47 (79 + i.val + 1))
      (T 47 (79 + i.val)) (T 48 (79 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0693.entries OriginalRow227TriangleForward0693.checked
    ⟨i.val, by rw [size0693]; exact i.isLt⟩
  change (entry0693 i).check = true at h
  rcases fields0693 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0694 : OriginalRow227TriangleForward0694.entries.size = 32 := rfl

def entry0694 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0694.entries[i.val]'(by rw [size0694]; exact i.isLt)

theorem fields0694 (i : Fin 32) :
    (entry0694 i).IA = shift ∧ (entry0694 i).ID = S (111 + i.val + 1) ∧
      (entry0694 i).IC = S 48 ∧ (entry0694 i).Inext = T 47 (111 + i.val + 1) ∧
      (entry0694 i).Icur = T 47 (111 + i.val) ∧
      (entry0694 i).output = T 48 (111 + i.val) ∧
      (entry0694 i).charge = charge 47 (111 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0710_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0694 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (111 + i.val)) shift
      (S (111 + i.val + 1)) (S 48) (T 47 (111 + i.val + 1))
      (T 47 (111 + i.val)) (T 48 (111 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0694.entries OriginalRow227TriangleForward0694.checked
    ⟨i.val, by rw [size0694]; exact i.isLt⟩
  change (entry0694 i).check = true at h
  rcases fields0694 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0695 : OriginalRow227TriangleForward0695.entries.size = 32 := rfl

def entry0695 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0695.entries[i.val]'(by rw [size0695]; exact i.isLt)

theorem fields0695 (i : Fin 32) :
    (entry0695 i).IA = shift ∧ (entry0695 i).ID = S (143 + i.val + 1) ∧
      (entry0695 i).IC = S 48 ∧ (entry0695 i).Inext = T 47 (143 + i.val + 1) ∧
      (entry0695 i).Icur = T 47 (143 + i.val) ∧
      (entry0695 i).output = T 48 (143 + i.val) ∧
      (entry0695 i).charge = charge 47 (143 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0711_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0695 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (143 + i.val)) shift
      (S (143 + i.val + 1)) (S 48) (T 47 (143 + i.val + 1))
      (T 47 (143 + i.val)) (T 48 (143 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0695.entries OriginalRow227TriangleForward0695.checked
    ⟨i.val, by rw [size0695]; exact i.isLt⟩
  change (entry0695 i).check = true at h
  rcases fields0695 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0696 : OriginalRow227TriangleForward0696.entries.size = 32 := rfl

def entry0696 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0696.entries[i.val]'(by rw [size0696]; exact i.isLt)

theorem fields0696 (i : Fin 32) :
    (entry0696 i).IA = shift ∧ (entry0696 i).ID = S (175 + i.val + 1) ∧
      (entry0696 i).IC = S 48 ∧ (entry0696 i).Inext = T 47 (175 + i.val + 1) ∧
      (entry0696 i).Icur = T 47 (175 + i.val) ∧
      (entry0696 i).output = T 48 (175 + i.val) ∧
      (entry0696 i).charge = charge 47 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0712_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0696 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 48) (T 47 (175 + i.val + 1))
      (T 47 (175 + i.val)) (T 48 (175 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0696.entries OriginalRow227TriangleForward0696.checked
    ⟨i.val, by rw [size0696]; exact i.isLt⟩
  change (entry0696 i).check = true at h
  rcases fields0696 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0697 : OriginalRow227TriangleForward0697.entries.size = 32 := rfl

def entry0697 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0697.entries[i.val]'(by rw [size0697]; exact i.isLt)

theorem fields0697 (i : Fin 32) :
    (entry0697 i).IA = shift ∧ (entry0697 i).ID = S (207 + i.val + 1) ∧
      (entry0697 i).IC = S 48 ∧ (entry0697 i).Inext = T 47 (207 + i.val + 1) ∧
      (entry0697 i).Icur = T 47 (207 + i.val) ∧
      (entry0697 i).output = T 48 (207 + i.val) ∧
      (entry0697 i).charge = charge 47 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0713_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0697 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 48) (T 47 (207 + i.val + 1))
      (T 47 (207 + i.val)) (T 48 (207 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0697.entries OriginalRow227TriangleForward0697.checked
    ⟨i.val, by rw [size0697]; exact i.isLt⟩
  change (entry0697 i).check = true at h
  rcases fields0697 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0698 : OriginalRow227TriangleForward0698.entries.size = 32 := rfl

def entry0698 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0698.entries[i.val]'(by rw [size0698]; exact i.isLt)

theorem fields0698 (i : Fin 32) :
    (entry0698 i).IA = shift ∧ (entry0698 i).ID = S (239 + i.val + 1) ∧
      (entry0698 i).IC = S 48 ∧ (entry0698 i).Inext = T 47 (239 + i.val + 1) ∧
      (entry0698 i).Icur = T 47 (239 + i.val) ∧
      (entry0698 i).output = T 48 (239 + i.val) ∧
      (entry0698 i).charge = charge 47 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0714_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0698 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 48) (T 47 (239 + i.val + 1))
      (T 47 (239 + i.val)) (T 48 (239 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0698.entries OriginalRow227TriangleForward0698.checked
    ⟨i.val, by rw [size0698]; exact i.isLt⟩
  change (entry0698 i).check = true at h
  rcases fields0698 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0699 : OriginalRow227TriangleForward0699.entries.size = 32 := rfl

def entry0699 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0699.entries[i.val]'(by rw [size0699]; exact i.isLt)

theorem fields0699 (i : Fin 32) :
    (entry0699 i).IA = shift ∧ (entry0699 i).ID = S (271 + i.val + 1) ∧
      (entry0699 i).IC = S 48 ∧ (entry0699 i).Inext = T 47 (271 + i.val + 1) ∧
      (entry0699 i).Icur = T 47 (271 + i.val) ∧
      (entry0699 i).output = T 48 (271 + i.val) ∧
      (entry0699 i).charge = charge 47 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0715_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0699 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 48) (T 47 (271 + i.val + 1))
      (T 47 (271 + i.val)) (T 48 (271 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0699.entries OriginalRow227TriangleForward0699.checked
    ⟨i.val, by rw [size0699]; exact i.isLt⟩
  change (entry0699 i).check = true at h
  rcases fields0699 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0700 : OriginalRow227TriangleForward0700.entries.size = 32 := rfl

def entry0700 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0700.entries[i.val]'(by rw [size0700]; exact i.isLt)

theorem fields0700 (i : Fin 32) :
    (entry0700 i).IA = shift ∧ (entry0700 i).ID = S (303 + i.val + 1) ∧
      (entry0700 i).IC = S 48 ∧ (entry0700 i).Inext = T 47 (303 + i.val + 1) ∧
      (entry0700 i).Icur = T 47 (303 + i.val) ∧
      (entry0700 i).output = T 48 (303 + i.val) ∧
      (entry0700 i).charge = charge 47 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0716_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0700 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 48) (T 47 (303 + i.val + 1))
      (T 47 (303 + i.val)) (T 48 (303 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0700.entries OriginalRow227TriangleForward0700.checked
    ⟨i.val, by rw [size0700]; exact i.isLt⟩
  change (entry0700 i).check = true at h
  rcases fields0700 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0701 : OriginalRow227TriangleForward0701.entries.size = 32 := rfl

def entry0701 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0701.entries[i.val]'(by rw [size0701]; exact i.isLt)

theorem fields0701 (i : Fin 32) :
    (entry0701 i).IA = shift ∧ (entry0701 i).ID = S (335 + i.val + 1) ∧
      (entry0701 i).IC = S 48 ∧ (entry0701 i).Inext = T 47 (335 + i.val + 1) ∧
      (entry0701 i).Icur = T 47 (335 + i.val) ∧
      (entry0701 i).output = T 48 (335 + i.val) ∧
      (entry0701 i).charge = charge 47 (335 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0717_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0701 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (335 + i.val)) shift
      (S (335 + i.val + 1)) (S 48) (T 47 (335 + i.val + 1))
      (T 47 (335 + i.val)) (T 48 (335 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0701.entries OriginalRow227TriangleForward0701.checked
    ⟨i.val, by rw [size0701]; exact i.isLt⟩
  change (entry0701 i).check = true at h
  rcases fields0701 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0702 : OriginalRow227TriangleForward0702.entries.size = 32 := rfl

def entry0702 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0702.entries[i.val]'(by rw [size0702]; exact i.isLt)

theorem fields0702 (i : Fin 32) :
    (entry0702 i).IA = shift ∧ (entry0702 i).ID = S (367 + i.val + 1) ∧
      (entry0702 i).IC = S 48 ∧ (entry0702 i).Inext = T 47 (367 + i.val + 1) ∧
      (entry0702 i).Icur = T 47 (367 + i.val) ∧
      (entry0702 i).output = T 48 (367 + i.val) ∧
      (entry0702 i).charge = charge 47 (367 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0718_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0702 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (367 + i.val)) shift
      (S (367 + i.val + 1)) (S 48) (T 47 (367 + i.val + 1))
      (T 47 (367 + i.val)) (T 48 (367 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0702.entries OriginalRow227TriangleForward0702.checked
    ⟨i.val, by rw [size0702]; exact i.isLt⟩
  change (entry0702 i).check = true at h
  rcases fields0702 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0703 : OriginalRow227TriangleForward0703.entries.size = 32 := rfl

def entry0703 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0703.entries[i.val]'(by rw [size0703]; exact i.isLt)

theorem fields0703 (i : Fin 32) :
    (entry0703 i).IA = shift ∧ (entry0703 i).ID = S (399 + i.val + 1) ∧
      (entry0703 i).IC = S 48 ∧ (entry0703 i).Inext = T 47 (399 + i.val + 1) ∧
      (entry0703 i).Icur = T 47 (399 + i.val) ∧
      (entry0703 i).output = T 48 (399 + i.val) ∧
      (entry0703 i).charge = charge 47 (399 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0719_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0703 (i : Fin 32) :
    forwardStepOK (-768) (charge 47 (399 + i.val)) shift
      (S (399 + i.val + 1)) (S 48) (T 47 (399 + i.val + 1))
      (T 47 (399 + i.val)) (T 48 (399 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0703.entries OriginalRow227TriangleForward0703.checked
    ⟨i.val, by rw [size0703]; exact i.isLt⟩
  change (entry0703 i).check = true at h
  rcases fields0703 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0704 : OriginalRow227TriangleForward0704.entries.size = 23 := rfl

def entry0704 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0704.entries[i.val]'(by rw [size0704]; exact i.isLt)

theorem fields0704 (i : Fin 23) :
    (entry0704 i).IA = shift ∧ (entry0704 i).ID = S (431 + i.val + 1) ∧
      (entry0704 i).IC = S 48 ∧ (entry0704 i).Inext = T 47 (431 + i.val + 1) ∧
      (entry0704 i).Icur = T 47 (431 + i.val) ∧
      (entry0704 i).output = T 48 (431 + i.val) ∧
      (entry0704 i).charge = charge 47 (431 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root48).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow048.block0720_value ⟨22, by decide⟩).symm, rfl⟩

theorem step0704 (i : Fin 23) :
    forwardStepOK (-768) (charge 47 (431 + i.val)) shift
      (S (431 + i.val + 1)) (S 48) (T 47 (431 + i.val + 1))
      (T 47 (431 + i.val)) (T 48 (431 + i.val))
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0704.entries OriginalRow227TriangleForward0704.checked
    ⟨i.val, by rw [size0704]; exact i.isLt⟩
  change (entry0704 i).check = true at h
  rcases fields0704 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 47 ≤ d) (hhi : d < 454) :
    forwardStepOK (-768) (charge 47 d) shift (S (d + 1)) (S 48)
      (T 47 (d + 1)) (T 47 d) (T 48 d)
      (OriginalRow227Roots.root_pos 48 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 47 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h143 : d < 143
    ·
      by_cases h79 : d < 79
      ·
        have hi : d - 47 < 32 := by omega
        have heq : 47 + (d - 47) = d := by omega
        simpa only [heq] using step0692 ⟨d - 47, hi⟩
      ·
        by_cases h111 : d < 111
        ·
          have hi : d - 79 < 32 := by omega
          have heq : 79 + (d - 79) = d := by omega
          simpa only [heq] using step0693 ⟨d - 79, hi⟩
        ·
          have hi : d - 111 < 32 := by omega
          have heq : 111 + (d - 111) = d := by omega
          simpa only [heq] using step0694 ⟨d - 111, hi⟩
    ·
      by_cases h175 : d < 175
      ·
        have hi : d - 143 < 32 := by omega
        have heq : 143 + (d - 143) = d := by omega
        simpa only [heq] using step0695 ⟨d - 143, hi⟩
      ·
        by_cases h207 : d < 207
        ·
          have hi : d - 175 < 32 := by omega
          have heq : 175 + (d - 175) = d := by omega
          simpa only [heq] using step0696 ⟨d - 175, hi⟩
        ·
          have hi : d - 207 < 32 := by omega
          have heq : 207 + (d - 207) = d := by omega
          simpa only [heq] using step0697 ⟨d - 207, hi⟩
  ·
    by_cases h335 : d < 335
    ·
      by_cases h271 : d < 271
      ·
        have hi : d - 239 < 32 := by omega
        have heq : 239 + (d - 239) = d := by omega
        simpa only [heq] using step0698 ⟨d - 239, hi⟩
      ·
        by_cases h303 : d < 303
        ·
          have hi : d - 271 < 32 := by omega
          have heq : 271 + (d - 271) = d := by omega
          simpa only [heq] using step0699 ⟨d - 271, hi⟩
        ·
          have hi : d - 303 < 32 := by omega
          have heq : 303 + (d - 303) = d := by omega
          simpa only [heq] using step0700 ⟨d - 303, hi⟩
    ·
      by_cases h399 : d < 399
      ·
        by_cases h367 : d < 367
        ·
          have hi : d - 335 < 32 := by omega
          have heq : 335 + (d - 335) = d := by omega
          simpa only [heq] using step0701 ⟨d - 335, hi⟩
        ·
          have hi : d - 367 < 32 := by omega
          have heq : 367 + (d - 367) = d := by omega
          simpa only [heq] using step0702 ⟨d - 367, hi⟩
      ·
        by_cases h431 : d < 431
        ·
          have hi : d - 399 < 32 := by omega
          have heq : 399 + (d - 399) = d := by omega
          simpa only [heq] using step0703 ⟨d - 399, hi⟩
        ·
          have hi : d - 431 < 23 := by omega
          have heq : 431 + (d - 431) = d := by omega
          simpa only [heq] using step0704 ⟨d - 431, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0692,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0692,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0693,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0693,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0694,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0694,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0695,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0695,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0696,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0696,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0697,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0697,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0698,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0698,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0699,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0699,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0700,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0700,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0701,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0701,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0702,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0702,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0703,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0703,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.fields0704,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.step0704,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow048
