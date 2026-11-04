import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow042
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043
import Grothe.UpperChaos.OriginalRow227TriangleForward0626
import Grothe.UpperChaos.OriginalRow227TriangleForward0627
import Grothe.UpperChaos.OriginalRow227TriangleForward0628
import Grothe.UpperChaos.OriginalRow227TriangleForward0629
import Grothe.UpperChaos.OriginalRow227TriangleForward0630
import Grothe.UpperChaos.OriginalRow227TriangleForward0631
import Grothe.UpperChaos.OriginalRow227TriangleForward0632
import Grothe.UpperChaos.OriginalRow227TriangleForward0633
import Grothe.UpperChaos.OriginalRow227TriangleForward0634
import Grothe.UpperChaos.OriginalRow227TriangleForward0635
import Grothe.UpperChaos.OriginalRow227TriangleForward0636
import Grothe.UpperChaos.OriginalRow227TriangleForward0637
import Grothe.UpperChaos.OriginalRow227TriangleForward0638
import Grothe.UpperChaos.OriginalRow227TriangleForward0639

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0626 : OriginalRow227TriangleForward0626.entries.size = 32 := rfl

def entry0626 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0626.entries[i.val]'(by rw [size0626]; exact i.isLt)

theorem fields0626 (i : Fin 32) :
    (entry0626 i).IA = shift ∧ (entry0626 i).ID = S (42 + i.val + 1) ∧
      (entry0626 i).IC = S 43 ∧ (entry0626 i).Inext = T 42 (42 + i.val + 1) ∧
      (entry0626 i).Icur = T 42 (42 + i.val) ∧
      (entry0626 i).output = T 43 (42 + i.val) ∧
      (entry0626 i).charge = charge 42 (42 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0628_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0626 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (42 + i.val)) shift
      (S (42 + i.val + 1)) (S 43) (T 42 (42 + i.val + 1))
      (T 42 (42 + i.val)) (T 43 (42 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0626.entries OriginalRow227TriangleForward0626.checked
    ⟨i.val, by rw [size0626]; exact i.isLt⟩
  change (entry0626 i).check = true at h
  rcases fields0626 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0627 : OriginalRow227TriangleForward0627.entries.size = 32 := rfl

def entry0627 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0627.entries[i.val]'(by rw [size0627]; exact i.isLt)

theorem fields0627 (i : Fin 32) :
    (entry0627 i).IA = shift ∧ (entry0627 i).ID = S (74 + i.val + 1) ∧
      (entry0627 i).IC = S 43 ∧ (entry0627 i).Inext = T 42 (74 + i.val + 1) ∧
      (entry0627 i).Icur = T 42 (74 + i.val) ∧
      (entry0627 i).output = T 43 (74 + i.val) ∧
      (entry0627 i).charge = charge 42 (74 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0629_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0627 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (74 + i.val)) shift
      (S (74 + i.val + 1)) (S 43) (T 42 (74 + i.val + 1))
      (T 42 (74 + i.val)) (T 43 (74 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0627.entries OriginalRow227TriangleForward0627.checked
    ⟨i.val, by rw [size0627]; exact i.isLt⟩
  change (entry0627 i).check = true at h
  rcases fields0627 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0628 : OriginalRow227TriangleForward0628.entries.size = 32 := rfl

def entry0628 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0628.entries[i.val]'(by rw [size0628]; exact i.isLt)

theorem fields0628 (i : Fin 32) :
    (entry0628 i).IA = shift ∧ (entry0628 i).ID = S (106 + i.val + 1) ∧
      (entry0628 i).IC = S 43 ∧ (entry0628 i).Inext = T 42 (106 + i.val + 1) ∧
      (entry0628 i).Icur = T 42 (106 + i.val) ∧
      (entry0628 i).output = T 43 (106 + i.val) ∧
      (entry0628 i).charge = charge 42 (106 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0630_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0628 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (106 + i.val)) shift
      (S (106 + i.val + 1)) (S 43) (T 42 (106 + i.val + 1))
      (T 42 (106 + i.val)) (T 43 (106 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0628.entries OriginalRow227TriangleForward0628.checked
    ⟨i.val, by rw [size0628]; exact i.isLt⟩
  change (entry0628 i).check = true at h
  rcases fields0628 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0629 : OriginalRow227TriangleForward0629.entries.size = 32 := rfl

def entry0629 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0629.entries[i.val]'(by rw [size0629]; exact i.isLt)

theorem fields0629 (i : Fin 32) :
    (entry0629 i).IA = shift ∧ (entry0629 i).ID = S (138 + i.val + 1) ∧
      (entry0629 i).IC = S 43 ∧ (entry0629 i).Inext = T 42 (138 + i.val + 1) ∧
      (entry0629 i).Icur = T 42 (138 + i.val) ∧
      (entry0629 i).output = T 43 (138 + i.val) ∧
      (entry0629 i).charge = charge 42 (138 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0631_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0629 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (138 + i.val)) shift
      (S (138 + i.val + 1)) (S 43) (T 42 (138 + i.val + 1))
      (T 42 (138 + i.val)) (T 43 (138 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0629.entries OriginalRow227TriangleForward0629.checked
    ⟨i.val, by rw [size0629]; exact i.isLt⟩
  change (entry0629 i).check = true at h
  rcases fields0629 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0630 : OriginalRow227TriangleForward0630.entries.size = 32 := rfl

def entry0630 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0630.entries[i.val]'(by rw [size0630]; exact i.isLt)

theorem fields0630 (i : Fin 32) :
    (entry0630 i).IA = shift ∧ (entry0630 i).ID = S (170 + i.val + 1) ∧
      (entry0630 i).IC = S 43 ∧ (entry0630 i).Inext = T 42 (170 + i.val + 1) ∧
      (entry0630 i).Icur = T 42 (170 + i.val) ∧
      (entry0630 i).output = T 43 (170 + i.val) ∧
      (entry0630 i).charge = charge 42 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0632_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0630 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 43) (T 42 (170 + i.val + 1))
      (T 42 (170 + i.val)) (T 43 (170 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0630.entries OriginalRow227TriangleForward0630.checked
    ⟨i.val, by rw [size0630]; exact i.isLt⟩
  change (entry0630 i).check = true at h
  rcases fields0630 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0631 : OriginalRow227TriangleForward0631.entries.size = 32 := rfl

def entry0631 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0631.entries[i.val]'(by rw [size0631]; exact i.isLt)

theorem fields0631 (i : Fin 32) :
    (entry0631 i).IA = shift ∧ (entry0631 i).ID = S (202 + i.val + 1) ∧
      (entry0631 i).IC = S 43 ∧ (entry0631 i).Inext = T 42 (202 + i.val + 1) ∧
      (entry0631 i).Icur = T 42 (202 + i.val) ∧
      (entry0631 i).output = T 43 (202 + i.val) ∧
      (entry0631 i).charge = charge 42 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0633_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0631 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 43) (T 42 (202 + i.val + 1))
      (T 42 (202 + i.val)) (T 43 (202 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0631.entries OriginalRow227TriangleForward0631.checked
    ⟨i.val, by rw [size0631]; exact i.isLt⟩
  change (entry0631 i).check = true at h
  rcases fields0631 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0632 : OriginalRow227TriangleForward0632.entries.size = 32 := rfl

def entry0632 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0632.entries[i.val]'(by rw [size0632]; exact i.isLt)

theorem fields0632 (i : Fin 32) :
    (entry0632 i).IA = shift ∧ (entry0632 i).ID = S (234 + i.val + 1) ∧
      (entry0632 i).IC = S 43 ∧ (entry0632 i).Inext = T 42 (234 + i.val + 1) ∧
      (entry0632 i).Icur = T 42 (234 + i.val) ∧
      (entry0632 i).output = T 43 (234 + i.val) ∧
      (entry0632 i).charge = charge 42 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0634_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0632 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 43) (T 42 (234 + i.val + 1))
      (T 42 (234 + i.val)) (T 43 (234 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0632.entries OriginalRow227TriangleForward0632.checked
    ⟨i.val, by rw [size0632]; exact i.isLt⟩
  change (entry0632 i).check = true at h
  rcases fields0632 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0633 : OriginalRow227TriangleForward0633.entries.size = 32 := rfl

def entry0633 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0633.entries[i.val]'(by rw [size0633]; exact i.isLt)

theorem fields0633 (i : Fin 32) :
    (entry0633 i).IA = shift ∧ (entry0633 i).ID = S (266 + i.val + 1) ∧
      (entry0633 i).IC = S 43 ∧ (entry0633 i).Inext = T 42 (266 + i.val + 1) ∧
      (entry0633 i).Icur = T 42 (266 + i.val) ∧
      (entry0633 i).output = T 43 (266 + i.val) ∧
      (entry0633 i).charge = charge 42 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0635_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0633 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 43) (T 42 (266 + i.val + 1))
      (T 42 (266 + i.val)) (T 43 (266 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0633.entries OriginalRow227TriangleForward0633.checked
    ⟨i.val, by rw [size0633]; exact i.isLt⟩
  change (entry0633 i).check = true at h
  rcases fields0633 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0634 : OriginalRow227TriangleForward0634.entries.size = 32 := rfl

def entry0634 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0634.entries[i.val]'(by rw [size0634]; exact i.isLt)

theorem fields0634 (i : Fin 32) :
    (entry0634 i).IA = shift ∧ (entry0634 i).ID = S (298 + i.val + 1) ∧
      (entry0634 i).IC = S 43 ∧ (entry0634 i).Inext = T 42 (298 + i.val + 1) ∧
      (entry0634 i).Icur = T 42 (298 + i.val) ∧
      (entry0634 i).output = T 43 (298 + i.val) ∧
      (entry0634 i).charge = charge 42 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0636_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0634 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 43) (T 42 (298 + i.val + 1))
      (T 42 (298 + i.val)) (T 43 (298 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0634.entries OriginalRow227TriangleForward0634.checked
    ⟨i.val, by rw [size0634]; exact i.isLt⟩
  change (entry0634 i).check = true at h
  rcases fields0634 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0635 : OriginalRow227TriangleForward0635.entries.size = 32 := rfl

def entry0635 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0635.entries[i.val]'(by rw [size0635]; exact i.isLt)

theorem fields0635 (i : Fin 32) :
    (entry0635 i).IA = shift ∧ (entry0635 i).ID = S (330 + i.val + 1) ∧
      (entry0635 i).IC = S 43 ∧ (entry0635 i).Inext = T 42 (330 + i.val + 1) ∧
      (entry0635 i).Icur = T 42 (330 + i.val) ∧
      (entry0635 i).output = T 43 (330 + i.val) ∧
      (entry0635 i).charge = charge 42 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0637_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0635 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 43) (T 42 (330 + i.val + 1))
      (T 42 (330 + i.val)) (T 43 (330 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0635.entries OriginalRow227TriangleForward0635.checked
    ⟨i.val, by rw [size0635]; exact i.isLt⟩
  change (entry0635 i).check = true at h
  rcases fields0635 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0636 : OriginalRow227TriangleForward0636.entries.size = 32 := rfl

def entry0636 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0636.entries[i.val]'(by rw [size0636]; exact i.isLt)

theorem fields0636 (i : Fin 32) :
    (entry0636 i).IA = shift ∧ (entry0636 i).ID = S (362 + i.val + 1) ∧
      (entry0636 i).IC = S 43 ∧ (entry0636 i).Inext = T 42 (362 + i.val + 1) ∧
      (entry0636 i).Icur = T 42 (362 + i.val) ∧
      (entry0636 i).output = T 43 (362 + i.val) ∧
      (entry0636 i).charge = charge 42 (362 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0638_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0636 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (362 + i.val)) shift
      (S (362 + i.val + 1)) (S 43) (T 42 (362 + i.val + 1))
      (T 42 (362 + i.val)) (T 43 (362 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0636.entries OriginalRow227TriangleForward0636.checked
    ⟨i.val, by rw [size0636]; exact i.isLt⟩
  change (entry0636 i).check = true at h
  rcases fields0636 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0637 : OriginalRow227TriangleForward0637.entries.size = 32 := rfl

def entry0637 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0637.entries[i.val]'(by rw [size0637]; exact i.isLt)

theorem fields0637 (i : Fin 32) :
    (entry0637 i).IA = shift ∧ (entry0637 i).ID = S (394 + i.val + 1) ∧
      (entry0637 i).IC = S 43 ∧ (entry0637 i).Inext = T 42 (394 + i.val + 1) ∧
      (entry0637 i).Icur = T 42 (394 + i.val) ∧
      (entry0637 i).output = T 43 (394 + i.val) ∧
      (entry0637 i).charge = charge 42 (394 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0639_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0637 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (394 + i.val)) shift
      (S (394 + i.val + 1)) (S 43) (T 42 (394 + i.val + 1))
      (T 42 (394 + i.val)) (T 43 (394 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0637.entries OriginalRow227TriangleForward0637.checked
    ⟨i.val, by rw [size0637]; exact i.isLt⟩
  change (entry0637 i).check = true at h
  rcases fields0637 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0638 : OriginalRow227TriangleForward0638.entries.size = 32 := rfl

def entry0638 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0638.entries[i.val]'(by rw [size0638]; exact i.isLt)

theorem fields0638 (i : Fin 32) :
    (entry0638 i).IA = shift ∧ (entry0638 i).ID = S (426 + i.val + 1) ∧
      (entry0638 i).IC = S 43 ∧ (entry0638 i).Inext = T 42 (426 + i.val + 1) ∧
      (entry0638 i).Icur = T 42 (426 + i.val) ∧
      (entry0638 i).output = T 43 (426 + i.val) ∧
      (entry0638 i).charge = charge 42 (426 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0640_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0638 (i : Fin 32) :
    forwardStepOK (-768) (charge 42 (426 + i.val)) shift
      (S (426 + i.val + 1)) (S 43) (T 42 (426 + i.val + 1))
      (T 42 (426 + i.val)) (T 43 (426 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0638.entries OriginalRow227TriangleForward0638.checked
    ⟨i.val, by rw [size0638]; exact i.isLt⟩
  change (entry0638 i).check = true at h
  rcases fields0638 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0639 : OriginalRow227TriangleForward0639.entries.size = 1 := rfl

def entry0639 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0639.entries[i.val]'(by rw [size0639]; exact i.isLt)

theorem fields0639 (i : Fin 1) :
    (entry0639 i).IA = shift ∧ (entry0639 i).ID = S (458 + i.val + 1) ∧
      (entry0639 i).IC = S 43 ∧ (entry0639 i).Inext = T 42 (458 + i.val + 1) ∧
      (entry0639 i).Icur = T 42 (458 + i.val) ∧
      (entry0639 i).output = T 43 (458 + i.val) ∧
      (entry0639 i).charge = charge 42 (458 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root43).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow042.block0641_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0655_value ⟨0, by decide⟩).symm, rfl⟩

theorem step0639 (i : Fin 1) :
    forwardStepOK (-768) (charge 42 (458 + i.val)) shift
      (S (458 + i.val + 1)) (S 43) (T 42 (458 + i.val + 1))
      (T 42 (458 + i.val)) (T 43 (458 + i.val))
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0639.entries OriginalRow227TriangleForward0639.checked
    ⟨i.val, by rw [size0639]; exact i.isLt⟩
  change (entry0639 i).check = true at h
  rcases fields0639 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 42 ≤ d) (hhi : d < 459) :
    forwardStepOK (-768) (charge 42 d) shift (S (d + 1)) (S 43)
      (T 42 (d + 1)) (T 42 d) (T 43 d)
      (OriginalRow227Roots.root_pos 43 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 42 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h138 : d < 138
    ·
      by_cases h74 : d < 74
      ·
        have hi : d - 42 < 32 := by omega
        have heq : 42 + (d - 42) = d := by omega
        simpa only [heq] using step0626 ⟨d - 42, hi⟩
      ·
        by_cases h106 : d < 106
        ·
          have hi : d - 74 < 32 := by omega
          have heq : 74 + (d - 74) = d := by omega
          simpa only [heq] using step0627 ⟨d - 74, hi⟩
        ·
          have hi : d - 106 < 32 := by omega
          have heq : 106 + (d - 106) = d := by omega
          simpa only [heq] using step0628 ⟨d - 106, hi⟩
    ·
      by_cases h202 : d < 202
      ·
        by_cases h170 : d < 170
        ·
          have hi : d - 138 < 32 := by omega
          have heq : 138 + (d - 138) = d := by omega
          simpa only [heq] using step0629 ⟨d - 138, hi⟩
        ·
          have hi : d - 170 < 32 := by omega
          have heq : 170 + (d - 170) = d := by omega
          simpa only [heq] using step0630 ⟨d - 170, hi⟩
      ·
        by_cases h234 : d < 234
        ·
          have hi : d - 202 < 32 := by omega
          have heq : 202 + (d - 202) = d := by omega
          simpa only [heq] using step0631 ⟨d - 202, hi⟩
        ·
          have hi : d - 234 < 32 := by omega
          have heq : 234 + (d - 234) = d := by omega
          simpa only [heq] using step0632 ⟨d - 234, hi⟩
  ·
    by_cases h362 : d < 362
    ·
      by_cases h298 : d < 298
      ·
        have hi : d - 266 < 32 := by omega
        have heq : 266 + (d - 266) = d := by omega
        simpa only [heq] using step0633 ⟨d - 266, hi⟩
      ·
        by_cases h330 : d < 330
        ·
          have hi : d - 298 < 32 := by omega
          have heq : 298 + (d - 298) = d := by omega
          simpa only [heq] using step0634 ⟨d - 298, hi⟩
        ·
          have hi : d - 330 < 32 := by omega
          have heq : 330 + (d - 330) = d := by omega
          simpa only [heq] using step0635 ⟨d - 330, hi⟩
    ·
      by_cases h426 : d < 426
      ·
        by_cases h394 : d < 394
        ·
          have hi : d - 362 < 32 := by omega
          have heq : 362 + (d - 362) = d := by omega
          simpa only [heq] using step0636 ⟨d - 362, hi⟩
        ·
          have hi : d - 394 < 32 := by omega
          have heq : 394 + (d - 394) = d := by omega
          simpa only [heq] using step0637 ⟨d - 394, hi⟩
      ·
        by_cases h458 : d < 458
        ·
          have hi : d - 426 < 32 := by omega
          have heq : 426 + (d - 426) = d := by omega
          simpa only [heq] using step0638 ⟨d - 426, hi⟩
        ·
          have hi : d - 458 < 1 := by omega
          have heq : 458 + (d - 458) = d := by omega
          simpa only [heq] using step0639 ⟨d - 458, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0626,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0626,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0627,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0627,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0628,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0628,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0629,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0629,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0630,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0630,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0631,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0631,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0632,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0632,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0633,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0633,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0634,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0634,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0635,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0635,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0636,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0636,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0637,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0637,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0638,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0638,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.fields0639,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.step0639,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow043
