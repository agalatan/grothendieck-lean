import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow058
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059
import Grothe.UpperChaos.OriginalRow227TriangleForward0835
import Grothe.UpperChaos.OriginalRow227TriangleForward0836
import Grothe.UpperChaos.OriginalRow227TriangleForward0837
import Grothe.UpperChaos.OriginalRow227TriangleForward0838
import Grothe.UpperChaos.OriginalRow227TriangleForward0839
import Grothe.UpperChaos.OriginalRow227TriangleForward0840
import Grothe.UpperChaos.OriginalRow227TriangleForward0841
import Grothe.UpperChaos.OriginalRow227TriangleForward0842
import Grothe.UpperChaos.OriginalRow227TriangleForward0843
import Grothe.UpperChaos.OriginalRow227TriangleForward0844
import Grothe.UpperChaos.OriginalRow227TriangleForward0845
import Grothe.UpperChaos.OriginalRow227TriangleForward0846
import Grothe.UpperChaos.OriginalRow227TriangleForward0847

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0835 : OriginalRow227TriangleForward0835.entries.size = 32 := rfl

def entry0835 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0835.entries[i.val]'(by rw [size0835]; exact i.isLt)

theorem fields0835 (i : Fin 32) :
    (entry0835 i).IA = shift ∧ (entry0835 i).ID = S (58 + i.val + 1) ∧
      (entry0835 i).IC = S 59 ∧ (entry0835 i).Inext = T 58 (58 + i.val + 1) ∧
      (entry0835 i).Icur = T 58 (58 + i.val) ∧
      (entry0835 i).output = T 59 (58 + i.val) ∧
      (entry0835 i).charge = charge 58 (58 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0838_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0835 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (58 + i.val)) shift
      (S (58 + i.val + 1)) (S 59) (T 58 (58 + i.val + 1))
      (T 58 (58 + i.val)) (T 59 (58 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0835.entries OriginalRow227TriangleForward0835.checked
    ⟨i.val, by rw [size0835]; exact i.isLt⟩
  change (entry0835 i).check = true at h
  rcases fields0835 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0836 : OriginalRow227TriangleForward0836.entries.size = 32 := rfl

def entry0836 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0836.entries[i.val]'(by rw [size0836]; exact i.isLt)

theorem fields0836 (i : Fin 32) :
    (entry0836 i).IA = shift ∧ (entry0836 i).ID = S (90 + i.val + 1) ∧
      (entry0836 i).IC = S 59 ∧ (entry0836 i).Inext = T 58 (90 + i.val + 1) ∧
      (entry0836 i).Icur = T 58 (90 + i.val) ∧
      (entry0836 i).output = T 59 (90 + i.val) ∧
      (entry0836 i).charge = charge 58 (90 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0839_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0836 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (90 + i.val)) shift
      (S (90 + i.val + 1)) (S 59) (T 58 (90 + i.val + 1))
      (T 58 (90 + i.val)) (T 59 (90 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0836.entries OriginalRow227TriangleForward0836.checked
    ⟨i.val, by rw [size0836]; exact i.isLt⟩
  change (entry0836 i).check = true at h
  rcases fields0836 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0837 : OriginalRow227TriangleForward0837.entries.size = 32 := rfl

def entry0837 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0837.entries[i.val]'(by rw [size0837]; exact i.isLt)

theorem fields0837 (i : Fin 32) :
    (entry0837 i).IA = shift ∧ (entry0837 i).ID = S (122 + i.val + 1) ∧
      (entry0837 i).IC = S 59 ∧ (entry0837 i).Inext = T 58 (122 + i.val + 1) ∧
      (entry0837 i).Icur = T 58 (122 + i.val) ∧
      (entry0837 i).output = T 59 (122 + i.val) ∧
      (entry0837 i).charge = charge 58 (122 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0840_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0837 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (122 + i.val)) shift
      (S (122 + i.val + 1)) (S 59) (T 58 (122 + i.val + 1))
      (T 58 (122 + i.val)) (T 59 (122 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0837.entries OriginalRow227TriangleForward0837.checked
    ⟨i.val, by rw [size0837]; exact i.isLt⟩
  change (entry0837 i).check = true at h
  rcases fields0837 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0838 : OriginalRow227TriangleForward0838.entries.size = 32 := rfl

def entry0838 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0838.entries[i.val]'(by rw [size0838]; exact i.isLt)

theorem fields0838 (i : Fin 32) :
    (entry0838 i).IA = shift ∧ (entry0838 i).ID = S (154 + i.val + 1) ∧
      (entry0838 i).IC = S 59 ∧ (entry0838 i).Inext = T 58 (154 + i.val + 1) ∧
      (entry0838 i).Icur = T 58 (154 + i.val) ∧
      (entry0838 i).output = T 59 (154 + i.val) ∧
      (entry0838 i).charge = charge 58 (154 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0841_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0838 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (154 + i.val)) shift
      (S (154 + i.val + 1)) (S 59) (T 58 (154 + i.val + 1))
      (T 58 (154 + i.val)) (T 59 (154 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0838.entries OriginalRow227TriangleForward0838.checked
    ⟨i.val, by rw [size0838]; exact i.isLt⟩
  change (entry0838 i).check = true at h
  rcases fields0838 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0839 : OriginalRow227TriangleForward0839.entries.size = 32 := rfl

def entry0839 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0839.entries[i.val]'(by rw [size0839]; exact i.isLt)

theorem fields0839 (i : Fin 32) :
    (entry0839 i).IA = shift ∧ (entry0839 i).ID = S (186 + i.val + 1) ∧
      (entry0839 i).IC = S 59 ∧ (entry0839 i).Inext = T 58 (186 + i.val + 1) ∧
      (entry0839 i).Icur = T 58 (186 + i.val) ∧
      (entry0839 i).output = T 59 (186 + i.val) ∧
      (entry0839 i).charge = charge 58 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0842_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0839 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 59) (T 58 (186 + i.val + 1))
      (T 58 (186 + i.val)) (T 59 (186 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0839.entries OriginalRow227TriangleForward0839.checked
    ⟨i.val, by rw [size0839]; exact i.isLt⟩
  change (entry0839 i).check = true at h
  rcases fields0839 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0840 : OriginalRow227TriangleForward0840.entries.size = 32 := rfl

def entry0840 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0840.entries[i.val]'(by rw [size0840]; exact i.isLt)

theorem fields0840 (i : Fin 32) :
    (entry0840 i).IA = shift ∧ (entry0840 i).ID = S (218 + i.val + 1) ∧
      (entry0840 i).IC = S 59 ∧ (entry0840 i).Inext = T 58 (218 + i.val + 1) ∧
      (entry0840 i).Icur = T 58 (218 + i.val) ∧
      (entry0840 i).output = T 59 (218 + i.val) ∧
      (entry0840 i).charge = charge 58 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0843_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0840 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 59) (T 58 (218 + i.val + 1))
      (T 58 (218 + i.val)) (T 59 (218 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0840.entries OriginalRow227TriangleForward0840.checked
    ⟨i.val, by rw [size0840]; exact i.isLt⟩
  change (entry0840 i).check = true at h
  rcases fields0840 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0841 : OriginalRow227TriangleForward0841.entries.size = 32 := rfl

def entry0841 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0841.entries[i.val]'(by rw [size0841]; exact i.isLt)

theorem fields0841 (i : Fin 32) :
    (entry0841 i).IA = shift ∧ (entry0841 i).ID = S (250 + i.val + 1) ∧
      (entry0841 i).IC = S 59 ∧ (entry0841 i).Inext = T 58 (250 + i.val + 1) ∧
      (entry0841 i).Icur = T 58 (250 + i.val) ∧
      (entry0841 i).output = T 59 (250 + i.val) ∧
      (entry0841 i).charge = charge 58 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0844_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0841 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 59) (T 58 (250 + i.val + 1))
      (T 58 (250 + i.val)) (T 59 (250 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0841.entries OriginalRow227TriangleForward0841.checked
    ⟨i.val, by rw [size0841]; exact i.isLt⟩
  change (entry0841 i).check = true at h
  rcases fields0841 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0842 : OriginalRow227TriangleForward0842.entries.size = 32 := rfl

def entry0842 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0842.entries[i.val]'(by rw [size0842]; exact i.isLt)

theorem fields0842 (i : Fin 32) :
    (entry0842 i).IA = shift ∧ (entry0842 i).ID = S (282 + i.val + 1) ∧
      (entry0842 i).IC = S 59 ∧ (entry0842 i).Inext = T 58 (282 + i.val + 1) ∧
      (entry0842 i).Icur = T 58 (282 + i.val) ∧
      (entry0842 i).output = T 59 (282 + i.val) ∧
      (entry0842 i).charge = charge 58 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0845_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0842 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 59) (T 58 (282 + i.val + 1))
      (T 58 (282 + i.val)) (T 59 (282 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0842.entries OriginalRow227TriangleForward0842.checked
    ⟨i.val, by rw [size0842]; exact i.isLt⟩
  change (entry0842 i).check = true at h
  rcases fields0842 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0843 : OriginalRow227TriangleForward0843.entries.size = 32 := rfl

def entry0843 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0843.entries[i.val]'(by rw [size0843]; exact i.isLt)

theorem fields0843 (i : Fin 32) :
    (entry0843 i).IA = shift ∧ (entry0843 i).ID = S (314 + i.val + 1) ∧
      (entry0843 i).IC = S 59 ∧ (entry0843 i).Inext = T 58 (314 + i.val + 1) ∧
      (entry0843 i).Icur = T 58 (314 + i.val) ∧
      (entry0843 i).output = T 59 (314 + i.val) ∧
      (entry0843 i).charge = charge 58 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0846_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0843 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 59) (T 58 (314 + i.val + 1))
      (T 58 (314 + i.val)) (T 59 (314 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0843.entries OriginalRow227TriangleForward0843.checked
    ⟨i.val, by rw [size0843]; exact i.isLt⟩
  change (entry0843 i).check = true at h
  rcases fields0843 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0844 : OriginalRow227TriangleForward0844.entries.size = 32 := rfl

def entry0844 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0844.entries[i.val]'(by rw [size0844]; exact i.isLt)

theorem fields0844 (i : Fin 32) :
    (entry0844 i).IA = shift ∧ (entry0844 i).ID = S (346 + i.val + 1) ∧
      (entry0844 i).IC = S 59 ∧ (entry0844 i).Inext = T 58 (346 + i.val + 1) ∧
      (entry0844 i).Icur = T 58 (346 + i.val) ∧
      (entry0844 i).output = T 59 (346 + i.val) ∧
      (entry0844 i).charge = charge 58 (346 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0847_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0844 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (346 + i.val)) shift
      (S (346 + i.val + 1)) (S 59) (T 58 (346 + i.val + 1))
      (T 58 (346 + i.val)) (T 59 (346 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0844.entries OriginalRow227TriangleForward0844.checked
    ⟨i.val, by rw [size0844]; exact i.isLt⟩
  change (entry0844 i).check = true at h
  rcases fields0844 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0845 : OriginalRow227TriangleForward0845.entries.size = 32 := rfl

def entry0845 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0845.entries[i.val]'(by rw [size0845]; exact i.isLt)

theorem fields0845 (i : Fin 32) :
    (entry0845 i).IA = shift ∧ (entry0845 i).ID = S (378 + i.val + 1) ∧
      (entry0845 i).IC = S 59 ∧ (entry0845 i).Inext = T 58 (378 + i.val + 1) ∧
      (entry0845 i).Icur = T 58 (378 + i.val) ∧
      (entry0845 i).output = T 59 (378 + i.val) ∧
      (entry0845 i).charge = charge 58 (378 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0848_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0845 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (378 + i.val)) shift
      (S (378 + i.val + 1)) (S 59) (T 58 (378 + i.val + 1))
      (T 58 (378 + i.val)) (T 59 (378 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0845.entries OriginalRow227TriangleForward0845.checked
    ⟨i.val, by rw [size0845]; exact i.isLt⟩
  change (entry0845 i).check = true at h
  rcases fields0845 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0846 : OriginalRow227TriangleForward0846.entries.size = 32 := rfl

def entry0846 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0846.entries[i.val]'(by rw [size0846]; exact i.isLt)

theorem fields0846 (i : Fin 32) :
    (entry0846 i).IA = shift ∧ (entry0846 i).ID = S (410 + i.val + 1) ∧
      (entry0846 i).IC = S 59 ∧ (entry0846 i).Inext = T 58 (410 + i.val + 1) ∧
      (entry0846 i).Icur = T 58 (410 + i.val) ∧
      (entry0846 i).output = T 59 (410 + i.val) ∧
      (entry0846 i).charge = charge 58 (410 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0849_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0846 (i : Fin 32) :
    forwardStepOK (-768) (charge 58 (410 + i.val)) shift
      (S (410 + i.val + 1)) (S 59) (T 58 (410 + i.val + 1))
      (T 58 (410 + i.val)) (T 59 (410 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0846.entries OriginalRow227TriangleForward0846.checked
    ⟨i.val, by rw [size0846]; exact i.isLt⟩
  change (entry0846 i).check = true at h
  rcases fields0846 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0847 : OriginalRow227TriangleForward0847.entries.size = 1 := rfl

def entry0847 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0847.entries[i.val]'(by rw [size0847]; exact i.isLt)

theorem fields0847 (i : Fin 1) :
    (entry0847 i).IA = shift ∧ (entry0847 i).ID = S (442 + i.val + 1) ∧
      (entry0847 i).IC = S 59 ∧ (entry0847 i).Inext = T 58 (442 + i.val + 1) ∧
      (entry0847 i).Icur = T 58 (442 + i.val) ∧
      (entry0847 i).output = T 59 (442 + i.val) ∧
      (entry0847 i).charge = charge 58 (442 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root59).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow058.block0850_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0863_value ⟨0, by decide⟩).symm, rfl⟩

theorem step0847 (i : Fin 1) :
    forwardStepOK (-768) (charge 58 (442 + i.val)) shift
      (S (442 + i.val + 1)) (S 59) (T 58 (442 + i.val + 1))
      (T 58 (442 + i.val)) (T 59 (442 + i.val))
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0847.entries OriginalRow227TriangleForward0847.checked
    ⟨i.val, by rw [size0847]; exact i.isLt⟩
  change (entry0847 i).check = true at h
  rcases fields0847 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 58 ≤ d) (hhi : d < 443) :
    forwardStepOK (-768) (charge 58 d) shift (S (d + 1)) (S 59)
      (T 58 (d + 1)) (T 58 d) (T 59 d)
      (OriginalRow227Roots.root_pos 59 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 58 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h154 : d < 154
    ·
      by_cases h90 : d < 90
      ·
        have hi : d - 58 < 32 := by omega
        have heq : 58 + (d - 58) = d := by omega
        simpa only [heq] using step0835 ⟨d - 58, hi⟩
      ·
        by_cases h122 : d < 122
        ·
          have hi : d - 90 < 32 := by omega
          have heq : 90 + (d - 90) = d := by omega
          simpa only [heq] using step0836 ⟨d - 90, hi⟩
        ·
          have hi : d - 122 < 32 := by omega
          have heq : 122 + (d - 122) = d := by omega
          simpa only [heq] using step0837 ⟨d - 122, hi⟩
    ·
      by_cases h186 : d < 186
      ·
        have hi : d - 154 < 32 := by omega
        have heq : 154 + (d - 154) = d := by omega
        simpa only [heq] using step0838 ⟨d - 154, hi⟩
      ·
        by_cases h218 : d < 218
        ·
          have hi : d - 186 < 32 := by omega
          have heq : 186 + (d - 186) = d := by omega
          simpa only [heq] using step0839 ⟨d - 186, hi⟩
        ·
          have hi : d - 218 < 32 := by omega
          have heq : 218 + (d - 218) = d := by omega
          simpa only [heq] using step0840 ⟨d - 218, hi⟩
  ·
    by_cases h346 : d < 346
    ·
      by_cases h282 : d < 282
      ·
        have hi : d - 250 < 32 := by omega
        have heq : 250 + (d - 250) = d := by omega
        simpa only [heq] using step0841 ⟨d - 250, hi⟩
      ·
        by_cases h314 : d < 314
        ·
          have hi : d - 282 < 32 := by omega
          have heq : 282 + (d - 282) = d := by omega
          simpa only [heq] using step0842 ⟨d - 282, hi⟩
        ·
          have hi : d - 314 < 32 := by omega
          have heq : 314 + (d - 314) = d := by omega
          simpa only [heq] using step0843 ⟨d - 314, hi⟩
    ·
      by_cases h410 : d < 410
      ·
        by_cases h378 : d < 378
        ·
          have hi : d - 346 < 32 := by omega
          have heq : 346 + (d - 346) = d := by omega
          simpa only [heq] using step0844 ⟨d - 346, hi⟩
        ·
          have hi : d - 378 < 32 := by omega
          have heq : 378 + (d - 378) = d := by omega
          simpa only [heq] using step0845 ⟨d - 378, hi⟩
      ·
        by_cases h442 : d < 442
        ·
          have hi : d - 410 < 32 := by omega
          have heq : 410 + (d - 410) = d := by omega
          simpa only [heq] using step0846 ⟨d - 410, hi⟩
        ·
          have hi : d - 442 < 1 := by omega
          have heq : 442 + (d - 442) = d := by omega
          simpa only [heq] using step0847 ⟨d - 442, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0835,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0835,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0836,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0836,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0837,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0837,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0838,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0838,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0839,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0839,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0840,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0840,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0841,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0841,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0842,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0842,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0843,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0843,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0844,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0844,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0845,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0845,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0846,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0846,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.fields0847,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.step0847,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow059
