import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow043
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044
import Grothe.UpperChaos.OriginalRow227TriangleForward0640
import Grothe.UpperChaos.OriginalRow227TriangleForward0641
import Grothe.UpperChaos.OriginalRow227TriangleForward0642
import Grothe.UpperChaos.OriginalRow227TriangleForward0643
import Grothe.UpperChaos.OriginalRow227TriangleForward0644
import Grothe.UpperChaos.OriginalRow227TriangleForward0645
import Grothe.UpperChaos.OriginalRow227TriangleForward0646
import Grothe.UpperChaos.OriginalRow227TriangleForward0647
import Grothe.UpperChaos.OriginalRow227TriangleForward0648
import Grothe.UpperChaos.OriginalRow227TriangleForward0649
import Grothe.UpperChaos.OriginalRow227TriangleForward0650
import Grothe.UpperChaos.OriginalRow227TriangleForward0651
import Grothe.UpperChaos.OriginalRow227TriangleForward0652

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0640 : OriginalRow227TriangleForward0640.entries.size = 32 := rfl

def entry0640 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0640.entries[i.val]'(by rw [size0640]; exact i.isLt)

theorem fields0640 (i : Fin 32) :
    (entry0640 i).IA = shift ∧ (entry0640 i).ID = S (43 + i.val + 1) ∧
      (entry0640 i).IC = S 44 ∧ (entry0640 i).Inext = T 43 (43 + i.val + 1) ∧
      (entry0640 i).Icur = T 43 (43 + i.val) ∧
      (entry0640 i).output = T 44 (43 + i.val) ∧
      (entry0640 i).charge = charge 43 (43 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0642_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0640 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (43 + i.val)) shift
      (S (43 + i.val + 1)) (S 44) (T 43 (43 + i.val + 1))
      (T 43 (43 + i.val)) (T 44 (43 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0640.entries OriginalRow227TriangleForward0640.checked
    ⟨i.val, by rw [size0640]; exact i.isLt⟩
  change (entry0640 i).check = true at h
  rcases fields0640 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0641 : OriginalRow227TriangleForward0641.entries.size = 32 := rfl

def entry0641 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0641.entries[i.val]'(by rw [size0641]; exact i.isLt)

theorem fields0641 (i : Fin 32) :
    (entry0641 i).IA = shift ∧ (entry0641 i).ID = S (75 + i.val + 1) ∧
      (entry0641 i).IC = S 44 ∧ (entry0641 i).Inext = T 43 (75 + i.val + 1) ∧
      (entry0641 i).Icur = T 43 (75 + i.val) ∧
      (entry0641 i).output = T 44 (75 + i.val) ∧
      (entry0641 i).charge = charge 43 (75 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0643_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0641 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (75 + i.val)) shift
      (S (75 + i.val + 1)) (S 44) (T 43 (75 + i.val + 1))
      (T 43 (75 + i.val)) (T 44 (75 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0641.entries OriginalRow227TriangleForward0641.checked
    ⟨i.val, by rw [size0641]; exact i.isLt⟩
  change (entry0641 i).check = true at h
  rcases fields0641 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0642 : OriginalRow227TriangleForward0642.entries.size = 32 := rfl

def entry0642 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0642.entries[i.val]'(by rw [size0642]; exact i.isLt)

theorem fields0642 (i : Fin 32) :
    (entry0642 i).IA = shift ∧ (entry0642 i).ID = S (107 + i.val + 1) ∧
      (entry0642 i).IC = S 44 ∧ (entry0642 i).Inext = T 43 (107 + i.val + 1) ∧
      (entry0642 i).Icur = T 43 (107 + i.val) ∧
      (entry0642 i).output = T 44 (107 + i.val) ∧
      (entry0642 i).charge = charge 43 (107 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0644_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0642 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (107 + i.val)) shift
      (S (107 + i.val + 1)) (S 44) (T 43 (107 + i.val + 1))
      (T 43 (107 + i.val)) (T 44 (107 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0642.entries OriginalRow227TriangleForward0642.checked
    ⟨i.val, by rw [size0642]; exact i.isLt⟩
  change (entry0642 i).check = true at h
  rcases fields0642 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0643 : OriginalRow227TriangleForward0643.entries.size = 32 := rfl

def entry0643 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0643.entries[i.val]'(by rw [size0643]; exact i.isLt)

theorem fields0643 (i : Fin 32) :
    (entry0643 i).IA = shift ∧ (entry0643 i).ID = S (139 + i.val + 1) ∧
      (entry0643 i).IC = S 44 ∧ (entry0643 i).Inext = T 43 (139 + i.val + 1) ∧
      (entry0643 i).Icur = T 43 (139 + i.val) ∧
      (entry0643 i).output = T 44 (139 + i.val) ∧
      (entry0643 i).charge = charge 43 (139 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0645_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0643 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (139 + i.val)) shift
      (S (139 + i.val + 1)) (S 44) (T 43 (139 + i.val + 1))
      (T 43 (139 + i.val)) (T 44 (139 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0643.entries OriginalRow227TriangleForward0643.checked
    ⟨i.val, by rw [size0643]; exact i.isLt⟩
  change (entry0643 i).check = true at h
  rcases fields0643 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0644 : OriginalRow227TriangleForward0644.entries.size = 32 := rfl

def entry0644 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0644.entries[i.val]'(by rw [size0644]; exact i.isLt)

theorem fields0644 (i : Fin 32) :
    (entry0644 i).IA = shift ∧ (entry0644 i).ID = S (171 + i.val + 1) ∧
      (entry0644 i).IC = S 44 ∧ (entry0644 i).Inext = T 43 (171 + i.val + 1) ∧
      (entry0644 i).Icur = T 43 (171 + i.val) ∧
      (entry0644 i).output = T 44 (171 + i.val) ∧
      (entry0644 i).charge = charge 43 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0646_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0644 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 44) (T 43 (171 + i.val + 1))
      (T 43 (171 + i.val)) (T 44 (171 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0644.entries OriginalRow227TriangleForward0644.checked
    ⟨i.val, by rw [size0644]; exact i.isLt⟩
  change (entry0644 i).check = true at h
  rcases fields0644 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0645 : OriginalRow227TriangleForward0645.entries.size = 32 := rfl

def entry0645 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0645.entries[i.val]'(by rw [size0645]; exact i.isLt)

theorem fields0645 (i : Fin 32) :
    (entry0645 i).IA = shift ∧ (entry0645 i).ID = S (203 + i.val + 1) ∧
      (entry0645 i).IC = S 44 ∧ (entry0645 i).Inext = T 43 (203 + i.val + 1) ∧
      (entry0645 i).Icur = T 43 (203 + i.val) ∧
      (entry0645 i).output = T 44 (203 + i.val) ∧
      (entry0645 i).charge = charge 43 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0647_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0645 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 44) (T 43 (203 + i.val + 1))
      (T 43 (203 + i.val)) (T 44 (203 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0645.entries OriginalRow227TriangleForward0645.checked
    ⟨i.val, by rw [size0645]; exact i.isLt⟩
  change (entry0645 i).check = true at h
  rcases fields0645 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0646 : OriginalRow227TriangleForward0646.entries.size = 32 := rfl

def entry0646 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0646.entries[i.val]'(by rw [size0646]; exact i.isLt)

theorem fields0646 (i : Fin 32) :
    (entry0646 i).IA = shift ∧ (entry0646 i).ID = S (235 + i.val + 1) ∧
      (entry0646 i).IC = S 44 ∧ (entry0646 i).Inext = T 43 (235 + i.val + 1) ∧
      (entry0646 i).Icur = T 43 (235 + i.val) ∧
      (entry0646 i).output = T 44 (235 + i.val) ∧
      (entry0646 i).charge = charge 43 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0648_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0646 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 44) (T 43 (235 + i.val + 1))
      (T 43 (235 + i.val)) (T 44 (235 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0646.entries OriginalRow227TriangleForward0646.checked
    ⟨i.val, by rw [size0646]; exact i.isLt⟩
  change (entry0646 i).check = true at h
  rcases fields0646 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0647 : OriginalRow227TriangleForward0647.entries.size = 32 := rfl

def entry0647 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0647.entries[i.val]'(by rw [size0647]; exact i.isLt)

theorem fields0647 (i : Fin 32) :
    (entry0647 i).IA = shift ∧ (entry0647 i).ID = S (267 + i.val + 1) ∧
      (entry0647 i).IC = S 44 ∧ (entry0647 i).Inext = T 43 (267 + i.val + 1) ∧
      (entry0647 i).Icur = T 43 (267 + i.val) ∧
      (entry0647 i).output = T 44 (267 + i.val) ∧
      (entry0647 i).charge = charge 43 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0649_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0647 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 44) (T 43 (267 + i.val + 1))
      (T 43 (267 + i.val)) (T 44 (267 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0647.entries OriginalRow227TriangleForward0647.checked
    ⟨i.val, by rw [size0647]; exact i.isLt⟩
  change (entry0647 i).check = true at h
  rcases fields0647 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0648 : OriginalRow227TriangleForward0648.entries.size = 32 := rfl

def entry0648 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0648.entries[i.val]'(by rw [size0648]; exact i.isLt)

theorem fields0648 (i : Fin 32) :
    (entry0648 i).IA = shift ∧ (entry0648 i).ID = S (299 + i.val + 1) ∧
      (entry0648 i).IC = S 44 ∧ (entry0648 i).Inext = T 43 (299 + i.val + 1) ∧
      (entry0648 i).Icur = T 43 (299 + i.val) ∧
      (entry0648 i).output = T 44 (299 + i.val) ∧
      (entry0648 i).charge = charge 43 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0650_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0648 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 44) (T 43 (299 + i.val + 1))
      (T 43 (299 + i.val)) (T 44 (299 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0648.entries OriginalRow227TriangleForward0648.checked
    ⟨i.val, by rw [size0648]; exact i.isLt⟩
  change (entry0648 i).check = true at h
  rcases fields0648 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0649 : OriginalRow227TriangleForward0649.entries.size = 32 := rfl

def entry0649 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0649.entries[i.val]'(by rw [size0649]; exact i.isLt)

theorem fields0649 (i : Fin 32) :
    (entry0649 i).IA = shift ∧ (entry0649 i).ID = S (331 + i.val + 1) ∧
      (entry0649 i).IC = S 44 ∧ (entry0649 i).Inext = T 43 (331 + i.val + 1) ∧
      (entry0649 i).Icur = T 43 (331 + i.val) ∧
      (entry0649 i).output = T 44 (331 + i.val) ∧
      (entry0649 i).charge = charge 43 (331 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0651_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0649 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (331 + i.val)) shift
      (S (331 + i.val + 1)) (S 44) (T 43 (331 + i.val + 1))
      (T 43 (331 + i.val)) (T 44 (331 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0649.entries OriginalRow227TriangleForward0649.checked
    ⟨i.val, by rw [size0649]; exact i.isLt⟩
  change (entry0649 i).check = true at h
  rcases fields0649 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0650 : OriginalRow227TriangleForward0650.entries.size = 32 := rfl

def entry0650 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0650.entries[i.val]'(by rw [size0650]; exact i.isLt)

theorem fields0650 (i : Fin 32) :
    (entry0650 i).IA = shift ∧ (entry0650 i).ID = S (363 + i.val + 1) ∧
      (entry0650 i).IC = S 44 ∧ (entry0650 i).Inext = T 43 (363 + i.val + 1) ∧
      (entry0650 i).Icur = T 43 (363 + i.val) ∧
      (entry0650 i).output = T 44 (363 + i.val) ∧
      (entry0650 i).charge = charge 43 (363 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0652_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0650 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (363 + i.val)) shift
      (S (363 + i.val + 1)) (S 44) (T 43 (363 + i.val + 1))
      (T 43 (363 + i.val)) (T 44 (363 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0650.entries OriginalRow227TriangleForward0650.checked
    ⟨i.val, by rw [size0650]; exact i.isLt⟩
  change (entry0650 i).check = true at h
  rcases fields0650 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0651 : OriginalRow227TriangleForward0651.entries.size = 32 := rfl

def entry0651 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0651.entries[i.val]'(by rw [size0651]; exact i.isLt)

theorem fields0651 (i : Fin 32) :
    (entry0651 i).IA = shift ∧ (entry0651 i).ID = S (395 + i.val + 1) ∧
      (entry0651 i).IC = S 44 ∧ (entry0651 i).Inext = T 43 (395 + i.val + 1) ∧
      (entry0651 i).Icur = T 43 (395 + i.val) ∧
      (entry0651 i).output = T 44 (395 + i.val) ∧
      (entry0651 i).charge = charge 43 (395 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0653_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0651 (i : Fin 32) :
    forwardStepOK (-768) (charge 43 (395 + i.val)) shift
      (S (395 + i.val + 1)) (S 44) (T 43 (395 + i.val + 1))
      (T 43 (395 + i.val)) (T 44 (395 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0651.entries OriginalRow227TriangleForward0651.checked
    ⟨i.val, by rw [size0651]; exact i.isLt⟩
  change (entry0651 i).check = true at h
  rcases fields0651 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0652 : OriginalRow227TriangleForward0652.entries.size = 31 := rfl

def entry0652 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0652.entries[i.val]'(by rw [size0652]; exact i.isLt)

theorem fields0652 (i : Fin 31) :
    (entry0652 i).IA = shift ∧ (entry0652 i).ID = S (427 + i.val + 1) ∧
      (entry0652 i).IC = S 44 ∧ (entry0652 i).Inext = T 43 (427 + i.val + 1) ∧
      (entry0652 i).Icur = T 43 (427 + i.val) ∧
      (entry0652 i).output = T 44 (427 + i.val) ∧
      (entry0652 i).charge = charge 43 (427 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root44).symm,
      (OriginalRow227TriangleBindingsRow043.block0655_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow043.block0654_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨30, by decide⟩).symm, rfl⟩

theorem step0652 (i : Fin 31) :
    forwardStepOK (-768) (charge 43 (427 + i.val)) shift
      (S (427 + i.val + 1)) (S 44) (T 43 (427 + i.val + 1))
      (T 43 (427 + i.val)) (T 44 (427 + i.val))
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0652.entries OriginalRow227TriangleForward0652.checked
    ⟨i.val, by rw [size0652]; exact i.isLt⟩
  change (entry0652 i).check = true at h
  rcases fields0652 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 43 ≤ d) (hhi : d < 458) :
    forwardStepOK (-768) (charge 43 d) shift (S (d + 1)) (S 44)
      (T 43 (d + 1)) (T 43 d) (T 44 d)
      (OriginalRow227Roots.root_pos 44 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 43 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h139 : d < 139
    ·
      by_cases h75 : d < 75
      ·
        have hi : d - 43 < 32 := by omega
        have heq : 43 + (d - 43) = d := by omega
        simpa only [heq] using step0640 ⟨d - 43, hi⟩
      ·
        by_cases h107 : d < 107
        ·
          have hi : d - 75 < 32 := by omega
          have heq : 75 + (d - 75) = d := by omega
          simpa only [heq] using step0641 ⟨d - 75, hi⟩
        ·
          have hi : d - 107 < 32 := by omega
          have heq : 107 + (d - 107) = d := by omega
          simpa only [heq] using step0642 ⟨d - 107, hi⟩
    ·
      by_cases h171 : d < 171
      ·
        have hi : d - 139 < 32 := by omega
        have heq : 139 + (d - 139) = d := by omega
        simpa only [heq] using step0643 ⟨d - 139, hi⟩
      ·
        by_cases h203 : d < 203
        ·
          have hi : d - 171 < 32 := by omega
          have heq : 171 + (d - 171) = d := by omega
          simpa only [heq] using step0644 ⟨d - 171, hi⟩
        ·
          have hi : d - 203 < 32 := by omega
          have heq : 203 + (d - 203) = d := by omega
          simpa only [heq] using step0645 ⟨d - 203, hi⟩
  ·
    by_cases h331 : d < 331
    ·
      by_cases h267 : d < 267
      ·
        have hi : d - 235 < 32 := by omega
        have heq : 235 + (d - 235) = d := by omega
        simpa only [heq] using step0646 ⟨d - 235, hi⟩
      ·
        by_cases h299 : d < 299
        ·
          have hi : d - 267 < 32 := by omega
          have heq : 267 + (d - 267) = d := by omega
          simpa only [heq] using step0647 ⟨d - 267, hi⟩
        ·
          have hi : d - 299 < 32 := by omega
          have heq : 299 + (d - 299) = d := by omega
          simpa only [heq] using step0648 ⟨d - 299, hi⟩
    ·
      by_cases h395 : d < 395
      ·
        by_cases h363 : d < 363
        ·
          have hi : d - 331 < 32 := by omega
          have heq : 331 + (d - 331) = d := by omega
          simpa only [heq] using step0649 ⟨d - 331, hi⟩
        ·
          have hi : d - 363 < 32 := by omega
          have heq : 363 + (d - 363) = d := by omega
          simpa only [heq] using step0650 ⟨d - 363, hi⟩
      ·
        by_cases h427 : d < 427
        ·
          have hi : d - 395 < 32 := by omega
          have heq : 395 + (d - 395) = d := by omega
          simpa only [heq] using step0651 ⟨d - 395, hi⟩
        ·
          have hi : d - 427 < 31 := by omega
          have heq : 427 + (d - 427) = d := by omega
          simpa only [heq] using step0652 ⟨d - 427, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0640,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0640,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0641,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0641,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0642,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0642,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0643,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0643,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0644,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0644,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0645,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0645,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0646,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0646,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0647,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0647,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0648,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0648,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0649,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0649,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0650,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0650,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0651,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0651,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.fields0652,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.step0652,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow044
