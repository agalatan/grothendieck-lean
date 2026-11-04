import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow062
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow063
import Grothe.UpperChaos.OriginalRow227TriangleForward0884
import Grothe.UpperChaos.OriginalRow227TriangleForward0885
import Grothe.UpperChaos.OriginalRow227TriangleForward0886
import Grothe.UpperChaos.OriginalRow227TriangleForward0887
import Grothe.UpperChaos.OriginalRow227TriangleForward0888
import Grothe.UpperChaos.OriginalRow227TriangleForward0889
import Grothe.UpperChaos.OriginalRow227TriangleForward0890
import Grothe.UpperChaos.OriginalRow227TriangleForward0891
import Grothe.UpperChaos.OriginalRow227TriangleForward0892
import Grothe.UpperChaos.OriginalRow227TriangleForward0893
import Grothe.UpperChaos.OriginalRow227TriangleForward0894
import Grothe.UpperChaos.OriginalRow227TriangleForward0895

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0884 : OriginalRow227TriangleForward0884.entries.size = 32 := rfl

def entry0884 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0884.entries[i.val]'(by rw [size0884]; exact i.isLt)

theorem fields0884 (i : Fin 32) :
    (entry0884 i).IA = shift ∧ (entry0884 i).ID = S (62 + i.val + 1) ∧
      (entry0884 i).IC = S 63 ∧ (entry0884 i).Inext = T 62 (62 + i.val + 1) ∧
      (entry0884 i).Icur = T 62 (62 + i.val) ∧
      (entry0884 i).output = T 63 (62 + i.val) ∧
      (entry0884 i).charge = charge 62 (62 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0888_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0900_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0884 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (62 + i.val)) shift
      (S (62 + i.val + 1)) (S 63) (T 62 (62 + i.val + 1))
      (T 62 (62 + i.val)) (T 63 (62 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0884.entries OriginalRow227TriangleForward0884.checked
    ⟨i.val, by rw [size0884]; exact i.isLt⟩
  change (entry0884 i).check = true at h
  rcases fields0884 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0885 : OriginalRow227TriangleForward0885.entries.size = 32 := rfl

def entry0885 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0885.entries[i.val]'(by rw [size0885]; exact i.isLt)

theorem fields0885 (i : Fin 32) :
    (entry0885 i).IA = shift ∧ (entry0885 i).ID = S (94 + i.val + 1) ∧
      (entry0885 i).IC = S 63 ∧ (entry0885 i).Inext = T 62 (94 + i.val + 1) ∧
      (entry0885 i).Icur = T 62 (94 + i.val) ∧
      (entry0885 i).output = T 63 (94 + i.val) ∧
      (entry0885 i).charge = charge 62 (94 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0889_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0901_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0885 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (94 + i.val)) shift
      (S (94 + i.val + 1)) (S 63) (T 62 (94 + i.val + 1))
      (T 62 (94 + i.val)) (T 63 (94 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0885.entries OriginalRow227TriangleForward0885.checked
    ⟨i.val, by rw [size0885]; exact i.isLt⟩
  change (entry0885 i).check = true at h
  rcases fields0885 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0886 : OriginalRow227TriangleForward0886.entries.size = 32 := rfl

def entry0886 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0886.entries[i.val]'(by rw [size0886]; exact i.isLt)

theorem fields0886 (i : Fin 32) :
    (entry0886 i).IA = shift ∧ (entry0886 i).ID = S (126 + i.val + 1) ∧
      (entry0886 i).IC = S 63 ∧ (entry0886 i).Inext = T 62 (126 + i.val + 1) ∧
      (entry0886 i).Icur = T 62 (126 + i.val) ∧
      (entry0886 i).output = T 63 (126 + i.val) ∧
      (entry0886 i).charge = charge 62 (126 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0890_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0902_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0886 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (126 + i.val)) shift
      (S (126 + i.val + 1)) (S 63) (T 62 (126 + i.val + 1))
      (T 62 (126 + i.val)) (T 63 (126 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0886.entries OriginalRow227TriangleForward0886.checked
    ⟨i.val, by rw [size0886]; exact i.isLt⟩
  change (entry0886 i).check = true at h
  rcases fields0886 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0887 : OriginalRow227TriangleForward0887.entries.size = 32 := rfl

def entry0887 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0887.entries[i.val]'(by rw [size0887]; exact i.isLt)

theorem fields0887 (i : Fin 32) :
    (entry0887 i).IA = shift ∧ (entry0887 i).ID = S (158 + i.val + 1) ∧
      (entry0887 i).IC = S 63 ∧ (entry0887 i).Inext = T 62 (158 + i.val + 1) ∧
      (entry0887 i).Icur = T 62 (158 + i.val) ∧
      (entry0887 i).output = T 63 (158 + i.val) ∧
      (entry0887 i).charge = charge 62 (158 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0891_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0903_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0887 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (158 + i.val)) shift
      (S (158 + i.val + 1)) (S 63) (T 62 (158 + i.val + 1))
      (T 62 (158 + i.val)) (T 63 (158 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0887.entries OriginalRow227TriangleForward0887.checked
    ⟨i.val, by rw [size0887]; exact i.isLt⟩
  change (entry0887 i).check = true at h
  rcases fields0887 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0888 : OriginalRow227TriangleForward0888.entries.size = 32 := rfl

def entry0888 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0888.entries[i.val]'(by rw [size0888]; exact i.isLt)

theorem fields0888 (i : Fin 32) :
    (entry0888 i).IA = shift ∧ (entry0888 i).ID = S (190 + i.val + 1) ∧
      (entry0888 i).IC = S 63 ∧ (entry0888 i).Inext = T 62 (190 + i.val + 1) ∧
      (entry0888 i).Icur = T 62 (190 + i.val) ∧
      (entry0888 i).output = T 63 (190 + i.val) ∧
      (entry0888 i).charge = charge 62 (190 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0892_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0904_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0888 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (190 + i.val)) shift
      (S (190 + i.val + 1)) (S 63) (T 62 (190 + i.val + 1))
      (T 62 (190 + i.val)) (T 63 (190 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0888.entries OriginalRow227TriangleForward0888.checked
    ⟨i.val, by rw [size0888]; exact i.isLt⟩
  change (entry0888 i).check = true at h
  rcases fields0888 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0889 : OriginalRow227TriangleForward0889.entries.size = 32 := rfl

def entry0889 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0889.entries[i.val]'(by rw [size0889]; exact i.isLt)

theorem fields0889 (i : Fin 32) :
    (entry0889 i).IA = shift ∧ (entry0889 i).ID = S (222 + i.val + 1) ∧
      (entry0889 i).IC = S 63 ∧ (entry0889 i).Inext = T 62 (222 + i.val + 1) ∧
      (entry0889 i).Icur = T 62 (222 + i.val) ∧
      (entry0889 i).output = T 63 (222 + i.val) ∧
      (entry0889 i).charge = charge 62 (222 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0893_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0905_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0889 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (222 + i.val)) shift
      (S (222 + i.val + 1)) (S 63) (T 62 (222 + i.val + 1))
      (T 62 (222 + i.val)) (T 63 (222 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0889.entries OriginalRow227TriangleForward0889.checked
    ⟨i.val, by rw [size0889]; exact i.isLt⟩
  change (entry0889 i).check = true at h
  rcases fields0889 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0890 : OriginalRow227TriangleForward0890.entries.size = 32 := rfl

def entry0890 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0890.entries[i.val]'(by rw [size0890]; exact i.isLt)

theorem fields0890 (i : Fin 32) :
    (entry0890 i).IA = shift ∧ (entry0890 i).ID = S (254 + i.val + 1) ∧
      (entry0890 i).IC = S 63 ∧ (entry0890 i).Inext = T 62 (254 + i.val + 1) ∧
      (entry0890 i).Icur = T 62 (254 + i.val) ∧
      (entry0890 i).output = T 63 (254 + i.val) ∧
      (entry0890 i).charge = charge 62 (254 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0894_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0906_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0890 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (254 + i.val)) shift
      (S (254 + i.val + 1)) (S 63) (T 62 (254 + i.val + 1))
      (T 62 (254 + i.val)) (T 63 (254 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0890.entries OriginalRow227TriangleForward0890.checked
    ⟨i.val, by rw [size0890]; exact i.isLt⟩
  change (entry0890 i).check = true at h
  rcases fields0890 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0891 : OriginalRow227TriangleForward0891.entries.size = 32 := rfl

def entry0891 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0891.entries[i.val]'(by rw [size0891]; exact i.isLt)

theorem fields0891 (i : Fin 32) :
    (entry0891 i).IA = shift ∧ (entry0891 i).ID = S (286 + i.val + 1) ∧
      (entry0891 i).IC = S 63 ∧ (entry0891 i).Inext = T 62 (286 + i.val + 1) ∧
      (entry0891 i).Icur = T 62 (286 + i.val) ∧
      (entry0891 i).output = T 63 (286 + i.val) ∧
      (entry0891 i).charge = charge 62 (286 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0895_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0907_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0891 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (286 + i.val)) shift
      (S (286 + i.val + 1)) (S 63) (T 62 (286 + i.val + 1))
      (T 62 (286 + i.val)) (T 63 (286 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0891.entries OriginalRow227TriangleForward0891.checked
    ⟨i.val, by rw [size0891]; exact i.isLt⟩
  change (entry0891 i).check = true at h
  rcases fields0891 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0892 : OriginalRow227TriangleForward0892.entries.size = 32 := rfl

def entry0892 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0892.entries[i.val]'(by rw [size0892]; exact i.isLt)

theorem fields0892 (i : Fin 32) :
    (entry0892 i).IA = shift ∧ (entry0892 i).ID = S (318 + i.val + 1) ∧
      (entry0892 i).IC = S 63 ∧ (entry0892 i).Inext = T 62 (318 + i.val + 1) ∧
      (entry0892 i).Icur = T 62 (318 + i.val) ∧
      (entry0892 i).output = T 63 (318 + i.val) ∧
      (entry0892 i).charge = charge 62 (318 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0896_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0908_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0892 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (318 + i.val)) shift
      (S (318 + i.val + 1)) (S 63) (T 62 (318 + i.val + 1))
      (T 62 (318 + i.val)) (T 63 (318 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0892.entries OriginalRow227TriangleForward0892.checked
    ⟨i.val, by rw [size0892]; exact i.isLt⟩
  change (entry0892 i).check = true at h
  rcases fields0892 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0893 : OriginalRow227TriangleForward0893.entries.size = 32 := rfl

def entry0893 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0893.entries[i.val]'(by rw [size0893]; exact i.isLt)

theorem fields0893 (i : Fin 32) :
    (entry0893 i).IA = shift ∧ (entry0893 i).ID = S (350 + i.val + 1) ∧
      (entry0893 i).IC = S 63 ∧ (entry0893 i).Inext = T 62 (350 + i.val + 1) ∧
      (entry0893 i).Icur = T 62 (350 + i.val) ∧
      (entry0893 i).output = T 63 (350 + i.val) ∧
      (entry0893 i).charge = charge 62 (350 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0897_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0909_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0893 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (350 + i.val)) shift
      (S (350 + i.val + 1)) (S 63) (T 62 (350 + i.val + 1))
      (T 62 (350 + i.val)) (T 63 (350 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0893.entries OriginalRow227TriangleForward0893.checked
    ⟨i.val, by rw [size0893]; exact i.isLt⟩
  change (entry0893 i).check = true at h
  rcases fields0893 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0894 : OriginalRow227TriangleForward0894.entries.size = 32 := rfl

def entry0894 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0894.entries[i.val]'(by rw [size0894]; exact i.isLt)

theorem fields0894 (i : Fin 32) :
    (entry0894 i).IA = shift ∧ (entry0894 i).ID = S (382 + i.val + 1) ∧
      (entry0894 i).IC = S 63 ∧ (entry0894 i).Inext = T 62 (382 + i.val + 1) ∧
      (entry0894 i).Icur = T 62 (382 + i.val) ∧
      (entry0894 i).output = T 63 (382 + i.val) ∧
      (entry0894 i).charge = charge 62 (382 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0898_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0910_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0894 (i : Fin 32) :
    forwardStepOK (-768) (charge 62 (382 + i.val)) shift
      (S (382 + i.val + 1)) (S 63) (T 62 (382 + i.val + 1))
      (T 62 (382 + i.val)) (T 63 (382 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0894.entries OriginalRow227TriangleForward0894.checked
    ⟨i.val, by rw [size0894]; exact i.isLt⟩
  change (entry0894 i).check = true at h
  rcases fields0894 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0895 : OriginalRow227TriangleForward0895.entries.size = 25 := rfl

def entry0895 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0895.entries[i.val]'(by rw [size0895]; exact i.isLt)

theorem fields0895 (i : Fin 25) :
    (entry0895 i).IA = shift ∧ (entry0895 i).ID = S (414 + i.val + 1) ∧
      (entry0895 i).IC = S 63 ∧ (entry0895 i).Inext = T 62 (414 + i.val + 1) ∧
      (entry0895 i).Icur = T 62 (414 + i.val) ∧
      (entry0895 i).output = T 63 (414 + i.val) ∧
      (entry0895 i).charge = charge 62 (414 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root63).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow062.block0899_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow063.block0911_value ⟨24, by decide⟩).symm, rfl⟩

theorem step0895 (i : Fin 25) :
    forwardStepOK (-768) (charge 62 (414 + i.val)) shift
      (S (414 + i.val + 1)) (S 63) (T 62 (414 + i.val + 1))
      (T 62 (414 + i.val)) (T 63 (414 + i.val))
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0895.entries OriginalRow227TriangleForward0895.checked
    ⟨i.val, by rw [size0895]; exact i.isLt⟩
  change (entry0895 i).check = true at h
  rcases fields0895 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 62 ≤ d) (hhi : d < 439) :
    forwardStepOK (-768) (charge 62 d) shift (S (d + 1)) (S 63)
      (T 62 (d + 1)) (T 62 d) (T 63 d)
      (OriginalRow227Roots.root_pos 63 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 62 (by decide)) = true := by
  by_cases h254 : d < 254
  ·
    by_cases h158 : d < 158
    ·
      by_cases h94 : d < 94
      ·
        have hi : d - 62 < 32 := by omega
        have heq : 62 + (d - 62) = d := by omega
        simpa only [heq] using step0884 ⟨d - 62, hi⟩
      ·
        by_cases h126 : d < 126
        ·
          have hi : d - 94 < 32 := by omega
          have heq : 94 + (d - 94) = d := by omega
          simpa only [heq] using step0885 ⟨d - 94, hi⟩
        ·
          have hi : d - 126 < 32 := by omega
          have heq : 126 + (d - 126) = d := by omega
          simpa only [heq] using step0886 ⟨d - 126, hi⟩
    ·
      by_cases h190 : d < 190
      ·
        have hi : d - 158 < 32 := by omega
        have heq : 158 + (d - 158) = d := by omega
        simpa only [heq] using step0887 ⟨d - 158, hi⟩
      ·
        by_cases h222 : d < 222
        ·
          have hi : d - 190 < 32 := by omega
          have heq : 190 + (d - 190) = d := by omega
          simpa only [heq] using step0888 ⟨d - 190, hi⟩
        ·
          have hi : d - 222 < 32 := by omega
          have heq : 222 + (d - 222) = d := by omega
          simpa only [heq] using step0889 ⟨d - 222, hi⟩
  ·
    by_cases h350 : d < 350
    ·
      by_cases h286 : d < 286
      ·
        have hi : d - 254 < 32 := by omega
        have heq : 254 + (d - 254) = d := by omega
        simpa only [heq] using step0890 ⟨d - 254, hi⟩
      ·
        by_cases h318 : d < 318
        ·
          have hi : d - 286 < 32 := by omega
          have heq : 286 + (d - 286) = d := by omega
          simpa only [heq] using step0891 ⟨d - 286, hi⟩
        ·
          have hi : d - 318 < 32 := by omega
          have heq : 318 + (d - 318) = d := by omega
          simpa only [heq] using step0892 ⟨d - 318, hi⟩
    ·
      by_cases h382 : d < 382
      ·
        have hi : d - 350 < 32 := by omega
        have heq : 350 + (d - 350) = d := by omega
        simpa only [heq] using step0893 ⟨d - 350, hi⟩
      ·
        by_cases h414 : d < 414
        ·
          have hi : d - 382 < 32 := by omega
          have heq : 382 + (d - 382) = d := by omega
          simpa only [heq] using step0894 ⟨d - 382, hi⟩
        ·
          have hi : d - 414 < 25 := by omega
          have heq : 414 + (d - 414) = d := by omega
          simpa only [heq] using step0895 ⟨d - 414, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0884,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0884,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0885,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0885,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0886,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0886,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0887,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0887,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0888,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0888,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0889,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0889,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0890,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0890,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0891,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0891,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0892,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0892,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0893,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0893,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0894,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0894,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.fields0895,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.step0895,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow063
