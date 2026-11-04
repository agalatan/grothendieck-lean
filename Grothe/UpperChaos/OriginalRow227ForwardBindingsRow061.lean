import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow061
import Grothe.UpperChaos.OriginalRow227TriangleForward0860
import Grothe.UpperChaos.OriginalRow227TriangleForward0861
import Grothe.UpperChaos.OriginalRow227TriangleForward0862
import Grothe.UpperChaos.OriginalRow227TriangleForward0863
import Grothe.UpperChaos.OriginalRow227TriangleForward0864
import Grothe.UpperChaos.OriginalRow227TriangleForward0865
import Grothe.UpperChaos.OriginalRow227TriangleForward0866
import Grothe.UpperChaos.OriginalRow227TriangleForward0867
import Grothe.UpperChaos.OriginalRow227TriangleForward0868
import Grothe.UpperChaos.OriginalRow227TriangleForward0869
import Grothe.UpperChaos.OriginalRow227TriangleForward0870
import Grothe.UpperChaos.OriginalRow227TriangleForward0871

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0860 : OriginalRow227TriangleForward0860.entries.size = 32 := rfl

def entry0860 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0860.entries[i.val]'(by rw [size0860]; exact i.isLt)

theorem fields0860 (i : Fin 32) :
    (entry0860 i).IA = shift ∧ (entry0860 i).ID = S (60 + i.val + 1) ∧
      (entry0860 i).IC = S 61 ∧ (entry0860 i).Inext = T 60 (60 + i.val + 1) ∧
      (entry0860 i).Icur = T 60 (60 + i.val) ∧
      (entry0860 i).output = T 61 (60 + i.val) ∧
      (entry0860 i).charge = charge 60 (60 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0876_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0860 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (60 + i.val)) shift
      (S (60 + i.val + 1)) (S 61) (T 60 (60 + i.val + 1))
      (T 60 (60 + i.val)) (T 61 (60 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0860.entries OriginalRow227TriangleForward0860.checked
    ⟨i.val, by rw [size0860]; exact i.isLt⟩
  change (entry0860 i).check = true at h
  rcases fields0860 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0861 : OriginalRow227TriangleForward0861.entries.size = 32 := rfl

def entry0861 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0861.entries[i.val]'(by rw [size0861]; exact i.isLt)

theorem fields0861 (i : Fin 32) :
    (entry0861 i).IA = shift ∧ (entry0861 i).ID = S (92 + i.val + 1) ∧
      (entry0861 i).IC = S 61 ∧ (entry0861 i).Inext = T 60 (92 + i.val + 1) ∧
      (entry0861 i).Icur = T 60 (92 + i.val) ∧
      (entry0861 i).output = T 61 (92 + i.val) ∧
      (entry0861 i).charge = charge 60 (92 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0877_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0861 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (92 + i.val)) shift
      (S (92 + i.val + 1)) (S 61) (T 60 (92 + i.val + 1))
      (T 60 (92 + i.val)) (T 61 (92 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0861.entries OriginalRow227TriangleForward0861.checked
    ⟨i.val, by rw [size0861]; exact i.isLt⟩
  change (entry0861 i).check = true at h
  rcases fields0861 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0862 : OriginalRow227TriangleForward0862.entries.size = 32 := rfl

def entry0862 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0862.entries[i.val]'(by rw [size0862]; exact i.isLt)

theorem fields0862 (i : Fin 32) :
    (entry0862 i).IA = shift ∧ (entry0862 i).ID = S (124 + i.val + 1) ∧
      (entry0862 i).IC = S 61 ∧ (entry0862 i).Inext = T 60 (124 + i.val + 1) ∧
      (entry0862 i).Icur = T 60 (124 + i.val) ∧
      (entry0862 i).output = T 61 (124 + i.val) ∧
      (entry0862 i).charge = charge 60 (124 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0878_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0862 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (124 + i.val)) shift
      (S (124 + i.val + 1)) (S 61) (T 60 (124 + i.val + 1))
      (T 60 (124 + i.val)) (T 61 (124 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0862.entries OriginalRow227TriangleForward0862.checked
    ⟨i.val, by rw [size0862]; exact i.isLt⟩
  change (entry0862 i).check = true at h
  rcases fields0862 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0863 : OriginalRow227TriangleForward0863.entries.size = 32 := rfl

def entry0863 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0863.entries[i.val]'(by rw [size0863]; exact i.isLt)

theorem fields0863 (i : Fin 32) :
    (entry0863 i).IA = shift ∧ (entry0863 i).ID = S (156 + i.val + 1) ∧
      (entry0863 i).IC = S 61 ∧ (entry0863 i).Inext = T 60 (156 + i.val + 1) ∧
      (entry0863 i).Icur = T 60 (156 + i.val) ∧
      (entry0863 i).output = T 61 (156 + i.val) ∧
      (entry0863 i).charge = charge 60 (156 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0879_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0863 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (156 + i.val)) shift
      (S (156 + i.val + 1)) (S 61) (T 60 (156 + i.val + 1))
      (T 60 (156 + i.val)) (T 61 (156 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0863.entries OriginalRow227TriangleForward0863.checked
    ⟨i.val, by rw [size0863]; exact i.isLt⟩
  change (entry0863 i).check = true at h
  rcases fields0863 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0864 : OriginalRow227TriangleForward0864.entries.size = 32 := rfl

def entry0864 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0864.entries[i.val]'(by rw [size0864]; exact i.isLt)

theorem fields0864 (i : Fin 32) :
    (entry0864 i).IA = shift ∧ (entry0864 i).ID = S (188 + i.val + 1) ∧
      (entry0864 i).IC = S 61 ∧ (entry0864 i).Inext = T 60 (188 + i.val + 1) ∧
      (entry0864 i).Icur = T 60 (188 + i.val) ∧
      (entry0864 i).output = T 61 (188 + i.val) ∧
      (entry0864 i).charge = charge 60 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0880_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0864 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 61) (T 60 (188 + i.val + 1))
      (T 60 (188 + i.val)) (T 61 (188 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0864.entries OriginalRow227TriangleForward0864.checked
    ⟨i.val, by rw [size0864]; exact i.isLt⟩
  change (entry0864 i).check = true at h
  rcases fields0864 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0865 : OriginalRow227TriangleForward0865.entries.size = 32 := rfl

def entry0865 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0865.entries[i.val]'(by rw [size0865]; exact i.isLt)

theorem fields0865 (i : Fin 32) :
    (entry0865 i).IA = shift ∧ (entry0865 i).ID = S (220 + i.val + 1) ∧
      (entry0865 i).IC = S 61 ∧ (entry0865 i).Inext = T 60 (220 + i.val + 1) ∧
      (entry0865 i).Icur = T 60 (220 + i.val) ∧
      (entry0865 i).output = T 61 (220 + i.val) ∧
      (entry0865 i).charge = charge 60 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0881_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0865 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 61) (T 60 (220 + i.val + 1))
      (T 60 (220 + i.val)) (T 61 (220 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0865.entries OriginalRow227TriangleForward0865.checked
    ⟨i.val, by rw [size0865]; exact i.isLt⟩
  change (entry0865 i).check = true at h
  rcases fields0865 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0866 : OriginalRow227TriangleForward0866.entries.size = 32 := rfl

def entry0866 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0866.entries[i.val]'(by rw [size0866]; exact i.isLt)

theorem fields0866 (i : Fin 32) :
    (entry0866 i).IA = shift ∧ (entry0866 i).ID = S (252 + i.val + 1) ∧
      (entry0866 i).IC = S 61 ∧ (entry0866 i).Inext = T 60 (252 + i.val + 1) ∧
      (entry0866 i).Icur = T 60 (252 + i.val) ∧
      (entry0866 i).output = T 61 (252 + i.val) ∧
      (entry0866 i).charge = charge 60 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0882_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0866 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 61) (T 60 (252 + i.val + 1))
      (T 60 (252 + i.val)) (T 61 (252 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0866.entries OriginalRow227TriangleForward0866.checked
    ⟨i.val, by rw [size0866]; exact i.isLt⟩
  change (entry0866 i).check = true at h
  rcases fields0866 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0867 : OriginalRow227TriangleForward0867.entries.size = 32 := rfl

def entry0867 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0867.entries[i.val]'(by rw [size0867]; exact i.isLt)

theorem fields0867 (i : Fin 32) :
    (entry0867 i).IA = shift ∧ (entry0867 i).ID = S (284 + i.val + 1) ∧
      (entry0867 i).IC = S 61 ∧ (entry0867 i).Inext = T 60 (284 + i.val + 1) ∧
      (entry0867 i).Icur = T 60 (284 + i.val) ∧
      (entry0867 i).output = T 61 (284 + i.val) ∧
      (entry0867 i).charge = charge 60 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0883_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0867 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 61) (T 60 (284 + i.val + 1))
      (T 60 (284 + i.val)) (T 61 (284 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0867.entries OriginalRow227TriangleForward0867.checked
    ⟨i.val, by rw [size0867]; exact i.isLt⟩
  change (entry0867 i).check = true at h
  rcases fields0867 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0868 : OriginalRow227TriangleForward0868.entries.size = 32 := rfl

def entry0868 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0868.entries[i.val]'(by rw [size0868]; exact i.isLt)

theorem fields0868 (i : Fin 32) :
    (entry0868 i).IA = shift ∧ (entry0868 i).ID = S (316 + i.val + 1) ∧
      (entry0868 i).IC = S 61 ∧ (entry0868 i).Inext = T 60 (316 + i.val + 1) ∧
      (entry0868 i).Icur = T 60 (316 + i.val) ∧
      (entry0868 i).output = T 61 (316 + i.val) ∧
      (entry0868 i).charge = charge 60 (316 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0884_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0868 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (316 + i.val)) shift
      (S (316 + i.val + 1)) (S 61) (T 60 (316 + i.val + 1))
      (T 60 (316 + i.val)) (T 61 (316 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0868.entries OriginalRow227TriangleForward0868.checked
    ⟨i.val, by rw [size0868]; exact i.isLt⟩
  change (entry0868 i).check = true at h
  rcases fields0868 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0869 : OriginalRow227TriangleForward0869.entries.size = 32 := rfl

def entry0869 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0869.entries[i.val]'(by rw [size0869]; exact i.isLt)

theorem fields0869 (i : Fin 32) :
    (entry0869 i).IA = shift ∧ (entry0869 i).ID = S (348 + i.val + 1) ∧
      (entry0869 i).IC = S 61 ∧ (entry0869 i).Inext = T 60 (348 + i.val + 1) ∧
      (entry0869 i).Icur = T 60 (348 + i.val) ∧
      (entry0869 i).output = T 61 (348 + i.val) ∧
      (entry0869 i).charge = charge 60 (348 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0885_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0869 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (348 + i.val)) shift
      (S (348 + i.val + 1)) (S 61) (T 60 (348 + i.val + 1))
      (T 60 (348 + i.val)) (T 61 (348 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0869.entries OriginalRow227TriangleForward0869.checked
    ⟨i.val, by rw [size0869]; exact i.isLt⟩
  change (entry0869 i).check = true at h
  rcases fields0869 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0870 : OriginalRow227TriangleForward0870.entries.size = 32 := rfl

def entry0870 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0870.entries[i.val]'(by rw [size0870]; exact i.isLt)

theorem fields0870 (i : Fin 32) :
    (entry0870 i).IA = shift ∧ (entry0870 i).ID = S (380 + i.val + 1) ∧
      (entry0870 i).IC = S 61 ∧ (entry0870 i).Inext = T 60 (380 + i.val + 1) ∧
      (entry0870 i).Icur = T 60 (380 + i.val) ∧
      (entry0870 i).output = T 61 (380 + i.val) ∧
      (entry0870 i).charge = charge 60 (380 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0886_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0870 (i : Fin 32) :
    forwardStepOK (-768) (charge 60 (380 + i.val)) shift
      (S (380 + i.val + 1)) (S 61) (T 60 (380 + i.val + 1))
      (T 60 (380 + i.val)) (T 61 (380 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0870.entries OriginalRow227TriangleForward0870.checked
    ⟨i.val, by rw [size0870]; exact i.isLt⟩
  change (entry0870 i).check = true at h
  rcases fields0870 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0871 : OriginalRow227TriangleForward0871.entries.size = 29 := rfl

def entry0871 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0871.entries[i.val]'(by rw [size0871]; exact i.isLt)

theorem fields0871 (i : Fin 29) :
    (entry0871 i).IA = shift ∧ (entry0871 i).ID = S (412 + i.val + 1) ∧
      (entry0871 i).IC = S 61 ∧ (entry0871 i).Inext = T 60 (412 + i.val + 1) ∧
      (entry0871 i).Icur = T 60 (412 + i.val) ∧
      (entry0871 i).output = T 61 (412 + i.val) ∧
      (entry0871 i).charge = charge 60 (412 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root61).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow061.block0887_value ⟨28, by decide⟩).symm, rfl⟩

theorem step0871 (i : Fin 29) :
    forwardStepOK (-768) (charge 60 (412 + i.val)) shift
      (S (412 + i.val + 1)) (S 61) (T 60 (412 + i.val + 1))
      (T 60 (412 + i.val)) (T 61 (412 + i.val))
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0871.entries OriginalRow227TriangleForward0871.checked
    ⟨i.val, by rw [size0871]; exact i.isLt⟩
  change (entry0871 i).check = true at h
  rcases fields0871 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 60 ≤ d) (hhi : d < 441) :
    forwardStepOK (-768) (charge 60 d) shift (S (d + 1)) (S 61)
      (T 60 (d + 1)) (T 60 d) (T 61 d)
      (OriginalRow227Roots.root_pos 61 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 60 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h156 : d < 156
    ·
      by_cases h92 : d < 92
      ·
        have hi : d - 60 < 32 := by omega
        have heq : 60 + (d - 60) = d := by omega
        simpa only [heq] using step0860 ⟨d - 60, hi⟩
      ·
        by_cases h124 : d < 124
        ·
          have hi : d - 92 < 32 := by omega
          have heq : 92 + (d - 92) = d := by omega
          simpa only [heq] using step0861 ⟨d - 92, hi⟩
        ·
          have hi : d - 124 < 32 := by omega
          have heq : 124 + (d - 124) = d := by omega
          simpa only [heq] using step0862 ⟨d - 124, hi⟩
    ·
      by_cases h188 : d < 188
      ·
        have hi : d - 156 < 32 := by omega
        have heq : 156 + (d - 156) = d := by omega
        simpa only [heq] using step0863 ⟨d - 156, hi⟩
      ·
        by_cases h220 : d < 220
        ·
          have hi : d - 188 < 32 := by omega
          have heq : 188 + (d - 188) = d := by omega
          simpa only [heq] using step0864 ⟨d - 188, hi⟩
        ·
          have hi : d - 220 < 32 := by omega
          have heq : 220 + (d - 220) = d := by omega
          simpa only [heq] using step0865 ⟨d - 220, hi⟩
  ·
    by_cases h348 : d < 348
    ·
      by_cases h284 : d < 284
      ·
        have hi : d - 252 < 32 := by omega
        have heq : 252 + (d - 252) = d := by omega
        simpa only [heq] using step0866 ⟨d - 252, hi⟩
      ·
        by_cases h316 : d < 316
        ·
          have hi : d - 284 < 32 := by omega
          have heq : 284 + (d - 284) = d := by omega
          simpa only [heq] using step0867 ⟨d - 284, hi⟩
        ·
          have hi : d - 316 < 32 := by omega
          have heq : 316 + (d - 316) = d := by omega
          simpa only [heq] using step0868 ⟨d - 316, hi⟩
    ·
      by_cases h380 : d < 380
      ·
        have hi : d - 348 < 32 := by omega
        have heq : 348 + (d - 348) = d := by omega
        simpa only [heq] using step0869 ⟨d - 348, hi⟩
      ·
        by_cases h412 : d < 412
        ·
          have hi : d - 380 < 32 := by omega
          have heq : 380 + (d - 380) = d := by omega
          simpa only [heq] using step0870 ⟨d - 380, hi⟩
        ·
          have hi : d - 412 < 29 := by omega
          have heq : 412 + (d - 412) = d := by omega
          simpa only [heq] using step0871 ⟨d - 412, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0860,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0860,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0861,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0861,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0862,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0862,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0863,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0863,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0864,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0864,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0865,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0865,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0866,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0866,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0867,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0867,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0868,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0868,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0869,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0869,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0870,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0870,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.fields0871,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.step0871,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow061
