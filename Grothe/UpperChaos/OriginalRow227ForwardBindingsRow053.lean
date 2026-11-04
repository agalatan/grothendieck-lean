import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053
import Grothe.UpperChaos.OriginalRow227TriangleForward0757
import Grothe.UpperChaos.OriginalRow227TriangleForward0758
import Grothe.UpperChaos.OriginalRow227TriangleForward0759
import Grothe.UpperChaos.OriginalRow227TriangleForward0760
import Grothe.UpperChaos.OriginalRow227TriangleForward0761
import Grothe.UpperChaos.OriginalRow227TriangleForward0762
import Grothe.UpperChaos.OriginalRow227TriangleForward0763
import Grothe.UpperChaos.OriginalRow227TriangleForward0764
import Grothe.UpperChaos.OriginalRow227TriangleForward0765
import Grothe.UpperChaos.OriginalRow227TriangleForward0766
import Grothe.UpperChaos.OriginalRow227TriangleForward0767
import Grothe.UpperChaos.OriginalRow227TriangleForward0768
import Grothe.UpperChaos.OriginalRow227TriangleForward0769

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0757 : OriginalRow227TriangleForward0757.entries.size = 32 := rfl

def entry0757 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0757.entries[i.val]'(by rw [size0757]; exact i.isLt)

theorem fields0757 (i : Fin 32) :
    (entry0757 i).IA = shift ∧ (entry0757 i).ID = S (52 + i.val + 1) ∧
      (entry0757 i).IC = S 53 ∧ (entry0757 i).Inext = T 52 (52 + i.val + 1) ∧
      (entry0757 i).Icur = T 52 (52 + i.val) ∧
      (entry0757 i).output = T 53 (52 + i.val) ∧
      (entry0757 i).charge = charge 52 (52 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0757 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (52 + i.val)) shift
      (S (52 + i.val + 1)) (S 53) (T 52 (52 + i.val + 1))
      (T 52 (52 + i.val)) (T 53 (52 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0757.entries OriginalRow227TriangleForward0757.checked
    ⟨i.val, by rw [size0757]; exact i.isLt⟩
  change (entry0757 i).check = true at h
  rcases fields0757 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0758 : OriginalRow227TriangleForward0758.entries.size = 32 := rfl

def entry0758 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0758.entries[i.val]'(by rw [size0758]; exact i.isLt)

theorem fields0758 (i : Fin 32) :
    (entry0758 i).IA = shift ∧ (entry0758 i).ID = S (84 + i.val + 1) ∧
      (entry0758 i).IC = S 53 ∧ (entry0758 i).Inext = T 52 (84 + i.val + 1) ∧
      (entry0758 i).Icur = T 52 (84 + i.val) ∧
      (entry0758 i).output = T 53 (84 + i.val) ∧
      (entry0758 i).charge = charge 52 (84 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0758 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (84 + i.val)) shift
      (S (84 + i.val + 1)) (S 53) (T 52 (84 + i.val + 1))
      (T 52 (84 + i.val)) (T 53 (84 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0758.entries OriginalRow227TriangleForward0758.checked
    ⟨i.val, by rw [size0758]; exact i.isLt⟩
  change (entry0758 i).check = true at h
  rcases fields0758 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0759 : OriginalRow227TriangleForward0759.entries.size = 32 := rfl

def entry0759 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0759.entries[i.val]'(by rw [size0759]; exact i.isLt)

theorem fields0759 (i : Fin 32) :
    (entry0759 i).IA = shift ∧ (entry0759 i).ID = S (116 + i.val + 1) ∧
      (entry0759 i).IC = S 53 ∧ (entry0759 i).Inext = T 52 (116 + i.val + 1) ∧
      (entry0759 i).Icur = T 52 (116 + i.val) ∧
      (entry0759 i).output = T 53 (116 + i.val) ∧
      (entry0759 i).charge = charge 52 (116 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0759 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (116 + i.val)) shift
      (S (116 + i.val + 1)) (S 53) (T 52 (116 + i.val + 1))
      (T 52 (116 + i.val)) (T 53 (116 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0759.entries OriginalRow227TriangleForward0759.checked
    ⟨i.val, by rw [size0759]; exact i.isLt⟩
  change (entry0759 i).check = true at h
  rcases fields0759 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0760 : OriginalRow227TriangleForward0760.entries.size = 32 := rfl

def entry0760 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0760.entries[i.val]'(by rw [size0760]; exact i.isLt)

theorem fields0760 (i : Fin 32) :
    (entry0760 i).IA = shift ∧ (entry0760 i).ID = S (148 + i.val + 1) ∧
      (entry0760 i).IC = S 53 ∧ (entry0760 i).Inext = T 52 (148 + i.val + 1) ∧
      (entry0760 i).Icur = T 52 (148 + i.val) ∧
      (entry0760 i).output = T 53 (148 + i.val) ∧
      (entry0760 i).charge = charge 52 (148 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0760 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (148 + i.val)) shift
      (S (148 + i.val + 1)) (S 53) (T 52 (148 + i.val + 1))
      (T 52 (148 + i.val)) (T 53 (148 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0760.entries OriginalRow227TriangleForward0760.checked
    ⟨i.val, by rw [size0760]; exact i.isLt⟩
  change (entry0760 i).check = true at h
  rcases fields0760 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0761 : OriginalRow227TriangleForward0761.entries.size = 32 := rfl

def entry0761 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0761.entries[i.val]'(by rw [size0761]; exact i.isLt)

theorem fields0761 (i : Fin 32) :
    (entry0761 i).IA = shift ∧ (entry0761 i).ID = S (180 + i.val + 1) ∧
      (entry0761 i).IC = S 53 ∧ (entry0761 i).Inext = T 52 (180 + i.val + 1) ∧
      (entry0761 i).Icur = T 52 (180 + i.val) ∧
      (entry0761 i).output = T 53 (180 + i.val) ∧
      (entry0761 i).charge = charge 52 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0761 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 53) (T 52 (180 + i.val + 1))
      (T 52 (180 + i.val)) (T 53 (180 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0761.entries OriginalRow227TriangleForward0761.checked
    ⟨i.val, by rw [size0761]; exact i.isLt⟩
  change (entry0761 i).check = true at h
  rcases fields0761 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0762 : OriginalRow227TriangleForward0762.entries.size = 32 := rfl

def entry0762 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0762.entries[i.val]'(by rw [size0762]; exact i.isLt)

theorem fields0762 (i : Fin 32) :
    (entry0762 i).IA = shift ∧ (entry0762 i).ID = S (212 + i.val + 1) ∧
      (entry0762 i).IC = S 53 ∧ (entry0762 i).Inext = T 52 (212 + i.val + 1) ∧
      (entry0762 i).Icur = T 52 (212 + i.val) ∧
      (entry0762 i).output = T 53 (212 + i.val) ∧
      (entry0762 i).charge = charge 52 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0762 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 53) (T 52 (212 + i.val + 1))
      (T 52 (212 + i.val)) (T 53 (212 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0762.entries OriginalRow227TriangleForward0762.checked
    ⟨i.val, by rw [size0762]; exact i.isLt⟩
  change (entry0762 i).check = true at h
  rcases fields0762 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0763 : OriginalRow227TriangleForward0763.entries.size = 32 := rfl

def entry0763 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0763.entries[i.val]'(by rw [size0763]; exact i.isLt)

theorem fields0763 (i : Fin 32) :
    (entry0763 i).IA = shift ∧ (entry0763 i).ID = S (244 + i.val + 1) ∧
      (entry0763 i).IC = S 53 ∧ (entry0763 i).Inext = T 52 (244 + i.val + 1) ∧
      (entry0763 i).Icur = T 52 (244 + i.val) ∧
      (entry0763 i).output = T 53 (244 + i.val) ∧
      (entry0763 i).charge = charge 52 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0763 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 53) (T 52 (244 + i.val + 1))
      (T 52 (244 + i.val)) (T 53 (244 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0763.entries OriginalRow227TriangleForward0763.checked
    ⟨i.val, by rw [size0763]; exact i.isLt⟩
  change (entry0763 i).check = true at h
  rcases fields0763 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0764 : OriginalRow227TriangleForward0764.entries.size = 32 := rfl

def entry0764 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0764.entries[i.val]'(by rw [size0764]; exact i.isLt)

theorem fields0764 (i : Fin 32) :
    (entry0764 i).IA = shift ∧ (entry0764 i).ID = S (276 + i.val + 1) ∧
      (entry0764 i).IC = S 53 ∧ (entry0764 i).Inext = T 52 (276 + i.val + 1) ∧
      (entry0764 i).Icur = T 52 (276 + i.val) ∧
      (entry0764 i).output = T 53 (276 + i.val) ∧
      (entry0764 i).charge = charge 52 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0764 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 53) (T 52 (276 + i.val + 1))
      (T 52 (276 + i.val)) (T 53 (276 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0764.entries OriginalRow227TriangleForward0764.checked
    ⟨i.val, by rw [size0764]; exact i.isLt⟩
  change (entry0764 i).check = true at h
  rcases fields0764 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0765 : OriginalRow227TriangleForward0765.entries.size = 32 := rfl

def entry0765 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0765.entries[i.val]'(by rw [size0765]; exact i.isLt)

theorem fields0765 (i : Fin 32) :
    (entry0765 i).IA = shift ∧ (entry0765 i).ID = S (308 + i.val + 1) ∧
      (entry0765 i).IC = S 53 ∧ (entry0765 i).Inext = T 52 (308 + i.val + 1) ∧
      (entry0765 i).Icur = T 52 (308 + i.val) ∧
      (entry0765 i).output = T 53 (308 + i.val) ∧
      (entry0765 i).charge = charge 52 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0765 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 53) (T 52 (308 + i.val + 1))
      (T 52 (308 + i.val)) (T 53 (308 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0765.entries OriginalRow227TriangleForward0765.checked
    ⟨i.val, by rw [size0765]; exact i.isLt⟩
  change (entry0765 i).check = true at h
  rcases fields0765 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0766 : OriginalRow227TriangleForward0766.entries.size = 32 := rfl

def entry0766 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0766.entries[i.val]'(by rw [size0766]; exact i.isLt)

theorem fields0766 (i : Fin 32) :
    (entry0766 i).IA = shift ∧ (entry0766 i).ID = S (340 + i.val + 1) ∧
      (entry0766 i).IC = S 53 ∧ (entry0766 i).Inext = T 52 (340 + i.val + 1) ∧
      (entry0766 i).Icur = T 52 (340 + i.val) ∧
      (entry0766 i).output = T 53 (340 + i.val) ∧
      (entry0766 i).charge = charge 52 (340 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0766 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (340 + i.val)) shift
      (S (340 + i.val + 1)) (S 53) (T 52 (340 + i.val + 1))
      (T 52 (340 + i.val)) (T 53 (340 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0766.entries OriginalRow227TriangleForward0766.checked
    ⟨i.val, by rw [size0766]; exact i.isLt⟩
  change (entry0766 i).check = true at h
  rcases fields0766 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0767 : OriginalRow227TriangleForward0767.entries.size = 32 := rfl

def entry0767 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0767.entries[i.val]'(by rw [size0767]; exact i.isLt)

theorem fields0767 (i : Fin 32) :
    (entry0767 i).IA = shift ∧ (entry0767 i).ID = S (372 + i.val + 1) ∧
      (entry0767 i).IC = S 53 ∧ (entry0767 i).Inext = T 52 (372 + i.val + 1) ∧
      (entry0767 i).Icur = T 52 (372 + i.val) ∧
      (entry0767 i).output = T 53 (372 + i.val) ∧
      (entry0767 i).charge = charge 52 (372 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0767 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (372 + i.val)) shift
      (S (372 + i.val + 1)) (S 53) (T 52 (372 + i.val + 1))
      (T 52 (372 + i.val)) (T 53 (372 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0767.entries OriginalRow227TriangleForward0767.checked
    ⟨i.val, by rw [size0767]; exact i.isLt⟩
  change (entry0767 i).check = true at h
  rcases fields0767 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0768 : OriginalRow227TriangleForward0768.entries.size = 32 := rfl

def entry0768 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0768.entries[i.val]'(by rw [size0768]; exact i.isLt)

theorem fields0768 (i : Fin 32) :
    (entry0768 i).IA = shift ∧ (entry0768 i).ID = S (404 + i.val + 1) ∧
      (entry0768 i).IC = S 53 ∧ (entry0768 i).Inext = T 52 (404 + i.val + 1) ∧
      (entry0768 i).Icur = T 52 (404 + i.val) ∧
      (entry0768 i).output = T 53 (404 + i.val) ∧
      (entry0768 i).charge = charge 52 (404 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0768 (i : Fin 32) :
    forwardStepOK (-768) (charge 52 (404 + i.val)) shift
      (S (404 + i.val + 1)) (S 53) (T 52 (404 + i.val + 1))
      (T 52 (404 + i.val)) (T 53 (404 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0768.entries OriginalRow227TriangleForward0768.checked
    ⟨i.val, by rw [size0768]; exact i.isLt⟩
  change (entry0768 i).check = true at h
  rcases fields0768 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0769 : OriginalRow227TriangleForward0769.entries.size = 13 := rfl

def entry0769 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0769.entries[i.val]'(by rw [size0769]; exact i.isLt)

theorem fields0769 (i : Fin 13) :
    (entry0769 i).IA = shift ∧ (entry0769 i).ID = S (436 + i.val + 1) ∧
      (entry0769 i).IC = S 53 ∧ (entry0769 i).Inext = T 52 (436 + i.val + 1) ∧
      (entry0769 i).Icur = T 52 (436 + i.val) ∧
      (entry0769 i).output = T 53 (436 + i.val) ∧
      (entry0769 i).charge = charge 52 (436 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root53).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨12, by decide⟩).symm, rfl⟩

theorem step0769 (i : Fin 13) :
    forwardStepOK (-768) (charge 52 (436 + i.val)) shift
      (S (436 + i.val + 1)) (S 53) (T 52 (436 + i.val + 1))
      (T 52 (436 + i.val)) (T 53 (436 + i.val))
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0769.entries OriginalRow227TriangleForward0769.checked
    ⟨i.val, by rw [size0769]; exact i.isLt⟩
  change (entry0769 i).check = true at h
  rcases fields0769 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 52 ≤ d) (hhi : d < 449) :
    forwardStepOK (-768) (charge 52 d) shift (S (d + 1)) (S 53)
      (T 52 (d + 1)) (T 52 d) (T 53 d)
      (OriginalRow227Roots.root_pos 53 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 52 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h148 : d < 148
    ·
      by_cases h84 : d < 84
      ·
        have hi : d - 52 < 32 := by omega
        have heq : 52 + (d - 52) = d := by omega
        simpa only [heq] using step0757 ⟨d - 52, hi⟩
      ·
        by_cases h116 : d < 116
        ·
          have hi : d - 84 < 32 := by omega
          have heq : 84 + (d - 84) = d := by omega
          simpa only [heq] using step0758 ⟨d - 84, hi⟩
        ·
          have hi : d - 116 < 32 := by omega
          have heq : 116 + (d - 116) = d := by omega
          simpa only [heq] using step0759 ⟨d - 116, hi⟩
    ·
      by_cases h180 : d < 180
      ·
        have hi : d - 148 < 32 := by omega
        have heq : 148 + (d - 148) = d := by omega
        simpa only [heq] using step0760 ⟨d - 148, hi⟩
      ·
        by_cases h212 : d < 212
        ·
          have hi : d - 180 < 32 := by omega
          have heq : 180 + (d - 180) = d := by omega
          simpa only [heq] using step0761 ⟨d - 180, hi⟩
        ·
          have hi : d - 212 < 32 := by omega
          have heq : 212 + (d - 212) = d := by omega
          simpa only [heq] using step0762 ⟨d - 212, hi⟩
  ·
    by_cases h340 : d < 340
    ·
      by_cases h276 : d < 276
      ·
        have hi : d - 244 < 32 := by omega
        have heq : 244 + (d - 244) = d := by omega
        simpa only [heq] using step0763 ⟨d - 244, hi⟩
      ·
        by_cases h308 : d < 308
        ·
          have hi : d - 276 < 32 := by omega
          have heq : 276 + (d - 276) = d := by omega
          simpa only [heq] using step0764 ⟨d - 276, hi⟩
        ·
          have hi : d - 308 < 32 := by omega
          have heq : 308 + (d - 308) = d := by omega
          simpa only [heq] using step0765 ⟨d - 308, hi⟩
    ·
      by_cases h404 : d < 404
      ·
        by_cases h372 : d < 372
        ·
          have hi : d - 340 < 32 := by omega
          have heq : 340 + (d - 340) = d := by omega
          simpa only [heq] using step0766 ⟨d - 340, hi⟩
        ·
          have hi : d - 372 < 32 := by omega
          have heq : 372 + (d - 372) = d := by omega
          simpa only [heq] using step0767 ⟨d - 372, hi⟩
      ·
        by_cases h436 : d < 436
        ·
          have hi : d - 404 < 32 := by omega
          have heq : 404 + (d - 404) = d := by omega
          simpa only [heq] using step0768 ⟨d - 404, hi⟩
        ·
          have hi : d - 436 < 13 := by omega
          have heq : 436 + (d - 436) = d := by omega
          simpa only [heq] using step0769 ⟨d - 436, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0757,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0757,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0758,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0758,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0759,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0759,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0760,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0760,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0761,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0761,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0762,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0762,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0763,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0763,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0764,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0764,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0765,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0765,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0766,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0766,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0767,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0767,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0768,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0768,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.fields0769,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.step0769,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow053
