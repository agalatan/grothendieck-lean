import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow064
import Grothe.UpperChaos.OriginalRow227TriangleForward0896
import Grothe.UpperChaos.OriginalRow227TriangleForward0897
import Grothe.UpperChaos.OriginalRow227TriangleForward0898
import Grothe.UpperChaos.OriginalRow227TriangleForward0899
import Grothe.UpperChaos.OriginalRow227TriangleForward0900
import Grothe.UpperChaos.OriginalRow227TriangleForward0901
import Grothe.UpperChaos.OriginalRow227TriangleForward0902
import Grothe.UpperChaos.OriginalRow227TriangleForward0903
import Grothe.UpperChaos.OriginalRow227TriangleForward0904
import Grothe.UpperChaos.OriginalRow227TriangleForward0905
import Grothe.UpperChaos.OriginalRow227TriangleForward0906
import Grothe.UpperChaos.OriginalRow227TriangleForward0907

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0896 : OriginalRow227TriangleForward0896.entries.size = 32 := rfl

def entry0896 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0896.entries[i.val]'(by rw [size0896]; exact i.isLt)

theorem fields0896 (i : Fin 32) :
    (entry0896 i).IA = shift ∧ (entry0896 i).ID = S (63 + i.val + 1) ∧
      (entry0896 i).IC = S 64 ∧ (entry0896 i).Inext = T 63 (63 + i.val + 1) ∧
      (entry0896 i).Icur = T 63 (63 + i.val) ∧
      (entry0896 i).output = T 64 (63 + i.val) ∧
      (entry0896 i).charge = charge 63 (63 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0912_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0896 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (63 + i.val)) shift
      (S (63 + i.val + 1)) (S 64) (T 63 (63 + i.val + 1))
      (T 63 (63 + i.val)) (T 64 (63 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0896.entries OriginalRow227TriangleForward0896.checked
    ⟨i.val, by rw [size0896]; exact i.isLt⟩
  change (entry0896 i).check = true at h
  rcases fields0896 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0897 : OriginalRow227TriangleForward0897.entries.size = 32 := rfl

def entry0897 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0897.entries[i.val]'(by rw [size0897]; exact i.isLt)

theorem fields0897 (i : Fin 32) :
    (entry0897 i).IA = shift ∧ (entry0897 i).ID = S (95 + i.val + 1) ∧
      (entry0897 i).IC = S 64 ∧ (entry0897 i).Inext = T 63 (95 + i.val + 1) ∧
      (entry0897 i).Icur = T 63 (95 + i.val) ∧
      (entry0897 i).output = T 64 (95 + i.val) ∧
      (entry0897 i).charge = charge 63 (95 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0913_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0897 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (95 + i.val)) shift
      (S (95 + i.val + 1)) (S 64) (T 63 (95 + i.val + 1))
      (T 63 (95 + i.val)) (T 64 (95 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0897.entries OriginalRow227TriangleForward0897.checked
    ⟨i.val, by rw [size0897]; exact i.isLt⟩
  change (entry0897 i).check = true at h
  rcases fields0897 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0898 : OriginalRow227TriangleForward0898.entries.size = 32 := rfl

def entry0898 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0898.entries[i.val]'(by rw [size0898]; exact i.isLt)

theorem fields0898 (i : Fin 32) :
    (entry0898 i).IA = shift ∧ (entry0898 i).ID = S (127 + i.val + 1) ∧
      (entry0898 i).IC = S 64 ∧ (entry0898 i).Inext = T 63 (127 + i.val + 1) ∧
      (entry0898 i).Icur = T 63 (127 + i.val) ∧
      (entry0898 i).output = T 64 (127 + i.val) ∧
      (entry0898 i).charge = charge 63 (127 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0914_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0898 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (127 + i.val)) shift
      (S (127 + i.val + 1)) (S 64) (T 63 (127 + i.val + 1))
      (T 63 (127 + i.val)) (T 64 (127 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0898.entries OriginalRow227TriangleForward0898.checked
    ⟨i.val, by rw [size0898]; exact i.isLt⟩
  change (entry0898 i).check = true at h
  rcases fields0898 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0899 : OriginalRow227TriangleForward0899.entries.size = 32 := rfl

def entry0899 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0899.entries[i.val]'(by rw [size0899]; exact i.isLt)

theorem fields0899 (i : Fin 32) :
    (entry0899 i).IA = shift ∧ (entry0899 i).ID = S (159 + i.val + 1) ∧
      (entry0899 i).IC = S 64 ∧ (entry0899 i).Inext = T 63 (159 + i.val + 1) ∧
      (entry0899 i).Icur = T 63 (159 + i.val) ∧
      (entry0899 i).output = T 64 (159 + i.val) ∧
      (entry0899 i).charge = charge 63 (159 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0915_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0899 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (159 + i.val)) shift
      (S (159 + i.val + 1)) (S 64) (T 63 (159 + i.val + 1))
      (T 63 (159 + i.val)) (T 64 (159 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0899.entries OriginalRow227TriangleForward0899.checked
    ⟨i.val, by rw [size0899]; exact i.isLt⟩
  change (entry0899 i).check = true at h
  rcases fields0899 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0900 : OriginalRow227TriangleForward0900.entries.size = 32 := rfl

def entry0900 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0900.entries[i.val]'(by rw [size0900]; exact i.isLt)

theorem fields0900 (i : Fin 32) :
    (entry0900 i).IA = shift ∧ (entry0900 i).ID = S (191 + i.val + 1) ∧
      (entry0900 i).IC = S 64 ∧ (entry0900 i).Inext = T 63 (191 + i.val + 1) ∧
      (entry0900 i).Icur = T 63 (191 + i.val) ∧
      (entry0900 i).output = T 64 (191 + i.val) ∧
      (entry0900 i).charge = charge 63 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0916_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0900 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 64) (T 63 (191 + i.val + 1))
      (T 63 (191 + i.val)) (T 64 (191 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0900.entries OriginalRow227TriangleForward0900.checked
    ⟨i.val, by rw [size0900]; exact i.isLt⟩
  change (entry0900 i).check = true at h
  rcases fields0900 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0901 : OriginalRow227TriangleForward0901.entries.size = 32 := rfl

def entry0901 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0901.entries[i.val]'(by rw [size0901]; exact i.isLt)

theorem fields0901 (i : Fin 32) :
    (entry0901 i).IA = shift ∧ (entry0901 i).ID = S (223 + i.val + 1) ∧
      (entry0901 i).IC = S 64 ∧ (entry0901 i).Inext = T 63 (223 + i.val + 1) ∧
      (entry0901 i).Icur = T 63 (223 + i.val) ∧
      (entry0901 i).output = T 64 (223 + i.val) ∧
      (entry0901 i).charge = charge 63 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0917_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0901 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 64) (T 63 (223 + i.val + 1))
      (T 63 (223 + i.val)) (T 64 (223 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0901.entries OriginalRow227TriangleForward0901.checked
    ⟨i.val, by rw [size0901]; exact i.isLt⟩
  change (entry0901 i).check = true at h
  rcases fields0901 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0902 : OriginalRow227TriangleForward0902.entries.size = 32 := rfl

def entry0902 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0902.entries[i.val]'(by rw [size0902]; exact i.isLt)

theorem fields0902 (i : Fin 32) :
    (entry0902 i).IA = shift ∧ (entry0902 i).ID = S (255 + i.val + 1) ∧
      (entry0902 i).IC = S 64 ∧ (entry0902 i).Inext = T 63 (255 + i.val + 1) ∧
      (entry0902 i).Icur = T 63 (255 + i.val) ∧
      (entry0902 i).output = T 64 (255 + i.val) ∧
      (entry0902 i).charge = charge 63 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0918_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0902 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 64) (T 63 (255 + i.val + 1))
      (T 63 (255 + i.val)) (T 64 (255 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0902.entries OriginalRow227TriangleForward0902.checked
    ⟨i.val, by rw [size0902]; exact i.isLt⟩
  change (entry0902 i).check = true at h
  rcases fields0902 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0903 : OriginalRow227TriangleForward0903.entries.size = 32 := rfl

def entry0903 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0903.entries[i.val]'(by rw [size0903]; exact i.isLt)

theorem fields0903 (i : Fin 32) :
    (entry0903 i).IA = shift ∧ (entry0903 i).ID = S (287 + i.val + 1) ∧
      (entry0903 i).IC = S 64 ∧ (entry0903 i).Inext = T 63 (287 + i.val + 1) ∧
      (entry0903 i).Icur = T 63 (287 + i.val) ∧
      (entry0903 i).output = T 64 (287 + i.val) ∧
      (entry0903 i).charge = charge 63 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0919_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0903 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 64) (T 63 (287 + i.val + 1))
      (T 63 (287 + i.val)) (T 64 (287 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0903.entries OriginalRow227TriangleForward0903.checked
    ⟨i.val, by rw [size0903]; exact i.isLt⟩
  change (entry0903 i).check = true at h
  rcases fields0903 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0904 : OriginalRow227TriangleForward0904.entries.size = 32 := rfl

def entry0904 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0904.entries[i.val]'(by rw [size0904]; exact i.isLt)

theorem fields0904 (i : Fin 32) :
    (entry0904 i).IA = shift ∧ (entry0904 i).ID = S (319 + i.val + 1) ∧
      (entry0904 i).IC = S 64 ∧ (entry0904 i).Inext = T 63 (319 + i.val + 1) ∧
      (entry0904 i).Icur = T 63 (319 + i.val) ∧
      (entry0904 i).output = T 64 (319 + i.val) ∧
      (entry0904 i).charge = charge 63 (319 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0920_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0904 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (319 + i.val)) shift
      (S (319 + i.val + 1)) (S 64) (T 63 (319 + i.val + 1))
      (T 63 (319 + i.val)) (T 64 (319 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0904.entries OriginalRow227TriangleForward0904.checked
    ⟨i.val, by rw [size0904]; exact i.isLt⟩
  change (entry0904 i).check = true at h
  rcases fields0904 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0905 : OriginalRow227TriangleForward0905.entries.size = 32 := rfl

def entry0905 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0905.entries[i.val]'(by rw [size0905]; exact i.isLt)

theorem fields0905 (i : Fin 32) :
    (entry0905 i).IA = shift ∧ (entry0905 i).ID = S (351 + i.val + 1) ∧
      (entry0905 i).IC = S 64 ∧ (entry0905 i).Inext = T 63 (351 + i.val + 1) ∧
      (entry0905 i).Icur = T 63 (351 + i.val) ∧
      (entry0905 i).output = T 64 (351 + i.val) ∧
      (entry0905 i).charge = charge 63 (351 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0921_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0905 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (351 + i.val)) shift
      (S (351 + i.val + 1)) (S 64) (T 63 (351 + i.val + 1))
      (T 63 (351 + i.val)) (T 64 (351 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0905.entries OriginalRow227TriangleForward0905.checked
    ⟨i.val, by rw [size0905]; exact i.isLt⟩
  change (entry0905 i).check = true at h
  rcases fields0905 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0906 : OriginalRow227TriangleForward0906.entries.size = 32 := rfl

def entry0906 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0906.entries[i.val]'(by rw [size0906]; exact i.isLt)

theorem fields0906 (i : Fin 32) :
    (entry0906 i).IA = shift ∧ (entry0906 i).ID = S (383 + i.val + 1) ∧
      (entry0906 i).IC = S 64 ∧ (entry0906 i).Inext = T 63 (383 + i.val + 1) ∧
      (entry0906 i).Icur = T 63 (383 + i.val) ∧
      (entry0906 i).output = T 64 (383 + i.val) ∧
      (entry0906 i).charge = charge 63 (383 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0922_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0906 (i : Fin 32) :
    forwardStepOK (-768) (charge 63 (383 + i.val)) shift
      (S (383 + i.val + 1)) (S 64) (T 63 (383 + i.val + 1))
      (T 63 (383 + i.val)) (T 64 (383 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0906.entries OriginalRow227TriangleForward0906.checked
    ⟨i.val, by rw [size0906]; exact i.isLt⟩
  change (entry0906 i).check = true at h
  rcases fields0906 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0907 : OriginalRow227TriangleForward0907.entries.size = 23 := rfl

def entry0907 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0907.entries[i.val]'(by rw [size0907]; exact i.isLt)

theorem fields0907 (i : Fin 23) :
    (entry0907 i).IA = shift ∧ (entry0907 i).ID = S (415 + i.val + 1) ∧
      (entry0907 i).IC = S 64 ∧ (entry0907 i).Inext = T 63 (415 + i.val + 1) ∧
      (entry0907 i).Icur = T 63 (415 + i.val) ∧
      (entry0907 i).output = T 64 (415 + i.val) ∧
      (entry0907 i).charge = charge 63 (415 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root64).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow064.block0923_value ⟨22, by decide⟩).symm, rfl⟩

theorem step0907 (i : Fin 23) :
    forwardStepOK (-768) (charge 63 (415 + i.val)) shift
      (S (415 + i.val + 1)) (S 64) (T 63 (415 + i.val + 1))
      (T 63 (415 + i.val)) (T 64 (415 + i.val))
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0907.entries OriginalRow227TriangleForward0907.checked
    ⟨i.val, by rw [size0907]; exact i.isLt⟩
  change (entry0907 i).check = true at h
  rcases fields0907 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 63 ≤ d) (hhi : d < 438) :
    forwardStepOK (-768) (charge 63 d) shift (S (d + 1)) (S 64)
      (T 63 (d + 1)) (T 63 d) (T 64 d)
      (OriginalRow227Roots.root_pos 64 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 63 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h159 : d < 159
    ·
      by_cases h95 : d < 95
      ·
        have hi : d - 63 < 32 := by omega
        have heq : 63 + (d - 63) = d := by omega
        simpa only [heq] using step0896 ⟨d - 63, hi⟩
      ·
        by_cases h127 : d < 127
        ·
          have hi : d - 95 < 32 := by omega
          have heq : 95 + (d - 95) = d := by omega
          simpa only [heq] using step0897 ⟨d - 95, hi⟩
        ·
          have hi : d - 127 < 32 := by omega
          have heq : 127 + (d - 127) = d := by omega
          simpa only [heq] using step0898 ⟨d - 127, hi⟩
    ·
      by_cases h191 : d < 191
      ·
        have hi : d - 159 < 32 := by omega
        have heq : 159 + (d - 159) = d := by omega
        simpa only [heq] using step0899 ⟨d - 159, hi⟩
      ·
        by_cases h223 : d < 223
        ·
          have hi : d - 191 < 32 := by omega
          have heq : 191 + (d - 191) = d := by omega
          simpa only [heq] using step0900 ⟨d - 191, hi⟩
        ·
          have hi : d - 223 < 32 := by omega
          have heq : 223 + (d - 223) = d := by omega
          simpa only [heq] using step0901 ⟨d - 223, hi⟩
  ·
    by_cases h351 : d < 351
    ·
      by_cases h287 : d < 287
      ·
        have hi : d - 255 < 32 := by omega
        have heq : 255 + (d - 255) = d := by omega
        simpa only [heq] using step0902 ⟨d - 255, hi⟩
      ·
        by_cases h319 : d < 319
        ·
          have hi : d - 287 < 32 := by omega
          have heq : 287 + (d - 287) = d := by omega
          simpa only [heq] using step0903 ⟨d - 287, hi⟩
        ·
          have hi : d - 319 < 32 := by omega
          have heq : 319 + (d - 319) = d := by omega
          simpa only [heq] using step0904 ⟨d - 319, hi⟩
    ·
      by_cases h383 : d < 383
      ·
        have hi : d - 351 < 32 := by omega
        have heq : 351 + (d - 351) = d := by omega
        simpa only [heq] using step0905 ⟨d - 351, hi⟩
      ·
        by_cases h415 : d < 415
        ·
          have hi : d - 383 < 32 := by omega
          have heq : 383 + (d - 383) = d := by omega
          simpa only [heq] using step0906 ⟨d - 383, hi⟩
        ·
          have hi : d - 415 < 23 := by omega
          have heq : 415 + (d - 415) = d := by omega
          simpa only [heq] using step0907 ⟨d - 415, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0896,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0896,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0897,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0897,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0898,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0898,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0899,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0899,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0900,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0900,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0901,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0901,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0902,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0902,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0903,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0903,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0904,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0904,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0905,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0905,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0906,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0906,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.fields0907,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.step0907,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow064
