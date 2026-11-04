import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062
import Grothe.UpperChaos.OriginalRow227TriangleForward0872
import Grothe.UpperChaos.OriginalRow227TriangleForward0873
import Grothe.UpperChaos.OriginalRow227TriangleForward0874
import Grothe.UpperChaos.OriginalRow227TriangleForward0875
import Grothe.UpperChaos.OriginalRow227TriangleForward0876
import Grothe.UpperChaos.OriginalRow227TriangleForward0877
import Grothe.UpperChaos.OriginalRow227TriangleForward0878
import Grothe.UpperChaos.OriginalRow227TriangleForward0879
import Grothe.UpperChaos.OriginalRow227TriangleForward0880
import Grothe.UpperChaos.OriginalRow227TriangleForward0881
import Grothe.UpperChaos.OriginalRow227TriangleForward0882
import Grothe.UpperChaos.OriginalRow227TriangleForward0883

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0872 : OriginalRow227TriangleForward0872.entries.size = 32 := rfl

def entry0872 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0872.entries[i.val]'(by rw [size0872]; exact i.isLt)

theorem fields0872 (i : Fin 32) :
    (entry0872 i).IA = shift ∧ (entry0872 i).ID = S (61 + i.val + 1) ∧
      (entry0872 i).IC = S 62 ∧ (entry0872 i).Inext = T 61 (61 + i.val + 1) ∧
      (entry0872 i).Icur = T 61 (61 + i.val) ∧
      (entry0872 i).output = T 62 (61 + i.val) ∧
      (entry0872 i).charge = charge 61 (61 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0872 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (61 + i.val)) shift
      (S (61 + i.val + 1)) (S 62) (T 61 (61 + i.val + 1))
      (T 61 (61 + i.val)) (T 62 (61 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0872.entries OriginalRow227TriangleForward0872.checked
    ⟨i.val, by rw [size0872]; exact i.isLt⟩
  change (entry0872 i).check = true at h
  rcases fields0872 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0873 : OriginalRow227TriangleForward0873.entries.size = 32 := rfl

def entry0873 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0873.entries[i.val]'(by rw [size0873]; exact i.isLt)

theorem fields0873 (i : Fin 32) :
    (entry0873 i).IA = shift ∧ (entry0873 i).ID = S (93 + i.val + 1) ∧
      (entry0873 i).IC = S 62 ∧ (entry0873 i).Inext = T 61 (93 + i.val + 1) ∧
      (entry0873 i).Icur = T 61 (93 + i.val) ∧
      (entry0873 i).output = T 62 (93 + i.val) ∧
      (entry0873 i).charge = charge 61 (93 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0873 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (93 + i.val)) shift
      (S (93 + i.val + 1)) (S 62) (T 61 (93 + i.val + 1))
      (T 61 (93 + i.val)) (T 62 (93 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0873.entries OriginalRow227TriangleForward0873.checked
    ⟨i.val, by rw [size0873]; exact i.isLt⟩
  change (entry0873 i).check = true at h
  rcases fields0873 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0874 : OriginalRow227TriangleForward0874.entries.size = 32 := rfl

def entry0874 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0874.entries[i.val]'(by rw [size0874]; exact i.isLt)

theorem fields0874 (i : Fin 32) :
    (entry0874 i).IA = shift ∧ (entry0874 i).ID = S (125 + i.val + 1) ∧
      (entry0874 i).IC = S 62 ∧ (entry0874 i).Inext = T 61 (125 + i.val + 1) ∧
      (entry0874 i).Icur = T 61 (125 + i.val) ∧
      (entry0874 i).output = T 62 (125 + i.val) ∧
      (entry0874 i).charge = charge 61 (125 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0874 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (125 + i.val)) shift
      (S (125 + i.val + 1)) (S 62) (T 61 (125 + i.val + 1))
      (T 61 (125 + i.val)) (T 62 (125 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0874.entries OriginalRow227TriangleForward0874.checked
    ⟨i.val, by rw [size0874]; exact i.isLt⟩
  change (entry0874 i).check = true at h
  rcases fields0874 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0875 : OriginalRow227TriangleForward0875.entries.size = 32 := rfl

def entry0875 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0875.entries[i.val]'(by rw [size0875]; exact i.isLt)

theorem fields0875 (i : Fin 32) :
    (entry0875 i).IA = shift ∧ (entry0875 i).ID = S (157 + i.val + 1) ∧
      (entry0875 i).IC = S 62 ∧ (entry0875 i).Inext = T 61 (157 + i.val + 1) ∧
      (entry0875 i).Icur = T 61 (157 + i.val) ∧
      (entry0875 i).output = T 62 (157 + i.val) ∧
      (entry0875 i).charge = charge 61 (157 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0875 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (157 + i.val)) shift
      (S (157 + i.val + 1)) (S 62) (T 61 (157 + i.val + 1))
      (T 61 (157 + i.val)) (T 62 (157 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0875.entries OriginalRow227TriangleForward0875.checked
    ⟨i.val, by rw [size0875]; exact i.isLt⟩
  change (entry0875 i).check = true at h
  rcases fields0875 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0876 : OriginalRow227TriangleForward0876.entries.size = 32 := rfl

def entry0876 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0876.entries[i.val]'(by rw [size0876]; exact i.isLt)

theorem fields0876 (i : Fin 32) :
    (entry0876 i).IA = shift ∧ (entry0876 i).ID = S (189 + i.val + 1) ∧
      (entry0876 i).IC = S 62 ∧ (entry0876 i).Inext = T 61 (189 + i.val + 1) ∧
      (entry0876 i).Icur = T 61 (189 + i.val) ∧
      (entry0876 i).output = T 62 (189 + i.val) ∧
      (entry0876 i).charge = charge 61 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0876 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 62) (T 61 (189 + i.val + 1))
      (T 61 (189 + i.val)) (T 62 (189 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0876.entries OriginalRow227TriangleForward0876.checked
    ⟨i.val, by rw [size0876]; exact i.isLt⟩
  change (entry0876 i).check = true at h
  rcases fields0876 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0877 : OriginalRow227TriangleForward0877.entries.size = 32 := rfl

def entry0877 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0877.entries[i.val]'(by rw [size0877]; exact i.isLt)

theorem fields0877 (i : Fin 32) :
    (entry0877 i).IA = shift ∧ (entry0877 i).ID = S (221 + i.val + 1) ∧
      (entry0877 i).IC = S 62 ∧ (entry0877 i).Inext = T 61 (221 + i.val + 1) ∧
      (entry0877 i).Icur = T 61 (221 + i.val) ∧
      (entry0877 i).output = T 62 (221 + i.val) ∧
      (entry0877 i).charge = charge 61 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0877 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 62) (T 61 (221 + i.val + 1))
      (T 61 (221 + i.val)) (T 62 (221 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0877.entries OriginalRow227TriangleForward0877.checked
    ⟨i.val, by rw [size0877]; exact i.isLt⟩
  change (entry0877 i).check = true at h
  rcases fields0877 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0878 : OriginalRow227TriangleForward0878.entries.size = 32 := rfl

def entry0878 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0878.entries[i.val]'(by rw [size0878]; exact i.isLt)

theorem fields0878 (i : Fin 32) :
    (entry0878 i).IA = shift ∧ (entry0878 i).ID = S (253 + i.val + 1) ∧
      (entry0878 i).IC = S 62 ∧ (entry0878 i).Inext = T 61 (253 + i.val + 1) ∧
      (entry0878 i).Icur = T 61 (253 + i.val) ∧
      (entry0878 i).output = T 62 (253 + i.val) ∧
      (entry0878 i).charge = charge 61 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0878 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 62) (T 61 (253 + i.val + 1))
      (T 61 (253 + i.val)) (T 62 (253 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0878.entries OriginalRow227TriangleForward0878.checked
    ⟨i.val, by rw [size0878]; exact i.isLt⟩
  change (entry0878 i).check = true at h
  rcases fields0878 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0879 : OriginalRow227TriangleForward0879.entries.size = 32 := rfl

def entry0879 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0879.entries[i.val]'(by rw [size0879]; exact i.isLt)

theorem fields0879 (i : Fin 32) :
    (entry0879 i).IA = shift ∧ (entry0879 i).ID = S (285 + i.val + 1) ∧
      (entry0879 i).IC = S 62 ∧ (entry0879 i).Inext = T 61 (285 + i.val + 1) ∧
      (entry0879 i).Icur = T 61 (285 + i.val) ∧
      (entry0879 i).output = T 62 (285 + i.val) ∧
      (entry0879 i).charge = charge 61 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0879 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 62) (T 61 (285 + i.val + 1))
      (T 61 (285 + i.val)) (T 62 (285 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0879.entries OriginalRow227TriangleForward0879.checked
    ⟨i.val, by rw [size0879]; exact i.isLt⟩
  change (entry0879 i).check = true at h
  rcases fields0879 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0880 : OriginalRow227TriangleForward0880.entries.size = 32 := rfl

def entry0880 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0880.entries[i.val]'(by rw [size0880]; exact i.isLt)

theorem fields0880 (i : Fin 32) :
    (entry0880 i).IA = shift ∧ (entry0880 i).ID = S (317 + i.val + 1) ∧
      (entry0880 i).IC = S 62 ∧ (entry0880 i).Inext = T 61 (317 + i.val + 1) ∧
      (entry0880 i).Icur = T 61 (317 + i.val) ∧
      (entry0880 i).output = T 62 (317 + i.val) ∧
      (entry0880 i).charge = charge 61 (317 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0880 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (317 + i.val)) shift
      (S (317 + i.val + 1)) (S 62) (T 61 (317 + i.val + 1))
      (T 61 (317 + i.val)) (T 62 (317 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0880.entries OriginalRow227TriangleForward0880.checked
    ⟨i.val, by rw [size0880]; exact i.isLt⟩
  change (entry0880 i).check = true at h
  rcases fields0880 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0881 : OriginalRow227TriangleForward0881.entries.size = 32 := rfl

def entry0881 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0881.entries[i.val]'(by rw [size0881]; exact i.isLt)

theorem fields0881 (i : Fin 32) :
    (entry0881 i).IA = shift ∧ (entry0881 i).ID = S (349 + i.val + 1) ∧
      (entry0881 i).IC = S 62 ∧ (entry0881 i).Inext = T 61 (349 + i.val + 1) ∧
      (entry0881 i).Icur = T 61 (349 + i.val) ∧
      (entry0881 i).output = T 62 (349 + i.val) ∧
      (entry0881 i).charge = charge 61 (349 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0881 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (349 + i.val)) shift
      (S (349 + i.val + 1)) (S 62) (T 61 (349 + i.val + 1))
      (T 61 (349 + i.val)) (T 62 (349 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0881.entries OriginalRow227TriangleForward0881.checked
    ⟨i.val, by rw [size0881]; exact i.isLt⟩
  change (entry0881 i).check = true at h
  rcases fields0881 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0882 : OriginalRow227TriangleForward0882.entries.size = 32 := rfl

def entry0882 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0882.entries[i.val]'(by rw [size0882]; exact i.isLt)

theorem fields0882 (i : Fin 32) :
    (entry0882 i).IA = shift ∧ (entry0882 i).ID = S (381 + i.val + 1) ∧
      (entry0882 i).IC = S 62 ∧ (entry0882 i).Inext = T 61 (381 + i.val + 1) ∧
      (entry0882 i).Icur = T 61 (381 + i.val) ∧
      (entry0882 i).output = T 62 (381 + i.val) ∧
      (entry0882 i).charge = charge 61 (381 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0882 (i : Fin 32) :
    forwardStepOK (-768) (charge 61 (381 + i.val)) shift
      (S (381 + i.val + 1)) (S 62) (T 61 (381 + i.val + 1))
      (T 61 (381 + i.val)) (T 62 (381 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0882.entries OriginalRow227TriangleForward0882.checked
    ⟨i.val, by rw [size0882]; exact i.isLt⟩
  change (entry0882 i).check = true at h
  rcases fields0882 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0883 : OriginalRow227TriangleForward0883.entries.size = 27 := rfl

def entry0883 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0883.entries[i.val]'(by rw [size0883]; exact i.isLt)

theorem fields0883 (i : Fin 27) :
    (entry0883 i).IA = shift ∧ (entry0883 i).ID = S (413 + i.val + 1) ∧
      (entry0883 i).IC = S 62 ∧ (entry0883 i).Inext = T 61 (413 + i.val + 1) ∧
      (entry0883 i).Icur = T 61 (413 + i.val) ∧
      (entry0883 i).output = T 62 (413 + i.val) ∧
      (entry0883 i).charge = charge 61 (413 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root62).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨26, by decide⟩).symm, rfl⟩

theorem step0883 (i : Fin 27) :
    forwardStepOK (-768) (charge 61 (413 + i.val)) shift
      (S (413 + i.val + 1)) (S 62) (T 61 (413 + i.val + 1))
      (T 61 (413 + i.val)) (T 62 (413 + i.val))
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0883.entries OriginalRow227TriangleForward0883.checked
    ⟨i.val, by rw [size0883]; exact i.isLt⟩
  change (entry0883 i).check = true at h
  rcases fields0883 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 61 ≤ d) (hhi : d < 440) :
    forwardStepOK (-768) (charge 61 d) shift (S (d + 1)) (S 62)
      (T 61 (d + 1)) (T 61 d) (T 62 d)
      (OriginalRow227Roots.root_pos 62 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 61 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h157 : d < 157
    ·
      by_cases h93 : d < 93
      ·
        have hi : d - 61 < 32 := by omega
        have heq : 61 + (d - 61) = d := by omega
        simpa only [heq] using step0872 ⟨d - 61, hi⟩
      ·
        by_cases h125 : d < 125
        ·
          have hi : d - 93 < 32 := by omega
          have heq : 93 + (d - 93) = d := by omega
          simpa only [heq] using step0873 ⟨d - 93, hi⟩
        ·
          have hi : d - 125 < 32 := by omega
          have heq : 125 + (d - 125) = d := by omega
          simpa only [heq] using step0874 ⟨d - 125, hi⟩
    ·
      by_cases h189 : d < 189
      ·
        have hi : d - 157 < 32 := by omega
        have heq : 157 + (d - 157) = d := by omega
        simpa only [heq] using step0875 ⟨d - 157, hi⟩
      ·
        by_cases h221 : d < 221
        ·
          have hi : d - 189 < 32 := by omega
          have heq : 189 + (d - 189) = d := by omega
          simpa only [heq] using step0876 ⟨d - 189, hi⟩
        ·
          have hi : d - 221 < 32 := by omega
          have heq : 221 + (d - 221) = d := by omega
          simpa only [heq] using step0877 ⟨d - 221, hi⟩
  ·
    by_cases h349 : d < 349
    ·
      by_cases h285 : d < 285
      ·
        have hi : d - 253 < 32 := by omega
        have heq : 253 + (d - 253) = d := by omega
        simpa only [heq] using step0878 ⟨d - 253, hi⟩
      ·
        by_cases h317 : d < 317
        ·
          have hi : d - 285 < 32 := by omega
          have heq : 285 + (d - 285) = d := by omega
          simpa only [heq] using step0879 ⟨d - 285, hi⟩
        ·
          have hi : d - 317 < 32 := by omega
          have heq : 317 + (d - 317) = d := by omega
          simpa only [heq] using step0880 ⟨d - 317, hi⟩
    ·
      by_cases h381 : d < 381
      ·
        have hi : d - 349 < 32 := by omega
        have heq : 349 + (d - 349) = d := by omega
        simpa only [heq] using step0881 ⟨d - 349, hi⟩
      ·
        by_cases h413 : d < 413
        ·
          have hi : d - 381 < 32 := by omega
          have heq : 381 + (d - 381) = d := by omega
          simpa only [heq] using step0882 ⟨d - 381, hi⟩
        ·
          have hi : d - 413 < 27 := by omega
          have heq : 413 + (d - 413) = d := by omega
          simpa only [heq] using step0883 ⟨d - 413, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0872,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0872,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0873,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0873,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0874,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0874,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0875,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0875,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0876,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0876,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0877,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0877,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0878,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0878,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0879,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0879,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0880,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0880,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0881,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0881,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0882,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0882,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.fields0883,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.step0883,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow062
