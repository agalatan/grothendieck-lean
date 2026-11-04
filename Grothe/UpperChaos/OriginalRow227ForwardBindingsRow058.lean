import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow057
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058
import Grothe.UpperChaos.OriginalRow227TriangleForward0822
import Grothe.UpperChaos.OriginalRow227TriangleForward0823
import Grothe.UpperChaos.OriginalRow227TriangleForward0824
import Grothe.UpperChaos.OriginalRow227TriangleForward0825
import Grothe.UpperChaos.OriginalRow227TriangleForward0826
import Grothe.UpperChaos.OriginalRow227TriangleForward0827
import Grothe.UpperChaos.OriginalRow227TriangleForward0828
import Grothe.UpperChaos.OriginalRow227TriangleForward0829
import Grothe.UpperChaos.OriginalRow227TriangleForward0830
import Grothe.UpperChaos.OriginalRow227TriangleForward0831
import Grothe.UpperChaos.OriginalRow227TriangleForward0832
import Grothe.UpperChaos.OriginalRow227TriangleForward0833
import Grothe.UpperChaos.OriginalRow227TriangleForward0834

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0822 : OriginalRow227TriangleForward0822.entries.size = 32 := rfl

def entry0822 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0822.entries[i.val]'(by rw [size0822]; exact i.isLt)

theorem fields0822 (i : Fin 32) :
    (entry0822 i).IA = shift ∧ (entry0822 i).ID = S (57 + i.val + 1) ∧
      (entry0822 i).IC = S 58 ∧ (entry0822 i).Inext = T 57 (57 + i.val + 1) ∧
      (entry0822 i).Icur = T 57 (57 + i.val) ∧
      (entry0822 i).output = T 58 (57 + i.val) ∧
      (entry0822 i).charge = charge 57 (57 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0825_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0822 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (57 + i.val)) shift
      (S (57 + i.val + 1)) (S 58) (T 57 (57 + i.val + 1))
      (T 57 (57 + i.val)) (T 58 (57 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0822.entries OriginalRow227TriangleForward0822.checked
    ⟨i.val, by rw [size0822]; exact i.isLt⟩
  change (entry0822 i).check = true at h
  rcases fields0822 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0823 : OriginalRow227TriangleForward0823.entries.size = 32 := rfl

def entry0823 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0823.entries[i.val]'(by rw [size0823]; exact i.isLt)

theorem fields0823 (i : Fin 32) :
    (entry0823 i).IA = shift ∧ (entry0823 i).ID = S (89 + i.val + 1) ∧
      (entry0823 i).IC = S 58 ∧ (entry0823 i).Inext = T 57 (89 + i.val + 1) ∧
      (entry0823 i).Icur = T 57 (89 + i.val) ∧
      (entry0823 i).output = T 58 (89 + i.val) ∧
      (entry0823 i).charge = charge 57 (89 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0826_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0823 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (89 + i.val)) shift
      (S (89 + i.val + 1)) (S 58) (T 57 (89 + i.val + 1))
      (T 57 (89 + i.val)) (T 58 (89 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0823.entries OriginalRow227TriangleForward0823.checked
    ⟨i.val, by rw [size0823]; exact i.isLt⟩
  change (entry0823 i).check = true at h
  rcases fields0823 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0824 : OriginalRow227TriangleForward0824.entries.size = 32 := rfl

def entry0824 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0824.entries[i.val]'(by rw [size0824]; exact i.isLt)

theorem fields0824 (i : Fin 32) :
    (entry0824 i).IA = shift ∧ (entry0824 i).ID = S (121 + i.val + 1) ∧
      (entry0824 i).IC = S 58 ∧ (entry0824 i).Inext = T 57 (121 + i.val + 1) ∧
      (entry0824 i).Icur = T 57 (121 + i.val) ∧
      (entry0824 i).output = T 58 (121 + i.val) ∧
      (entry0824 i).charge = charge 57 (121 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0827_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0824 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (121 + i.val)) shift
      (S (121 + i.val + 1)) (S 58) (T 57 (121 + i.val + 1))
      (T 57 (121 + i.val)) (T 58 (121 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0824.entries OriginalRow227TriangleForward0824.checked
    ⟨i.val, by rw [size0824]; exact i.isLt⟩
  change (entry0824 i).check = true at h
  rcases fields0824 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0825 : OriginalRow227TriangleForward0825.entries.size = 32 := rfl

def entry0825 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0825.entries[i.val]'(by rw [size0825]; exact i.isLt)

theorem fields0825 (i : Fin 32) :
    (entry0825 i).IA = shift ∧ (entry0825 i).ID = S (153 + i.val + 1) ∧
      (entry0825 i).IC = S 58 ∧ (entry0825 i).Inext = T 57 (153 + i.val + 1) ∧
      (entry0825 i).Icur = T 57 (153 + i.val) ∧
      (entry0825 i).output = T 58 (153 + i.val) ∧
      (entry0825 i).charge = charge 57 (153 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0828_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0825 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (153 + i.val)) shift
      (S (153 + i.val + 1)) (S 58) (T 57 (153 + i.val + 1))
      (T 57 (153 + i.val)) (T 58 (153 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0825.entries OriginalRow227TriangleForward0825.checked
    ⟨i.val, by rw [size0825]; exact i.isLt⟩
  change (entry0825 i).check = true at h
  rcases fields0825 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0826 : OriginalRow227TriangleForward0826.entries.size = 32 := rfl

def entry0826 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0826.entries[i.val]'(by rw [size0826]; exact i.isLt)

theorem fields0826 (i : Fin 32) :
    (entry0826 i).IA = shift ∧ (entry0826 i).ID = S (185 + i.val + 1) ∧
      (entry0826 i).IC = S 58 ∧ (entry0826 i).Inext = T 57 (185 + i.val + 1) ∧
      (entry0826 i).Icur = T 57 (185 + i.val) ∧
      (entry0826 i).output = T 58 (185 + i.val) ∧
      (entry0826 i).charge = charge 57 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0829_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0826 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 58) (T 57 (185 + i.val + 1))
      (T 57 (185 + i.val)) (T 58 (185 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0826.entries OriginalRow227TriangleForward0826.checked
    ⟨i.val, by rw [size0826]; exact i.isLt⟩
  change (entry0826 i).check = true at h
  rcases fields0826 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0827 : OriginalRow227TriangleForward0827.entries.size = 32 := rfl

def entry0827 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0827.entries[i.val]'(by rw [size0827]; exact i.isLt)

theorem fields0827 (i : Fin 32) :
    (entry0827 i).IA = shift ∧ (entry0827 i).ID = S (217 + i.val + 1) ∧
      (entry0827 i).IC = S 58 ∧ (entry0827 i).Inext = T 57 (217 + i.val + 1) ∧
      (entry0827 i).Icur = T 57 (217 + i.val) ∧
      (entry0827 i).output = T 58 (217 + i.val) ∧
      (entry0827 i).charge = charge 57 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0830_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0827 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 58) (T 57 (217 + i.val + 1))
      (T 57 (217 + i.val)) (T 58 (217 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0827.entries OriginalRow227TriangleForward0827.checked
    ⟨i.val, by rw [size0827]; exact i.isLt⟩
  change (entry0827 i).check = true at h
  rcases fields0827 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0828 : OriginalRow227TriangleForward0828.entries.size = 32 := rfl

def entry0828 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0828.entries[i.val]'(by rw [size0828]; exact i.isLt)

theorem fields0828 (i : Fin 32) :
    (entry0828 i).IA = shift ∧ (entry0828 i).ID = S (249 + i.val + 1) ∧
      (entry0828 i).IC = S 58 ∧ (entry0828 i).Inext = T 57 (249 + i.val + 1) ∧
      (entry0828 i).Icur = T 57 (249 + i.val) ∧
      (entry0828 i).output = T 58 (249 + i.val) ∧
      (entry0828 i).charge = charge 57 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0831_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0828 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 58) (T 57 (249 + i.val + 1))
      (T 57 (249 + i.val)) (T 58 (249 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0828.entries OriginalRow227TriangleForward0828.checked
    ⟨i.val, by rw [size0828]; exact i.isLt⟩
  change (entry0828 i).check = true at h
  rcases fields0828 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0829 : OriginalRow227TriangleForward0829.entries.size = 32 := rfl

def entry0829 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0829.entries[i.val]'(by rw [size0829]; exact i.isLt)

theorem fields0829 (i : Fin 32) :
    (entry0829 i).IA = shift ∧ (entry0829 i).ID = S (281 + i.val + 1) ∧
      (entry0829 i).IC = S 58 ∧ (entry0829 i).Inext = T 57 (281 + i.val + 1) ∧
      (entry0829 i).Icur = T 57 (281 + i.val) ∧
      (entry0829 i).output = T 58 (281 + i.val) ∧
      (entry0829 i).charge = charge 57 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0832_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0829 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 58) (T 57 (281 + i.val + 1))
      (T 57 (281 + i.val)) (T 58 (281 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0829.entries OriginalRow227TriangleForward0829.checked
    ⟨i.val, by rw [size0829]; exact i.isLt⟩
  change (entry0829 i).check = true at h
  rcases fields0829 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0830 : OriginalRow227TriangleForward0830.entries.size = 32 := rfl

def entry0830 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0830.entries[i.val]'(by rw [size0830]; exact i.isLt)

theorem fields0830 (i : Fin 32) :
    (entry0830 i).IA = shift ∧ (entry0830 i).ID = S (313 + i.val + 1) ∧
      (entry0830 i).IC = S 58 ∧ (entry0830 i).Inext = T 57 (313 + i.val + 1) ∧
      (entry0830 i).Icur = T 57 (313 + i.val) ∧
      (entry0830 i).output = T 58 (313 + i.val) ∧
      (entry0830 i).charge = charge 57 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0833_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0830 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 58) (T 57 (313 + i.val + 1))
      (T 57 (313 + i.val)) (T 58 (313 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0830.entries OriginalRow227TriangleForward0830.checked
    ⟨i.val, by rw [size0830]; exact i.isLt⟩
  change (entry0830 i).check = true at h
  rcases fields0830 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0831 : OriginalRow227TriangleForward0831.entries.size = 32 := rfl

def entry0831 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0831.entries[i.val]'(by rw [size0831]; exact i.isLt)

theorem fields0831 (i : Fin 32) :
    (entry0831 i).IA = shift ∧ (entry0831 i).ID = S (345 + i.val + 1) ∧
      (entry0831 i).IC = S 58 ∧ (entry0831 i).Inext = T 57 (345 + i.val + 1) ∧
      (entry0831 i).Icur = T 57 (345 + i.val) ∧
      (entry0831 i).output = T 58 (345 + i.val) ∧
      (entry0831 i).charge = charge 57 (345 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0834_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0831 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (345 + i.val)) shift
      (S (345 + i.val + 1)) (S 58) (T 57 (345 + i.val + 1))
      (T 57 (345 + i.val)) (T 58 (345 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0831.entries OriginalRow227TriangleForward0831.checked
    ⟨i.val, by rw [size0831]; exact i.isLt⟩
  change (entry0831 i).check = true at h
  rcases fields0831 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0832 : OriginalRow227TriangleForward0832.entries.size = 32 := rfl

def entry0832 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0832.entries[i.val]'(by rw [size0832]; exact i.isLt)

theorem fields0832 (i : Fin 32) :
    (entry0832 i).IA = shift ∧ (entry0832 i).ID = S (377 + i.val + 1) ∧
      (entry0832 i).IC = S 58 ∧ (entry0832 i).Inext = T 57 (377 + i.val + 1) ∧
      (entry0832 i).Icur = T 57 (377 + i.val) ∧
      (entry0832 i).output = T 58 (377 + i.val) ∧
      (entry0832 i).charge = charge 57 (377 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0835_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0832 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (377 + i.val)) shift
      (S (377 + i.val + 1)) (S 58) (T 57 (377 + i.val + 1))
      (T 57 (377 + i.val)) (T 58 (377 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0832.entries OriginalRow227TriangleForward0832.checked
    ⟨i.val, by rw [size0832]; exact i.isLt⟩
  change (entry0832 i).check = true at h
  rcases fields0832 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0833 : OriginalRow227TriangleForward0833.entries.size = 32 := rfl

def entry0833 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0833.entries[i.val]'(by rw [size0833]; exact i.isLt)

theorem fields0833 (i : Fin 32) :
    (entry0833 i).IA = shift ∧ (entry0833 i).ID = S (409 + i.val + 1) ∧
      (entry0833 i).IC = S 58 ∧ (entry0833 i).Inext = T 57 (409 + i.val + 1) ∧
      (entry0833 i).Icur = T 57 (409 + i.val) ∧
      (entry0833 i).output = T 58 (409 + i.val) ∧
      (entry0833 i).charge = charge 57 (409 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0836_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0833 (i : Fin 32) :
    forwardStepOK (-768) (charge 57 (409 + i.val)) shift
      (S (409 + i.val + 1)) (S 58) (T 57 (409 + i.val + 1))
      (T 57 (409 + i.val)) (T 58 (409 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0833.entries OriginalRow227TriangleForward0833.checked
    ⟨i.val, by rw [size0833]; exact i.isLt⟩
  change (entry0833 i).check = true at h
  rcases fields0833 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0834 : OriginalRow227TriangleForward0834.entries.size = 3 := rfl

def entry0834 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0834.entries[i.val]'(by rw [size0834]; exact i.isLt)

theorem fields0834 (i : Fin 3) :
    (entry0834 i).IA = shift ∧ (entry0834 i).ID = S (441 + i.val + 1) ∧
      (entry0834 i).IC = S 58 ∧ (entry0834 i).Inext = T 57 (441 + i.val + 1) ∧
      (entry0834 i).Icur = T 57 (441 + i.val) ∧
      (entry0834 i).output = T 58 (441 + i.val) ∧
      (entry0834 i).charge = charge 57 (441 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root58).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow057.block0837_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨2, by decide⟩).symm, rfl⟩

theorem step0834 (i : Fin 3) :
    forwardStepOK (-768) (charge 57 (441 + i.val)) shift
      (S (441 + i.val + 1)) (S 58) (T 57 (441 + i.val + 1))
      (T 57 (441 + i.val)) (T 58 (441 + i.val))
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0834.entries OriginalRow227TriangleForward0834.checked
    ⟨i.val, by rw [size0834]; exact i.isLt⟩
  change (entry0834 i).check = true at h
  rcases fields0834 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 57 ≤ d) (hhi : d < 444) :
    forwardStepOK (-768) (charge 57 d) shift (S (d + 1)) (S 58)
      (T 57 (d + 1)) (T 57 d) (T 58 d)
      (OriginalRow227Roots.root_pos 58 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 57 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h153 : d < 153
    ·
      by_cases h89 : d < 89
      ·
        have hi : d - 57 < 32 := by omega
        have heq : 57 + (d - 57) = d := by omega
        simpa only [heq] using step0822 ⟨d - 57, hi⟩
      ·
        by_cases h121 : d < 121
        ·
          have hi : d - 89 < 32 := by omega
          have heq : 89 + (d - 89) = d := by omega
          simpa only [heq] using step0823 ⟨d - 89, hi⟩
        ·
          have hi : d - 121 < 32 := by omega
          have heq : 121 + (d - 121) = d := by omega
          simpa only [heq] using step0824 ⟨d - 121, hi⟩
    ·
      by_cases h185 : d < 185
      ·
        have hi : d - 153 < 32 := by omega
        have heq : 153 + (d - 153) = d := by omega
        simpa only [heq] using step0825 ⟨d - 153, hi⟩
      ·
        by_cases h217 : d < 217
        ·
          have hi : d - 185 < 32 := by omega
          have heq : 185 + (d - 185) = d := by omega
          simpa only [heq] using step0826 ⟨d - 185, hi⟩
        ·
          have hi : d - 217 < 32 := by omega
          have heq : 217 + (d - 217) = d := by omega
          simpa only [heq] using step0827 ⟨d - 217, hi⟩
  ·
    by_cases h345 : d < 345
    ·
      by_cases h281 : d < 281
      ·
        have hi : d - 249 < 32 := by omega
        have heq : 249 + (d - 249) = d := by omega
        simpa only [heq] using step0828 ⟨d - 249, hi⟩
      ·
        by_cases h313 : d < 313
        ·
          have hi : d - 281 < 32 := by omega
          have heq : 281 + (d - 281) = d := by omega
          simpa only [heq] using step0829 ⟨d - 281, hi⟩
        ·
          have hi : d - 313 < 32 := by omega
          have heq : 313 + (d - 313) = d := by omega
          simpa only [heq] using step0830 ⟨d - 313, hi⟩
    ·
      by_cases h409 : d < 409
      ·
        by_cases h377 : d < 377
        ·
          have hi : d - 345 < 32 := by omega
          have heq : 345 + (d - 345) = d := by omega
          simpa only [heq] using step0831 ⟨d - 345, hi⟩
        ·
          have hi : d - 377 < 32 := by omega
          have heq : 377 + (d - 377) = d := by omega
          simpa only [heq] using step0832 ⟨d - 377, hi⟩
      ·
        by_cases h441 : d < 441
        ·
          have hi : d - 409 < 32 := by omega
          have heq : 409 + (d - 409) = d := by omega
          simpa only [heq] using step0833 ⟨d - 409, hi⟩
        ·
          have hi : d - 441 < 3 := by omega
          have heq : 441 + (d - 441) = d := by omega
          simpa only [heq] using step0834 ⟨d - 441, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0822,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0822,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0823,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0823,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0824,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0824,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0825,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0825,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0826,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0826,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0827,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0827,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0828,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0828,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0829,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0829,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0830,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0830,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0831,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0831,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0832,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0832,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0833,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0833,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.fields0834,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.step0834,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow058
