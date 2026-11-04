import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow051
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow052
import Grothe.UpperChaos.OriginalRow227TriangleForward0744
import Grothe.UpperChaos.OriginalRow227TriangleForward0745
import Grothe.UpperChaos.OriginalRow227TriangleForward0746
import Grothe.UpperChaos.OriginalRow227TriangleForward0747
import Grothe.UpperChaos.OriginalRow227TriangleForward0748
import Grothe.UpperChaos.OriginalRow227TriangleForward0749
import Grothe.UpperChaos.OriginalRow227TriangleForward0750
import Grothe.UpperChaos.OriginalRow227TriangleForward0751
import Grothe.UpperChaos.OriginalRow227TriangleForward0752
import Grothe.UpperChaos.OriginalRow227TriangleForward0753
import Grothe.UpperChaos.OriginalRow227TriangleForward0754
import Grothe.UpperChaos.OriginalRow227TriangleForward0755
import Grothe.UpperChaos.OriginalRow227TriangleForward0756

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0744 : OriginalRow227TriangleForward0744.entries.size = 32 := rfl

def entry0744 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0744.entries[i.val]'(by rw [size0744]; exact i.isLt)

theorem fields0744 (i : Fin 32) :
    (entry0744 i).IA = shift ∧ (entry0744 i).ID = S (51 + i.val + 1) ∧
      (entry0744 i).IC = S 52 ∧ (entry0744 i).Inext = T 51 (51 + i.val + 1) ∧
      (entry0744 i).Icur = T 51 (51 + i.val) ∧
      (entry0744 i).output = T 52 (51 + i.val) ∧
      (entry0744 i).charge = charge 51 (51 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0747_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0760_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0744 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (51 + i.val)) shift
      (S (51 + i.val + 1)) (S 52) (T 51 (51 + i.val + 1))
      (T 51 (51 + i.val)) (T 52 (51 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0744.entries OriginalRow227TriangleForward0744.checked
    ⟨i.val, by rw [size0744]; exact i.isLt⟩
  change (entry0744 i).check = true at h
  rcases fields0744 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0745 : OriginalRow227TriangleForward0745.entries.size = 32 := rfl

def entry0745 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0745.entries[i.val]'(by rw [size0745]; exact i.isLt)

theorem fields0745 (i : Fin 32) :
    (entry0745 i).IA = shift ∧ (entry0745 i).ID = S (83 + i.val + 1) ∧
      (entry0745 i).IC = S 52 ∧ (entry0745 i).Inext = T 51 (83 + i.val + 1) ∧
      (entry0745 i).Icur = T 51 (83 + i.val) ∧
      (entry0745 i).output = T 52 (83 + i.val) ∧
      (entry0745 i).charge = charge 51 (83 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0748_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0761_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0745 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (83 + i.val)) shift
      (S (83 + i.val + 1)) (S 52) (T 51 (83 + i.val + 1))
      (T 51 (83 + i.val)) (T 52 (83 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0745.entries OriginalRow227TriangleForward0745.checked
    ⟨i.val, by rw [size0745]; exact i.isLt⟩
  change (entry0745 i).check = true at h
  rcases fields0745 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0746 : OriginalRow227TriangleForward0746.entries.size = 32 := rfl

def entry0746 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0746.entries[i.val]'(by rw [size0746]; exact i.isLt)

theorem fields0746 (i : Fin 32) :
    (entry0746 i).IA = shift ∧ (entry0746 i).ID = S (115 + i.val + 1) ∧
      (entry0746 i).IC = S 52 ∧ (entry0746 i).Inext = T 51 (115 + i.val + 1) ∧
      (entry0746 i).Icur = T 51 (115 + i.val) ∧
      (entry0746 i).output = T 52 (115 + i.val) ∧
      (entry0746 i).charge = charge 51 (115 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0749_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0762_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0746 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (115 + i.val)) shift
      (S (115 + i.val + 1)) (S 52) (T 51 (115 + i.val + 1))
      (T 51 (115 + i.val)) (T 52 (115 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0746.entries OriginalRow227TriangleForward0746.checked
    ⟨i.val, by rw [size0746]; exact i.isLt⟩
  change (entry0746 i).check = true at h
  rcases fields0746 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0747 : OriginalRow227TriangleForward0747.entries.size = 32 := rfl

def entry0747 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0747.entries[i.val]'(by rw [size0747]; exact i.isLt)

theorem fields0747 (i : Fin 32) :
    (entry0747 i).IA = shift ∧ (entry0747 i).ID = S (147 + i.val + 1) ∧
      (entry0747 i).IC = S 52 ∧ (entry0747 i).Inext = T 51 (147 + i.val + 1) ∧
      (entry0747 i).Icur = T 51 (147 + i.val) ∧
      (entry0747 i).output = T 52 (147 + i.val) ∧
      (entry0747 i).charge = charge 51 (147 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0750_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0763_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0747 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (147 + i.val)) shift
      (S (147 + i.val + 1)) (S 52) (T 51 (147 + i.val + 1))
      (T 51 (147 + i.val)) (T 52 (147 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0747.entries OriginalRow227TriangleForward0747.checked
    ⟨i.val, by rw [size0747]; exact i.isLt⟩
  change (entry0747 i).check = true at h
  rcases fields0747 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0748 : OriginalRow227TriangleForward0748.entries.size = 32 := rfl

def entry0748 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0748.entries[i.val]'(by rw [size0748]; exact i.isLt)

theorem fields0748 (i : Fin 32) :
    (entry0748 i).IA = shift ∧ (entry0748 i).ID = S (179 + i.val + 1) ∧
      (entry0748 i).IC = S 52 ∧ (entry0748 i).Inext = T 51 (179 + i.val + 1) ∧
      (entry0748 i).Icur = T 51 (179 + i.val) ∧
      (entry0748 i).output = T 52 (179 + i.val) ∧
      (entry0748 i).charge = charge 51 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0751_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0764_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0748 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 52) (T 51 (179 + i.val + 1))
      (T 51 (179 + i.val)) (T 52 (179 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0748.entries OriginalRow227TriangleForward0748.checked
    ⟨i.val, by rw [size0748]; exact i.isLt⟩
  change (entry0748 i).check = true at h
  rcases fields0748 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0749 : OriginalRow227TriangleForward0749.entries.size = 32 := rfl

def entry0749 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0749.entries[i.val]'(by rw [size0749]; exact i.isLt)

theorem fields0749 (i : Fin 32) :
    (entry0749 i).IA = shift ∧ (entry0749 i).ID = S (211 + i.val + 1) ∧
      (entry0749 i).IC = S 52 ∧ (entry0749 i).Inext = T 51 (211 + i.val + 1) ∧
      (entry0749 i).Icur = T 51 (211 + i.val) ∧
      (entry0749 i).output = T 52 (211 + i.val) ∧
      (entry0749 i).charge = charge 51 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0752_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0765_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0749 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 52) (T 51 (211 + i.val + 1))
      (T 51 (211 + i.val)) (T 52 (211 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0749.entries OriginalRow227TriangleForward0749.checked
    ⟨i.val, by rw [size0749]; exact i.isLt⟩
  change (entry0749 i).check = true at h
  rcases fields0749 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0750 : OriginalRow227TriangleForward0750.entries.size = 32 := rfl

def entry0750 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0750.entries[i.val]'(by rw [size0750]; exact i.isLt)

theorem fields0750 (i : Fin 32) :
    (entry0750 i).IA = shift ∧ (entry0750 i).ID = S (243 + i.val + 1) ∧
      (entry0750 i).IC = S 52 ∧ (entry0750 i).Inext = T 51 (243 + i.val + 1) ∧
      (entry0750 i).Icur = T 51 (243 + i.val) ∧
      (entry0750 i).output = T 52 (243 + i.val) ∧
      (entry0750 i).charge = charge 51 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0753_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0766_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0750 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 52) (T 51 (243 + i.val + 1))
      (T 51 (243 + i.val)) (T 52 (243 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0750.entries OriginalRow227TriangleForward0750.checked
    ⟨i.val, by rw [size0750]; exact i.isLt⟩
  change (entry0750 i).check = true at h
  rcases fields0750 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0751 : OriginalRow227TriangleForward0751.entries.size = 32 := rfl

def entry0751 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0751.entries[i.val]'(by rw [size0751]; exact i.isLt)

theorem fields0751 (i : Fin 32) :
    (entry0751 i).IA = shift ∧ (entry0751 i).ID = S (275 + i.val + 1) ∧
      (entry0751 i).IC = S 52 ∧ (entry0751 i).Inext = T 51 (275 + i.val + 1) ∧
      (entry0751 i).Icur = T 51 (275 + i.val) ∧
      (entry0751 i).output = T 52 (275 + i.val) ∧
      (entry0751 i).charge = charge 51 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0754_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0767_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0751 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 52) (T 51 (275 + i.val + 1))
      (T 51 (275 + i.val)) (T 52 (275 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0751.entries OriginalRow227TriangleForward0751.checked
    ⟨i.val, by rw [size0751]; exact i.isLt⟩
  change (entry0751 i).check = true at h
  rcases fields0751 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0752 : OriginalRow227TriangleForward0752.entries.size = 32 := rfl

def entry0752 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0752.entries[i.val]'(by rw [size0752]; exact i.isLt)

theorem fields0752 (i : Fin 32) :
    (entry0752 i).IA = shift ∧ (entry0752 i).ID = S (307 + i.val + 1) ∧
      (entry0752 i).IC = S 52 ∧ (entry0752 i).Inext = T 51 (307 + i.val + 1) ∧
      (entry0752 i).Icur = T 51 (307 + i.val) ∧
      (entry0752 i).output = T 52 (307 + i.val) ∧
      (entry0752 i).charge = charge 51 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0755_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0768_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0752 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 52) (T 51 (307 + i.val + 1))
      (T 51 (307 + i.val)) (T 52 (307 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0752.entries OriginalRow227TriangleForward0752.checked
    ⟨i.val, by rw [size0752]; exact i.isLt⟩
  change (entry0752 i).check = true at h
  rcases fields0752 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0753 : OriginalRow227TriangleForward0753.entries.size = 32 := rfl

def entry0753 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0753.entries[i.val]'(by rw [size0753]; exact i.isLt)

theorem fields0753 (i : Fin 32) :
    (entry0753 i).IA = shift ∧ (entry0753 i).ID = S (339 + i.val + 1) ∧
      (entry0753 i).IC = S 52 ∧ (entry0753 i).Inext = T 51 (339 + i.val + 1) ∧
      (entry0753 i).Icur = T 51 (339 + i.val) ∧
      (entry0753 i).output = T 52 (339 + i.val) ∧
      (entry0753 i).charge = charge 51 (339 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0756_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0769_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0753 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (339 + i.val)) shift
      (S (339 + i.val + 1)) (S 52) (T 51 (339 + i.val + 1))
      (T 51 (339 + i.val)) (T 52 (339 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0753.entries OriginalRow227TriangleForward0753.checked
    ⟨i.val, by rw [size0753]; exact i.isLt⟩
  change (entry0753 i).check = true at h
  rcases fields0753 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0754 : OriginalRow227TriangleForward0754.entries.size = 32 := rfl

def entry0754 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0754.entries[i.val]'(by rw [size0754]; exact i.isLt)

theorem fields0754 (i : Fin 32) :
    (entry0754 i).IA = shift ∧ (entry0754 i).ID = S (371 + i.val + 1) ∧
      (entry0754 i).IC = S 52 ∧ (entry0754 i).Inext = T 51 (371 + i.val + 1) ∧
      (entry0754 i).Icur = T 51 (371 + i.val) ∧
      (entry0754 i).output = T 52 (371 + i.val) ∧
      (entry0754 i).charge = charge 51 (371 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0757_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0770_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0754 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (371 + i.val)) shift
      (S (371 + i.val + 1)) (S 52) (T 51 (371 + i.val + 1))
      (T 51 (371 + i.val)) (T 52 (371 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0754.entries OriginalRow227TriangleForward0754.checked
    ⟨i.val, by rw [size0754]; exact i.isLt⟩
  change (entry0754 i).check = true at h
  rcases fields0754 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0755 : OriginalRow227TriangleForward0755.entries.size = 32 := rfl

def entry0755 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0755.entries[i.val]'(by rw [size0755]; exact i.isLt)

theorem fields0755 (i : Fin 32) :
    (entry0755 i).IA = shift ∧ (entry0755 i).ID = S (403 + i.val + 1) ∧
      (entry0755 i).IC = S 52 ∧ (entry0755 i).Inext = T 51 (403 + i.val + 1) ∧
      (entry0755 i).Icur = T 51 (403 + i.val) ∧
      (entry0755 i).output = T 52 (403 + i.val) ∧
      (entry0755 i).charge = charge 51 (403 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0758_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0771_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0755 (i : Fin 32) :
    forwardStepOK (-768) (charge 51 (403 + i.val)) shift
      (S (403 + i.val + 1)) (S 52) (T 51 (403 + i.val + 1))
      (T 51 (403 + i.val)) (T 52 (403 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0755.entries OriginalRow227TriangleForward0755.checked
    ⟨i.val, by rw [size0755]; exact i.isLt⟩
  change (entry0755 i).check = true at h
  rcases fields0755 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0756 : OriginalRow227TriangleForward0756.entries.size = 15 := rfl

def entry0756 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0756.entries[i.val]'(by rw [size0756]; exact i.isLt)

theorem fields0756 (i : Fin 15) :
    (entry0756 i).IA = shift ∧ (entry0756 i).ID = S (435 + i.val + 1) ∧
      (entry0756 i).IC = S 52 ∧ (entry0756 i).Inext = T 51 (435 + i.val + 1) ∧
      (entry0756 i).Icur = T 51 (435 + i.val) ∧
      (entry0756 i).output = T 52 (435 + i.val) ∧
      (entry0756 i).charge = charge 51 (435 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root52).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow051.block0759_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow052.block0772_value ⟨14, by decide⟩).symm, rfl⟩

theorem step0756 (i : Fin 15) :
    forwardStepOK (-768) (charge 51 (435 + i.val)) shift
      (S (435 + i.val + 1)) (S 52) (T 51 (435 + i.val + 1))
      (T 51 (435 + i.val)) (T 52 (435 + i.val))
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0756.entries OriginalRow227TriangleForward0756.checked
    ⟨i.val, by rw [size0756]; exact i.isLt⟩
  change (entry0756 i).check = true at h
  rcases fields0756 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 51 ≤ d) (hhi : d < 450) :
    forwardStepOK (-768) (charge 51 d) shift (S (d + 1)) (S 52)
      (T 51 (d + 1)) (T 51 d) (T 52 d)
      (OriginalRow227Roots.root_pos 52 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 51 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h147 : d < 147
    ·
      by_cases h83 : d < 83
      ·
        have hi : d - 51 < 32 := by omega
        have heq : 51 + (d - 51) = d := by omega
        simpa only [heq] using step0744 ⟨d - 51, hi⟩
      ·
        by_cases h115 : d < 115
        ·
          have hi : d - 83 < 32 := by omega
          have heq : 83 + (d - 83) = d := by omega
          simpa only [heq] using step0745 ⟨d - 83, hi⟩
        ·
          have hi : d - 115 < 32 := by omega
          have heq : 115 + (d - 115) = d := by omega
          simpa only [heq] using step0746 ⟨d - 115, hi⟩
    ·
      by_cases h179 : d < 179
      ·
        have hi : d - 147 < 32 := by omega
        have heq : 147 + (d - 147) = d := by omega
        simpa only [heq] using step0747 ⟨d - 147, hi⟩
      ·
        by_cases h211 : d < 211
        ·
          have hi : d - 179 < 32 := by omega
          have heq : 179 + (d - 179) = d := by omega
          simpa only [heq] using step0748 ⟨d - 179, hi⟩
        ·
          have hi : d - 211 < 32 := by omega
          have heq : 211 + (d - 211) = d := by omega
          simpa only [heq] using step0749 ⟨d - 211, hi⟩
  ·
    by_cases h339 : d < 339
    ·
      by_cases h275 : d < 275
      ·
        have hi : d - 243 < 32 := by omega
        have heq : 243 + (d - 243) = d := by omega
        simpa only [heq] using step0750 ⟨d - 243, hi⟩
      ·
        by_cases h307 : d < 307
        ·
          have hi : d - 275 < 32 := by omega
          have heq : 275 + (d - 275) = d := by omega
          simpa only [heq] using step0751 ⟨d - 275, hi⟩
        ·
          have hi : d - 307 < 32 := by omega
          have heq : 307 + (d - 307) = d := by omega
          simpa only [heq] using step0752 ⟨d - 307, hi⟩
    ·
      by_cases h403 : d < 403
      ·
        by_cases h371 : d < 371
        ·
          have hi : d - 339 < 32 := by omega
          have heq : 339 + (d - 339) = d := by omega
          simpa only [heq] using step0753 ⟨d - 339, hi⟩
        ·
          have hi : d - 371 < 32 := by omega
          have heq : 371 + (d - 371) = d := by omega
          simpa only [heq] using step0754 ⟨d - 371, hi⟩
      ·
        by_cases h435 : d < 435
        ·
          have hi : d - 403 < 32 := by omega
          have heq : 403 + (d - 403) = d := by omega
          simpa only [heq] using step0755 ⟨d - 403, hi⟩
        ·
          have hi : d - 435 < 15 := by omega
          have heq : 435 + (d - 435) = d := by omega
          simpa only [heq] using step0756 ⟨d - 435, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0744,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0744,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0745,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0745,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0746,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0746,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0747,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0747,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0748,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0748,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0749,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0749,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0750,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0750,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0751,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0751,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0752,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0752,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0753,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0753,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0754,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0754,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0755,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0755,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.fields0756,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.step0756,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow052
