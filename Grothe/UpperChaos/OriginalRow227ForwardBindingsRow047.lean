import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow047
import Grothe.UpperChaos.OriginalRow227TriangleForward0679
import Grothe.UpperChaos.OriginalRow227TriangleForward0680
import Grothe.UpperChaos.OriginalRow227TriangleForward0681
import Grothe.UpperChaos.OriginalRow227TriangleForward0682
import Grothe.UpperChaos.OriginalRow227TriangleForward0683
import Grothe.UpperChaos.OriginalRow227TriangleForward0684
import Grothe.UpperChaos.OriginalRow227TriangleForward0685
import Grothe.UpperChaos.OriginalRow227TriangleForward0686
import Grothe.UpperChaos.OriginalRow227TriangleForward0687
import Grothe.UpperChaos.OriginalRow227TriangleForward0688
import Grothe.UpperChaos.OriginalRow227TriangleForward0689
import Grothe.UpperChaos.OriginalRow227TriangleForward0690
import Grothe.UpperChaos.OriginalRow227TriangleForward0691

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0679 : OriginalRow227TriangleForward0679.entries.size = 32 := rfl

def entry0679 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0679.entries[i.val]'(by rw [size0679]; exact i.isLt)

theorem fields0679 (i : Fin 32) :
    (entry0679 i).IA = shift ∧ (entry0679 i).ID = S (46 + i.val + 1) ∧
      (entry0679 i).IC = S 47 ∧ (entry0679 i).Inext = T 46 (46 + i.val + 1) ∧
      (entry0679 i).Icur = T 46 (46 + i.val) ∧
      (entry0679 i).output = T 47 (46 + i.val) ∧
      (entry0679 i).charge = charge 46 (46 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0695_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0679 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (46 + i.val)) shift
      (S (46 + i.val + 1)) (S 47) (T 46 (46 + i.val + 1))
      (T 46 (46 + i.val)) (T 47 (46 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0679.entries OriginalRow227TriangleForward0679.checked
    ⟨i.val, by rw [size0679]; exact i.isLt⟩
  change (entry0679 i).check = true at h
  rcases fields0679 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0680 : OriginalRow227TriangleForward0680.entries.size = 32 := rfl

def entry0680 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0680.entries[i.val]'(by rw [size0680]; exact i.isLt)

theorem fields0680 (i : Fin 32) :
    (entry0680 i).IA = shift ∧ (entry0680 i).ID = S (78 + i.val + 1) ∧
      (entry0680 i).IC = S 47 ∧ (entry0680 i).Inext = T 46 (78 + i.val + 1) ∧
      (entry0680 i).Icur = T 46 (78 + i.val) ∧
      (entry0680 i).output = T 47 (78 + i.val) ∧
      (entry0680 i).charge = charge 46 (78 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0696_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0680 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (78 + i.val)) shift
      (S (78 + i.val + 1)) (S 47) (T 46 (78 + i.val + 1))
      (T 46 (78 + i.val)) (T 47 (78 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0680.entries OriginalRow227TriangleForward0680.checked
    ⟨i.val, by rw [size0680]; exact i.isLt⟩
  change (entry0680 i).check = true at h
  rcases fields0680 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0681 : OriginalRow227TriangleForward0681.entries.size = 32 := rfl

def entry0681 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0681.entries[i.val]'(by rw [size0681]; exact i.isLt)

theorem fields0681 (i : Fin 32) :
    (entry0681 i).IA = shift ∧ (entry0681 i).ID = S (110 + i.val + 1) ∧
      (entry0681 i).IC = S 47 ∧ (entry0681 i).Inext = T 46 (110 + i.val + 1) ∧
      (entry0681 i).Icur = T 46 (110 + i.val) ∧
      (entry0681 i).output = T 47 (110 + i.val) ∧
      (entry0681 i).charge = charge 46 (110 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0697_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0681 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (110 + i.val)) shift
      (S (110 + i.val + 1)) (S 47) (T 46 (110 + i.val + 1))
      (T 46 (110 + i.val)) (T 47 (110 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0681.entries OriginalRow227TriangleForward0681.checked
    ⟨i.val, by rw [size0681]; exact i.isLt⟩
  change (entry0681 i).check = true at h
  rcases fields0681 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0682 : OriginalRow227TriangleForward0682.entries.size = 32 := rfl

def entry0682 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0682.entries[i.val]'(by rw [size0682]; exact i.isLt)

theorem fields0682 (i : Fin 32) :
    (entry0682 i).IA = shift ∧ (entry0682 i).ID = S (142 + i.val + 1) ∧
      (entry0682 i).IC = S 47 ∧ (entry0682 i).Inext = T 46 (142 + i.val + 1) ∧
      (entry0682 i).Icur = T 46 (142 + i.val) ∧
      (entry0682 i).output = T 47 (142 + i.val) ∧
      (entry0682 i).charge = charge 46 (142 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0698_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0682 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (142 + i.val)) shift
      (S (142 + i.val + 1)) (S 47) (T 46 (142 + i.val + 1))
      (T 46 (142 + i.val)) (T 47 (142 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0682.entries OriginalRow227TriangleForward0682.checked
    ⟨i.val, by rw [size0682]; exact i.isLt⟩
  change (entry0682 i).check = true at h
  rcases fields0682 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0683 : OriginalRow227TriangleForward0683.entries.size = 32 := rfl

def entry0683 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0683.entries[i.val]'(by rw [size0683]; exact i.isLt)

theorem fields0683 (i : Fin 32) :
    (entry0683 i).IA = shift ∧ (entry0683 i).ID = S (174 + i.val + 1) ∧
      (entry0683 i).IC = S 47 ∧ (entry0683 i).Inext = T 46 (174 + i.val + 1) ∧
      (entry0683 i).Icur = T 46 (174 + i.val) ∧
      (entry0683 i).output = T 47 (174 + i.val) ∧
      (entry0683 i).charge = charge 46 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0699_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0683 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 47) (T 46 (174 + i.val + 1))
      (T 46 (174 + i.val)) (T 47 (174 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0683.entries OriginalRow227TriangleForward0683.checked
    ⟨i.val, by rw [size0683]; exact i.isLt⟩
  change (entry0683 i).check = true at h
  rcases fields0683 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0684 : OriginalRow227TriangleForward0684.entries.size = 32 := rfl

def entry0684 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0684.entries[i.val]'(by rw [size0684]; exact i.isLt)

theorem fields0684 (i : Fin 32) :
    (entry0684 i).IA = shift ∧ (entry0684 i).ID = S (206 + i.val + 1) ∧
      (entry0684 i).IC = S 47 ∧ (entry0684 i).Inext = T 46 (206 + i.val + 1) ∧
      (entry0684 i).Icur = T 46 (206 + i.val) ∧
      (entry0684 i).output = T 47 (206 + i.val) ∧
      (entry0684 i).charge = charge 46 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0700_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0684 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 47) (T 46 (206 + i.val + 1))
      (T 46 (206 + i.val)) (T 47 (206 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0684.entries OriginalRow227TriangleForward0684.checked
    ⟨i.val, by rw [size0684]; exact i.isLt⟩
  change (entry0684 i).check = true at h
  rcases fields0684 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0685 : OriginalRow227TriangleForward0685.entries.size = 32 := rfl

def entry0685 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0685.entries[i.val]'(by rw [size0685]; exact i.isLt)

theorem fields0685 (i : Fin 32) :
    (entry0685 i).IA = shift ∧ (entry0685 i).ID = S (238 + i.val + 1) ∧
      (entry0685 i).IC = S 47 ∧ (entry0685 i).Inext = T 46 (238 + i.val + 1) ∧
      (entry0685 i).Icur = T 46 (238 + i.val) ∧
      (entry0685 i).output = T 47 (238 + i.val) ∧
      (entry0685 i).charge = charge 46 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0701_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0685 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 47) (T 46 (238 + i.val + 1))
      (T 46 (238 + i.val)) (T 47 (238 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0685.entries OriginalRow227TriangleForward0685.checked
    ⟨i.val, by rw [size0685]; exact i.isLt⟩
  change (entry0685 i).check = true at h
  rcases fields0685 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0686 : OriginalRow227TriangleForward0686.entries.size = 32 := rfl

def entry0686 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0686.entries[i.val]'(by rw [size0686]; exact i.isLt)

theorem fields0686 (i : Fin 32) :
    (entry0686 i).IA = shift ∧ (entry0686 i).ID = S (270 + i.val + 1) ∧
      (entry0686 i).IC = S 47 ∧ (entry0686 i).Inext = T 46 (270 + i.val + 1) ∧
      (entry0686 i).Icur = T 46 (270 + i.val) ∧
      (entry0686 i).output = T 47 (270 + i.val) ∧
      (entry0686 i).charge = charge 46 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0702_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0686 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 47) (T 46 (270 + i.val + 1))
      (T 46 (270 + i.val)) (T 47 (270 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0686.entries OriginalRow227TriangleForward0686.checked
    ⟨i.val, by rw [size0686]; exact i.isLt⟩
  change (entry0686 i).check = true at h
  rcases fields0686 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0687 : OriginalRow227TriangleForward0687.entries.size = 32 := rfl

def entry0687 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0687.entries[i.val]'(by rw [size0687]; exact i.isLt)

theorem fields0687 (i : Fin 32) :
    (entry0687 i).IA = shift ∧ (entry0687 i).ID = S (302 + i.val + 1) ∧
      (entry0687 i).IC = S 47 ∧ (entry0687 i).Inext = T 46 (302 + i.val + 1) ∧
      (entry0687 i).Icur = T 46 (302 + i.val) ∧
      (entry0687 i).output = T 47 (302 + i.val) ∧
      (entry0687 i).charge = charge 46 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0703_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0687 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 47) (T 46 (302 + i.val + 1))
      (T 46 (302 + i.val)) (T 47 (302 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0687.entries OriginalRow227TriangleForward0687.checked
    ⟨i.val, by rw [size0687]; exact i.isLt⟩
  change (entry0687 i).check = true at h
  rcases fields0687 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0688 : OriginalRow227TriangleForward0688.entries.size = 32 := rfl

def entry0688 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0688.entries[i.val]'(by rw [size0688]; exact i.isLt)

theorem fields0688 (i : Fin 32) :
    (entry0688 i).IA = shift ∧ (entry0688 i).ID = S (334 + i.val + 1) ∧
      (entry0688 i).IC = S 47 ∧ (entry0688 i).Inext = T 46 (334 + i.val + 1) ∧
      (entry0688 i).Icur = T 46 (334 + i.val) ∧
      (entry0688 i).output = T 47 (334 + i.val) ∧
      (entry0688 i).charge = charge 46 (334 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0704_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0688 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (334 + i.val)) shift
      (S (334 + i.val + 1)) (S 47) (T 46 (334 + i.val + 1))
      (T 46 (334 + i.val)) (T 47 (334 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0688.entries OriginalRow227TriangleForward0688.checked
    ⟨i.val, by rw [size0688]; exact i.isLt⟩
  change (entry0688 i).check = true at h
  rcases fields0688 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0689 : OriginalRow227TriangleForward0689.entries.size = 32 := rfl

def entry0689 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0689.entries[i.val]'(by rw [size0689]; exact i.isLt)

theorem fields0689 (i : Fin 32) :
    (entry0689 i).IA = shift ∧ (entry0689 i).ID = S (366 + i.val + 1) ∧
      (entry0689 i).IC = S 47 ∧ (entry0689 i).Inext = T 46 (366 + i.val + 1) ∧
      (entry0689 i).Icur = T 46 (366 + i.val) ∧
      (entry0689 i).output = T 47 (366 + i.val) ∧
      (entry0689 i).charge = charge 46 (366 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0705_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0689 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (366 + i.val)) shift
      (S (366 + i.val + 1)) (S 47) (T 46 (366 + i.val + 1))
      (T 46 (366 + i.val)) (T 47 (366 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0689.entries OriginalRow227TriangleForward0689.checked
    ⟨i.val, by rw [size0689]; exact i.isLt⟩
  change (entry0689 i).check = true at h
  rcases fields0689 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0690 : OriginalRow227TriangleForward0690.entries.size = 32 := rfl

def entry0690 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0690.entries[i.val]'(by rw [size0690]; exact i.isLt)

theorem fields0690 (i : Fin 32) :
    (entry0690 i).IA = shift ∧ (entry0690 i).ID = S (398 + i.val + 1) ∧
      (entry0690 i).IC = S 47 ∧ (entry0690 i).Inext = T 46 (398 + i.val + 1) ∧
      (entry0690 i).Icur = T 46 (398 + i.val) ∧
      (entry0690 i).output = T 47 (398 + i.val) ∧
      (entry0690 i).charge = charge 46 (398 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0706_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0690 (i : Fin 32) :
    forwardStepOK (-768) (charge 46 (398 + i.val)) shift
      (S (398 + i.val + 1)) (S 47) (T 46 (398 + i.val + 1))
      (T 46 (398 + i.val)) (T 47 (398 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0690.entries OriginalRow227TriangleForward0690.checked
    ⟨i.val, by rw [size0690]; exact i.isLt⟩
  change (entry0690 i).check = true at h
  rcases fields0690 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0691 : OriginalRow227TriangleForward0691.entries.size = 25 := rfl

def entry0691 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0691.entries[i.val]'(by rw [size0691]; exact i.isLt)

theorem fields0691 (i : Fin 25) :
    (entry0691 i).IA = shift ∧ (entry0691 i).ID = S (430 + i.val + 1) ∧
      (entry0691 i).IC = S 47 ∧ (entry0691 i).Inext = T 46 (430 + i.val + 1) ∧
      (entry0691 i).Icur = T 46 (430 + i.val) ∧
      (entry0691 i).output = T 47 (430 + i.val) ∧
      (entry0691 i).charge = charge 46 (430 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root47).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow047.block0707_value ⟨24, by decide⟩).symm, rfl⟩

theorem step0691 (i : Fin 25) :
    forwardStepOK (-768) (charge 46 (430 + i.val)) shift
      (S (430 + i.val + 1)) (S 47) (T 46 (430 + i.val + 1))
      (T 46 (430 + i.val)) (T 47 (430 + i.val))
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0691.entries OriginalRow227TriangleForward0691.checked
    ⟨i.val, by rw [size0691]; exact i.isLt⟩
  change (entry0691 i).check = true at h
  rcases fields0691 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 46 ≤ d) (hhi : d < 455) :
    forwardStepOK (-768) (charge 46 d) shift (S (d + 1)) (S 47)
      (T 46 (d + 1)) (T 46 d) (T 47 d)
      (OriginalRow227Roots.root_pos 47 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 46 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h142 : d < 142
    ·
      by_cases h78 : d < 78
      ·
        have hi : d - 46 < 32 := by omega
        have heq : 46 + (d - 46) = d := by omega
        simpa only [heq] using step0679 ⟨d - 46, hi⟩
      ·
        by_cases h110 : d < 110
        ·
          have hi : d - 78 < 32 := by omega
          have heq : 78 + (d - 78) = d := by omega
          simpa only [heq] using step0680 ⟨d - 78, hi⟩
        ·
          have hi : d - 110 < 32 := by omega
          have heq : 110 + (d - 110) = d := by omega
          simpa only [heq] using step0681 ⟨d - 110, hi⟩
    ·
      by_cases h174 : d < 174
      ·
        have hi : d - 142 < 32 := by omega
        have heq : 142 + (d - 142) = d := by omega
        simpa only [heq] using step0682 ⟨d - 142, hi⟩
      ·
        by_cases h206 : d < 206
        ·
          have hi : d - 174 < 32 := by omega
          have heq : 174 + (d - 174) = d := by omega
          simpa only [heq] using step0683 ⟨d - 174, hi⟩
        ·
          have hi : d - 206 < 32 := by omega
          have heq : 206 + (d - 206) = d := by omega
          simpa only [heq] using step0684 ⟨d - 206, hi⟩
  ·
    by_cases h334 : d < 334
    ·
      by_cases h270 : d < 270
      ·
        have hi : d - 238 < 32 := by omega
        have heq : 238 + (d - 238) = d := by omega
        simpa only [heq] using step0685 ⟨d - 238, hi⟩
      ·
        by_cases h302 : d < 302
        ·
          have hi : d - 270 < 32 := by omega
          have heq : 270 + (d - 270) = d := by omega
          simpa only [heq] using step0686 ⟨d - 270, hi⟩
        ·
          have hi : d - 302 < 32 := by omega
          have heq : 302 + (d - 302) = d := by omega
          simpa only [heq] using step0687 ⟨d - 302, hi⟩
    ·
      by_cases h398 : d < 398
      ·
        by_cases h366 : d < 366
        ·
          have hi : d - 334 < 32 := by omega
          have heq : 334 + (d - 334) = d := by omega
          simpa only [heq] using step0688 ⟨d - 334, hi⟩
        ·
          have hi : d - 366 < 32 := by omega
          have heq : 366 + (d - 366) = d := by omega
          simpa only [heq] using step0689 ⟨d - 366, hi⟩
      ·
        by_cases h430 : d < 430
        ·
          have hi : d - 398 < 32 := by omega
          have heq : 398 + (d - 398) = d := by omega
          simpa only [heq] using step0690 ⟨d - 398, hi⟩
        ·
          have hi : d - 430 < 25 := by omega
          have heq : 430 + (d - 430) = d := by omega
          simpa only [heq] using step0691 ⟨d - 430, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0679,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0679,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0680,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0680,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0681,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0681,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0682,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0682,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0683,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0683,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0684,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0684,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0685,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0685,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0686,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0686,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0687,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0687,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0688,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0688,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0689,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0689,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0690,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0690,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.fields0691,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.step0691,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow047
