import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057
import Grothe.UpperChaos.OriginalRow227TriangleForward0809
import Grothe.UpperChaos.OriginalRow227TriangleForward0810
import Grothe.UpperChaos.OriginalRow227TriangleForward0811
import Grothe.UpperChaos.OriginalRow227TriangleForward0812
import Grothe.UpperChaos.OriginalRow227TriangleForward0813
import Grothe.UpperChaos.OriginalRow227TriangleForward0814
import Grothe.UpperChaos.OriginalRow227TriangleForward0815
import Grothe.UpperChaos.OriginalRow227TriangleForward0816
import Grothe.UpperChaos.OriginalRow227TriangleForward0817
import Grothe.UpperChaos.OriginalRow227TriangleForward0818
import Grothe.UpperChaos.OriginalRow227TriangleForward0819
import Grothe.UpperChaos.OriginalRow227TriangleForward0820
import Grothe.UpperChaos.OriginalRow227TriangleForward0821

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0809 : OriginalRow227TriangleForward0809.entries.size = 32 := rfl

def entry0809 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0809.entries[i.val]'(by rw [size0809]; exact i.isLt)

theorem fields0809 (i : Fin 32) :
    (entry0809 i).IA = shift ∧ (entry0809 i).ID = S (56 + i.val + 1) ∧
      (entry0809 i).IC = S 57 ∧ (entry0809 i).Inext = T 56 (56 + i.val + 1) ∧
      (entry0809 i).Icur = T 56 (56 + i.val) ∧
      (entry0809 i).output = T 57 (56 + i.val) ∧
      (entry0809 i).charge = charge 56 (56 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0809 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (56 + i.val)) shift
      (S (56 + i.val + 1)) (S 57) (T 56 (56 + i.val + 1))
      (T 56 (56 + i.val)) (T 57 (56 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0809.entries OriginalRow227TriangleForward0809.checked
    ⟨i.val, by rw [size0809]; exact i.isLt⟩
  change (entry0809 i).check = true at h
  rcases fields0809 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0810 : OriginalRow227TriangleForward0810.entries.size = 32 := rfl

def entry0810 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0810.entries[i.val]'(by rw [size0810]; exact i.isLt)

theorem fields0810 (i : Fin 32) :
    (entry0810 i).IA = shift ∧ (entry0810 i).ID = S (88 + i.val + 1) ∧
      (entry0810 i).IC = S 57 ∧ (entry0810 i).Inext = T 56 (88 + i.val + 1) ∧
      (entry0810 i).Icur = T 56 (88 + i.val) ∧
      (entry0810 i).output = T 57 (88 + i.val) ∧
      (entry0810 i).charge = charge 56 (88 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0810 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (88 + i.val)) shift
      (S (88 + i.val + 1)) (S 57) (T 56 (88 + i.val + 1))
      (T 56 (88 + i.val)) (T 57 (88 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0810.entries OriginalRow227TriangleForward0810.checked
    ⟨i.val, by rw [size0810]; exact i.isLt⟩
  change (entry0810 i).check = true at h
  rcases fields0810 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0811 : OriginalRow227TriangleForward0811.entries.size = 32 := rfl

def entry0811 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0811.entries[i.val]'(by rw [size0811]; exact i.isLt)

theorem fields0811 (i : Fin 32) :
    (entry0811 i).IA = shift ∧ (entry0811 i).ID = S (120 + i.val + 1) ∧
      (entry0811 i).IC = S 57 ∧ (entry0811 i).Inext = T 56 (120 + i.val + 1) ∧
      (entry0811 i).Icur = T 56 (120 + i.val) ∧
      (entry0811 i).output = T 57 (120 + i.val) ∧
      (entry0811 i).charge = charge 56 (120 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0811 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (120 + i.val)) shift
      (S (120 + i.val + 1)) (S 57) (T 56 (120 + i.val + 1))
      (T 56 (120 + i.val)) (T 57 (120 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0811.entries OriginalRow227TriangleForward0811.checked
    ⟨i.val, by rw [size0811]; exact i.isLt⟩
  change (entry0811 i).check = true at h
  rcases fields0811 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0812 : OriginalRow227TriangleForward0812.entries.size = 32 := rfl

def entry0812 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0812.entries[i.val]'(by rw [size0812]; exact i.isLt)

theorem fields0812 (i : Fin 32) :
    (entry0812 i).IA = shift ∧ (entry0812 i).ID = S (152 + i.val + 1) ∧
      (entry0812 i).IC = S 57 ∧ (entry0812 i).Inext = T 56 (152 + i.val + 1) ∧
      (entry0812 i).Icur = T 56 (152 + i.val) ∧
      (entry0812 i).output = T 57 (152 + i.val) ∧
      (entry0812 i).charge = charge 56 (152 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0812 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (152 + i.val)) shift
      (S (152 + i.val + 1)) (S 57) (T 56 (152 + i.val + 1))
      (T 56 (152 + i.val)) (T 57 (152 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0812.entries OriginalRow227TriangleForward0812.checked
    ⟨i.val, by rw [size0812]; exact i.isLt⟩
  change (entry0812 i).check = true at h
  rcases fields0812 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0813 : OriginalRow227TriangleForward0813.entries.size = 32 := rfl

def entry0813 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0813.entries[i.val]'(by rw [size0813]; exact i.isLt)

theorem fields0813 (i : Fin 32) :
    (entry0813 i).IA = shift ∧ (entry0813 i).ID = S (184 + i.val + 1) ∧
      (entry0813 i).IC = S 57 ∧ (entry0813 i).Inext = T 56 (184 + i.val + 1) ∧
      (entry0813 i).Icur = T 56 (184 + i.val) ∧
      (entry0813 i).output = T 57 (184 + i.val) ∧
      (entry0813 i).charge = charge 56 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0813 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 57) (T 56 (184 + i.val + 1))
      (T 56 (184 + i.val)) (T 57 (184 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0813.entries OriginalRow227TriangleForward0813.checked
    ⟨i.val, by rw [size0813]; exact i.isLt⟩
  change (entry0813 i).check = true at h
  rcases fields0813 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0814 : OriginalRow227TriangleForward0814.entries.size = 32 := rfl

def entry0814 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0814.entries[i.val]'(by rw [size0814]; exact i.isLt)

theorem fields0814 (i : Fin 32) :
    (entry0814 i).IA = shift ∧ (entry0814 i).ID = S (216 + i.val + 1) ∧
      (entry0814 i).IC = S 57 ∧ (entry0814 i).Inext = T 56 (216 + i.val + 1) ∧
      (entry0814 i).Icur = T 56 (216 + i.val) ∧
      (entry0814 i).output = T 57 (216 + i.val) ∧
      (entry0814 i).charge = charge 56 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0814 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 57) (T 56 (216 + i.val + 1))
      (T 56 (216 + i.val)) (T 57 (216 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0814.entries OriginalRow227TriangleForward0814.checked
    ⟨i.val, by rw [size0814]; exact i.isLt⟩
  change (entry0814 i).check = true at h
  rcases fields0814 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0815 : OriginalRow227TriangleForward0815.entries.size = 32 := rfl

def entry0815 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0815.entries[i.val]'(by rw [size0815]; exact i.isLt)

theorem fields0815 (i : Fin 32) :
    (entry0815 i).IA = shift ∧ (entry0815 i).ID = S (248 + i.val + 1) ∧
      (entry0815 i).IC = S 57 ∧ (entry0815 i).Inext = T 56 (248 + i.val + 1) ∧
      (entry0815 i).Icur = T 56 (248 + i.val) ∧
      (entry0815 i).output = T 57 (248 + i.val) ∧
      (entry0815 i).charge = charge 56 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0815 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 57) (T 56 (248 + i.val + 1))
      (T 56 (248 + i.val)) (T 57 (248 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0815.entries OriginalRow227TriangleForward0815.checked
    ⟨i.val, by rw [size0815]; exact i.isLt⟩
  change (entry0815 i).check = true at h
  rcases fields0815 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0816 : OriginalRow227TriangleForward0816.entries.size = 32 := rfl

def entry0816 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0816.entries[i.val]'(by rw [size0816]; exact i.isLt)

theorem fields0816 (i : Fin 32) :
    (entry0816 i).IA = shift ∧ (entry0816 i).ID = S (280 + i.val + 1) ∧
      (entry0816 i).IC = S 57 ∧ (entry0816 i).Inext = T 56 (280 + i.val + 1) ∧
      (entry0816 i).Icur = T 56 (280 + i.val) ∧
      (entry0816 i).output = T 57 (280 + i.val) ∧
      (entry0816 i).charge = charge 56 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0816 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 57) (T 56 (280 + i.val + 1))
      (T 56 (280 + i.val)) (T 57 (280 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0816.entries OriginalRow227TriangleForward0816.checked
    ⟨i.val, by rw [size0816]; exact i.isLt⟩
  change (entry0816 i).check = true at h
  rcases fields0816 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0817 : OriginalRow227TriangleForward0817.entries.size = 32 := rfl

def entry0817 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0817.entries[i.val]'(by rw [size0817]; exact i.isLt)

theorem fields0817 (i : Fin 32) :
    (entry0817 i).IA = shift ∧ (entry0817 i).ID = S (312 + i.val + 1) ∧
      (entry0817 i).IC = S 57 ∧ (entry0817 i).Inext = T 56 (312 + i.val + 1) ∧
      (entry0817 i).Icur = T 56 (312 + i.val) ∧
      (entry0817 i).output = T 57 (312 + i.val) ∧
      (entry0817 i).charge = charge 56 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0817 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 57) (T 56 (312 + i.val + 1))
      (T 56 (312 + i.val)) (T 57 (312 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0817.entries OriginalRow227TriangleForward0817.checked
    ⟨i.val, by rw [size0817]; exact i.isLt⟩
  change (entry0817 i).check = true at h
  rcases fields0817 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0818 : OriginalRow227TriangleForward0818.entries.size = 32 := rfl

def entry0818 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0818.entries[i.val]'(by rw [size0818]; exact i.isLt)

theorem fields0818 (i : Fin 32) :
    (entry0818 i).IA = shift ∧ (entry0818 i).ID = S (344 + i.val + 1) ∧
      (entry0818 i).IC = S 57 ∧ (entry0818 i).Inext = T 56 (344 + i.val + 1) ∧
      (entry0818 i).Icur = T 56 (344 + i.val) ∧
      (entry0818 i).output = T 57 (344 + i.val) ∧
      (entry0818 i).charge = charge 56 (344 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0818 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (344 + i.val)) shift
      (S (344 + i.val + 1)) (S 57) (T 56 (344 + i.val + 1))
      (T 56 (344 + i.val)) (T 57 (344 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0818.entries OriginalRow227TriangleForward0818.checked
    ⟨i.val, by rw [size0818]; exact i.isLt⟩
  change (entry0818 i).check = true at h
  rcases fields0818 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0819 : OriginalRow227TriangleForward0819.entries.size = 32 := rfl

def entry0819 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0819.entries[i.val]'(by rw [size0819]; exact i.isLt)

theorem fields0819 (i : Fin 32) :
    (entry0819 i).IA = shift ∧ (entry0819 i).ID = S (376 + i.val + 1) ∧
      (entry0819 i).IC = S 57 ∧ (entry0819 i).Inext = T 56 (376 + i.val + 1) ∧
      (entry0819 i).Icur = T 56 (376 + i.val) ∧
      (entry0819 i).output = T 57 (376 + i.val) ∧
      (entry0819 i).charge = charge 56 (376 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0819 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (376 + i.val)) shift
      (S (376 + i.val + 1)) (S 57) (T 56 (376 + i.val + 1))
      (T 56 (376 + i.val)) (T 57 (376 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0819.entries OriginalRow227TriangleForward0819.checked
    ⟨i.val, by rw [size0819]; exact i.isLt⟩
  change (entry0819 i).check = true at h
  rcases fields0819 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0820 : OriginalRow227TriangleForward0820.entries.size = 32 := rfl

def entry0820 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0820.entries[i.val]'(by rw [size0820]; exact i.isLt)

theorem fields0820 (i : Fin 32) :
    (entry0820 i).IA = shift ∧ (entry0820 i).ID = S (408 + i.val + 1) ∧
      (entry0820 i).IC = S 57 ∧ (entry0820 i).Inext = T 56 (408 + i.val + 1) ∧
      (entry0820 i).Icur = T 56 (408 + i.val) ∧
      (entry0820 i).output = T 57 (408 + i.val) ∧
      (entry0820 i).charge = charge 56 (408 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0820 (i : Fin 32) :
    forwardStepOK (-768) (charge 56 (408 + i.val)) shift
      (S (408 + i.val + 1)) (S 57) (T 56 (408 + i.val + 1))
      (T 56 (408 + i.val)) (T 57 (408 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0820.entries OriginalRow227TriangleForward0820.checked
    ⟨i.val, by rw [size0820]; exact i.isLt⟩
  change (entry0820 i).check = true at h
  rcases fields0820 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0821 : OriginalRow227TriangleForward0821.entries.size = 5 := rfl

def entry0821 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0821.entries[i.val]'(by rw [size0821]; exact i.isLt)

theorem fields0821 (i : Fin 5) :
    (entry0821 i).IA = shift ∧ (entry0821 i).ID = S (440 + i.val + 1) ∧
      (entry0821 i).IC = S 57 ∧ (entry0821 i).Inext = T 56 (440 + i.val + 1) ∧
      (entry0821 i).Icur = T 56 (440 + i.val) ∧
      (entry0821 i).output = T 57 (440 + i.val) ∧
      (entry0821 i).charge = charge 56 (440 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root57).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨4, by decide⟩).symm, rfl⟩

theorem step0821 (i : Fin 5) :
    forwardStepOK (-768) (charge 56 (440 + i.val)) shift
      (S (440 + i.val + 1)) (S 57) (T 56 (440 + i.val + 1))
      (T 56 (440 + i.val)) (T 57 (440 + i.val))
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0821.entries OriginalRow227TriangleForward0821.checked
    ⟨i.val, by rw [size0821]; exact i.isLt⟩
  change (entry0821 i).check = true at h
  rcases fields0821 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 56 ≤ d) (hhi : d < 445) :
    forwardStepOK (-768) (charge 56 d) shift (S (d + 1)) (S 57)
      (T 56 (d + 1)) (T 56 d) (T 57 d)
      (OriginalRow227Roots.root_pos 57 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 56 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h152 : d < 152
    ·
      by_cases h88 : d < 88
      ·
        have hi : d - 56 < 32 := by omega
        have heq : 56 + (d - 56) = d := by omega
        simpa only [heq] using step0809 ⟨d - 56, hi⟩
      ·
        by_cases h120 : d < 120
        ·
          have hi : d - 88 < 32 := by omega
          have heq : 88 + (d - 88) = d := by omega
          simpa only [heq] using step0810 ⟨d - 88, hi⟩
        ·
          have hi : d - 120 < 32 := by omega
          have heq : 120 + (d - 120) = d := by omega
          simpa only [heq] using step0811 ⟨d - 120, hi⟩
    ·
      by_cases h184 : d < 184
      ·
        have hi : d - 152 < 32 := by omega
        have heq : 152 + (d - 152) = d := by omega
        simpa only [heq] using step0812 ⟨d - 152, hi⟩
      ·
        by_cases h216 : d < 216
        ·
          have hi : d - 184 < 32 := by omega
          have heq : 184 + (d - 184) = d := by omega
          simpa only [heq] using step0813 ⟨d - 184, hi⟩
        ·
          have hi : d - 216 < 32 := by omega
          have heq : 216 + (d - 216) = d := by omega
          simpa only [heq] using step0814 ⟨d - 216, hi⟩
  ·
    by_cases h344 : d < 344
    ·
      by_cases h280 : d < 280
      ·
        have hi : d - 248 < 32 := by omega
        have heq : 248 + (d - 248) = d := by omega
        simpa only [heq] using step0815 ⟨d - 248, hi⟩
      ·
        by_cases h312 : d < 312
        ·
          have hi : d - 280 < 32 := by omega
          have heq : 280 + (d - 280) = d := by omega
          simpa only [heq] using step0816 ⟨d - 280, hi⟩
        ·
          have hi : d - 312 < 32 := by omega
          have heq : 312 + (d - 312) = d := by omega
          simpa only [heq] using step0817 ⟨d - 312, hi⟩
    ·
      by_cases h408 : d < 408
      ·
        by_cases h376 : d < 376
        ·
          have hi : d - 344 < 32 := by omega
          have heq : 344 + (d - 344) = d := by omega
          simpa only [heq] using step0818 ⟨d - 344, hi⟩
        ·
          have hi : d - 376 < 32 := by omega
          have heq : 376 + (d - 376) = d := by omega
          simpa only [heq] using step0819 ⟨d - 376, hi⟩
      ·
        by_cases h440 : d < 440
        ·
          have hi : d - 408 < 32 := by omega
          have heq : 408 + (d - 408) = d := by omega
          simpa only [heq] using step0820 ⟨d - 408, hi⟩
        ·
          have hi : d - 440 < 5 := by omega
          have heq : 440 + (d - 440) = d := by omega
          simpa only [heq] using step0821 ⟨d - 440, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0809,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0809,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0810,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0810,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0811,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0811,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0812,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0812,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0813,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0813,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0814,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0814,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0815,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0815,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0816,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0816,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0817,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0817,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0818,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0818,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0819,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0819,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0820,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0820,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.fields0821,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.step0821,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow057
