import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow044
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045
import Grothe.UpperChaos.OriginalRow227TriangleForward0653
import Grothe.UpperChaos.OriginalRow227TriangleForward0654
import Grothe.UpperChaos.OriginalRow227TriangleForward0655
import Grothe.UpperChaos.OriginalRow227TriangleForward0656
import Grothe.UpperChaos.OriginalRow227TriangleForward0657
import Grothe.UpperChaos.OriginalRow227TriangleForward0658
import Grothe.UpperChaos.OriginalRow227TriangleForward0659
import Grothe.UpperChaos.OriginalRow227TriangleForward0660
import Grothe.UpperChaos.OriginalRow227TriangleForward0661
import Grothe.UpperChaos.OriginalRow227TriangleForward0662
import Grothe.UpperChaos.OriginalRow227TriangleForward0663
import Grothe.UpperChaos.OriginalRow227TriangleForward0664
import Grothe.UpperChaos.OriginalRow227TriangleForward0665

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0653 : OriginalRow227TriangleForward0653.entries.size = 32 := rfl

def entry0653 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0653.entries[i.val]'(by rw [size0653]; exact i.isLt)

theorem fields0653 (i : Fin 32) :
    (entry0653 i).IA = shift ∧ (entry0653 i).ID = S (44 + i.val + 1) ∧
      (entry0653 i).IC = S 45 ∧ (entry0653 i).Inext = T 44 (44 + i.val + 1) ∧
      (entry0653 i).Icur = T 44 (44 + i.val) ∧
      (entry0653 i).output = T 45 (44 + i.val) ∧
      (entry0653 i).charge = charge 44 (44 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0656_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0653 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (44 + i.val)) shift
      (S (44 + i.val + 1)) (S 45) (T 44 (44 + i.val + 1))
      (T 44 (44 + i.val)) (T 45 (44 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0653.entries OriginalRow227TriangleForward0653.checked
    ⟨i.val, by rw [size0653]; exact i.isLt⟩
  change (entry0653 i).check = true at h
  rcases fields0653 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0654 : OriginalRow227TriangleForward0654.entries.size = 32 := rfl

def entry0654 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0654.entries[i.val]'(by rw [size0654]; exact i.isLt)

theorem fields0654 (i : Fin 32) :
    (entry0654 i).IA = shift ∧ (entry0654 i).ID = S (76 + i.val + 1) ∧
      (entry0654 i).IC = S 45 ∧ (entry0654 i).Inext = T 44 (76 + i.val + 1) ∧
      (entry0654 i).Icur = T 44 (76 + i.val) ∧
      (entry0654 i).output = T 45 (76 + i.val) ∧
      (entry0654 i).charge = charge 44 (76 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0657_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0654 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (76 + i.val)) shift
      (S (76 + i.val + 1)) (S 45) (T 44 (76 + i.val + 1))
      (T 44 (76 + i.val)) (T 45 (76 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0654.entries OriginalRow227TriangleForward0654.checked
    ⟨i.val, by rw [size0654]; exact i.isLt⟩
  change (entry0654 i).check = true at h
  rcases fields0654 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0655 : OriginalRow227TriangleForward0655.entries.size = 32 := rfl

def entry0655 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0655.entries[i.val]'(by rw [size0655]; exact i.isLt)

theorem fields0655 (i : Fin 32) :
    (entry0655 i).IA = shift ∧ (entry0655 i).ID = S (108 + i.val + 1) ∧
      (entry0655 i).IC = S 45 ∧ (entry0655 i).Inext = T 44 (108 + i.val + 1) ∧
      (entry0655 i).Icur = T 44 (108 + i.val) ∧
      (entry0655 i).output = T 45 (108 + i.val) ∧
      (entry0655 i).charge = charge 44 (108 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0658_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0655 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (108 + i.val)) shift
      (S (108 + i.val + 1)) (S 45) (T 44 (108 + i.val + 1))
      (T 44 (108 + i.val)) (T 45 (108 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0655.entries OriginalRow227TriangleForward0655.checked
    ⟨i.val, by rw [size0655]; exact i.isLt⟩
  change (entry0655 i).check = true at h
  rcases fields0655 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0656 : OriginalRow227TriangleForward0656.entries.size = 32 := rfl

def entry0656 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0656.entries[i.val]'(by rw [size0656]; exact i.isLt)

theorem fields0656 (i : Fin 32) :
    (entry0656 i).IA = shift ∧ (entry0656 i).ID = S (140 + i.val + 1) ∧
      (entry0656 i).IC = S 45 ∧ (entry0656 i).Inext = T 44 (140 + i.val + 1) ∧
      (entry0656 i).Icur = T 44 (140 + i.val) ∧
      (entry0656 i).output = T 45 (140 + i.val) ∧
      (entry0656 i).charge = charge 44 (140 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0659_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0656 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (140 + i.val)) shift
      (S (140 + i.val + 1)) (S 45) (T 44 (140 + i.val + 1))
      (T 44 (140 + i.val)) (T 45 (140 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0656.entries OriginalRow227TriangleForward0656.checked
    ⟨i.val, by rw [size0656]; exact i.isLt⟩
  change (entry0656 i).check = true at h
  rcases fields0656 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0657 : OriginalRow227TriangleForward0657.entries.size = 32 := rfl

def entry0657 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0657.entries[i.val]'(by rw [size0657]; exact i.isLt)

theorem fields0657 (i : Fin 32) :
    (entry0657 i).IA = shift ∧ (entry0657 i).ID = S (172 + i.val + 1) ∧
      (entry0657 i).IC = S 45 ∧ (entry0657 i).Inext = T 44 (172 + i.val + 1) ∧
      (entry0657 i).Icur = T 44 (172 + i.val) ∧
      (entry0657 i).output = T 45 (172 + i.val) ∧
      (entry0657 i).charge = charge 44 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0660_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0657 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 45) (T 44 (172 + i.val + 1))
      (T 44 (172 + i.val)) (T 45 (172 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0657.entries OriginalRow227TriangleForward0657.checked
    ⟨i.val, by rw [size0657]; exact i.isLt⟩
  change (entry0657 i).check = true at h
  rcases fields0657 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0658 : OriginalRow227TriangleForward0658.entries.size = 32 := rfl

def entry0658 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0658.entries[i.val]'(by rw [size0658]; exact i.isLt)

theorem fields0658 (i : Fin 32) :
    (entry0658 i).IA = shift ∧ (entry0658 i).ID = S (204 + i.val + 1) ∧
      (entry0658 i).IC = S 45 ∧ (entry0658 i).Inext = T 44 (204 + i.val + 1) ∧
      (entry0658 i).Icur = T 44 (204 + i.val) ∧
      (entry0658 i).output = T 45 (204 + i.val) ∧
      (entry0658 i).charge = charge 44 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0661_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0658 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 45) (T 44 (204 + i.val + 1))
      (T 44 (204 + i.val)) (T 45 (204 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0658.entries OriginalRow227TriangleForward0658.checked
    ⟨i.val, by rw [size0658]; exact i.isLt⟩
  change (entry0658 i).check = true at h
  rcases fields0658 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0659 : OriginalRow227TriangleForward0659.entries.size = 32 := rfl

def entry0659 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0659.entries[i.val]'(by rw [size0659]; exact i.isLt)

theorem fields0659 (i : Fin 32) :
    (entry0659 i).IA = shift ∧ (entry0659 i).ID = S (236 + i.val + 1) ∧
      (entry0659 i).IC = S 45 ∧ (entry0659 i).Inext = T 44 (236 + i.val + 1) ∧
      (entry0659 i).Icur = T 44 (236 + i.val) ∧
      (entry0659 i).output = T 45 (236 + i.val) ∧
      (entry0659 i).charge = charge 44 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0662_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0659 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 45) (T 44 (236 + i.val + 1))
      (T 44 (236 + i.val)) (T 45 (236 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0659.entries OriginalRow227TriangleForward0659.checked
    ⟨i.val, by rw [size0659]; exact i.isLt⟩
  change (entry0659 i).check = true at h
  rcases fields0659 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0660 : OriginalRow227TriangleForward0660.entries.size = 32 := rfl

def entry0660 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0660.entries[i.val]'(by rw [size0660]; exact i.isLt)

theorem fields0660 (i : Fin 32) :
    (entry0660 i).IA = shift ∧ (entry0660 i).ID = S (268 + i.val + 1) ∧
      (entry0660 i).IC = S 45 ∧ (entry0660 i).Inext = T 44 (268 + i.val + 1) ∧
      (entry0660 i).Icur = T 44 (268 + i.val) ∧
      (entry0660 i).output = T 45 (268 + i.val) ∧
      (entry0660 i).charge = charge 44 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0663_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0660 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 45) (T 44 (268 + i.val + 1))
      (T 44 (268 + i.val)) (T 45 (268 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0660.entries OriginalRow227TriangleForward0660.checked
    ⟨i.val, by rw [size0660]; exact i.isLt⟩
  change (entry0660 i).check = true at h
  rcases fields0660 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0661 : OriginalRow227TriangleForward0661.entries.size = 32 := rfl

def entry0661 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0661.entries[i.val]'(by rw [size0661]; exact i.isLt)

theorem fields0661 (i : Fin 32) :
    (entry0661 i).IA = shift ∧ (entry0661 i).ID = S (300 + i.val + 1) ∧
      (entry0661 i).IC = S 45 ∧ (entry0661 i).Inext = T 44 (300 + i.val + 1) ∧
      (entry0661 i).Icur = T 44 (300 + i.val) ∧
      (entry0661 i).output = T 45 (300 + i.val) ∧
      (entry0661 i).charge = charge 44 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0664_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0661 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 45) (T 44 (300 + i.val + 1))
      (T 44 (300 + i.val)) (T 45 (300 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0661.entries OriginalRow227TriangleForward0661.checked
    ⟨i.val, by rw [size0661]; exact i.isLt⟩
  change (entry0661 i).check = true at h
  rcases fields0661 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0662 : OriginalRow227TriangleForward0662.entries.size = 32 := rfl

def entry0662 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0662.entries[i.val]'(by rw [size0662]; exact i.isLt)

theorem fields0662 (i : Fin 32) :
    (entry0662 i).IA = shift ∧ (entry0662 i).ID = S (332 + i.val + 1) ∧
      (entry0662 i).IC = S 45 ∧ (entry0662 i).Inext = T 44 (332 + i.val + 1) ∧
      (entry0662 i).Icur = T 44 (332 + i.val) ∧
      (entry0662 i).output = T 45 (332 + i.val) ∧
      (entry0662 i).charge = charge 44 (332 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0665_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0662 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (332 + i.val)) shift
      (S (332 + i.val + 1)) (S 45) (T 44 (332 + i.val + 1))
      (T 44 (332 + i.val)) (T 45 (332 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0662.entries OriginalRow227TriangleForward0662.checked
    ⟨i.val, by rw [size0662]; exact i.isLt⟩
  change (entry0662 i).check = true at h
  rcases fields0662 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0663 : OriginalRow227TriangleForward0663.entries.size = 32 := rfl

def entry0663 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0663.entries[i.val]'(by rw [size0663]; exact i.isLt)

theorem fields0663 (i : Fin 32) :
    (entry0663 i).IA = shift ∧ (entry0663 i).ID = S (364 + i.val + 1) ∧
      (entry0663 i).IC = S 45 ∧ (entry0663 i).Inext = T 44 (364 + i.val + 1) ∧
      (entry0663 i).Icur = T 44 (364 + i.val) ∧
      (entry0663 i).output = T 45 (364 + i.val) ∧
      (entry0663 i).charge = charge 44 (364 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0666_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0663 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (364 + i.val)) shift
      (S (364 + i.val + 1)) (S 45) (T 44 (364 + i.val + 1))
      (T 44 (364 + i.val)) (T 45 (364 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0663.entries OriginalRow227TriangleForward0663.checked
    ⟨i.val, by rw [size0663]; exact i.isLt⟩
  change (entry0663 i).check = true at h
  rcases fields0663 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0664 : OriginalRow227TriangleForward0664.entries.size = 32 := rfl

def entry0664 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0664.entries[i.val]'(by rw [size0664]; exact i.isLt)

theorem fields0664 (i : Fin 32) :
    (entry0664 i).IA = shift ∧ (entry0664 i).ID = S (396 + i.val + 1) ∧
      (entry0664 i).IC = S 45 ∧ (entry0664 i).Inext = T 44 (396 + i.val + 1) ∧
      (entry0664 i).Icur = T 44 (396 + i.val) ∧
      (entry0664 i).output = T 45 (396 + i.val) ∧
      (entry0664 i).charge = charge 44 (396 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0667_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0664 (i : Fin 32) :
    forwardStepOK (-768) (charge 44 (396 + i.val)) shift
      (S (396 + i.val + 1)) (S 45) (T 44 (396 + i.val + 1))
      (T 44 (396 + i.val)) (T 45 (396 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0664.entries OriginalRow227TriangleForward0664.checked
    ⟨i.val, by rw [size0664]; exact i.isLt⟩
  change (entry0664 i).check = true at h
  rcases fields0664 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0665 : OriginalRow227TriangleForward0665.entries.size = 29 := rfl

def entry0665 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0665.entries[i.val]'(by rw [size0665]; exact i.isLt)

theorem fields0665 (i : Fin 29) :
    (entry0665 i).IA = shift ∧ (entry0665 i).ID = S (428 + i.val + 1) ∧
      (entry0665 i).IC = S 45 ∧ (entry0665 i).Inext = T 44 (428 + i.val + 1) ∧
      (entry0665 i).Icur = T 44 (428 + i.val) ∧
      (entry0665 i).output = T 45 (428 + i.val) ∧
      (entry0665 i).charge = charge 44 (428 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root45).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow044.block0668_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨28, by decide⟩).symm, rfl⟩

theorem step0665 (i : Fin 29) :
    forwardStepOK (-768) (charge 44 (428 + i.val)) shift
      (S (428 + i.val + 1)) (S 45) (T 44 (428 + i.val + 1))
      (T 44 (428 + i.val)) (T 45 (428 + i.val))
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0665.entries OriginalRow227TriangleForward0665.checked
    ⟨i.val, by rw [size0665]; exact i.isLt⟩
  change (entry0665 i).check = true at h
  rcases fields0665 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 44 ≤ d) (hhi : d < 457) :
    forwardStepOK (-768) (charge 44 d) shift (S (d + 1)) (S 45)
      (T 44 (d + 1)) (T 44 d) (T 45 d)
      (OriginalRow227Roots.root_pos 45 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 44 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h140 : d < 140
    ·
      by_cases h76 : d < 76
      ·
        have hi : d - 44 < 32 := by omega
        have heq : 44 + (d - 44) = d := by omega
        simpa only [heq] using step0653 ⟨d - 44, hi⟩
      ·
        by_cases h108 : d < 108
        ·
          have hi : d - 76 < 32 := by omega
          have heq : 76 + (d - 76) = d := by omega
          simpa only [heq] using step0654 ⟨d - 76, hi⟩
        ·
          have hi : d - 108 < 32 := by omega
          have heq : 108 + (d - 108) = d := by omega
          simpa only [heq] using step0655 ⟨d - 108, hi⟩
    ·
      by_cases h172 : d < 172
      ·
        have hi : d - 140 < 32 := by omega
        have heq : 140 + (d - 140) = d := by omega
        simpa only [heq] using step0656 ⟨d - 140, hi⟩
      ·
        by_cases h204 : d < 204
        ·
          have hi : d - 172 < 32 := by omega
          have heq : 172 + (d - 172) = d := by omega
          simpa only [heq] using step0657 ⟨d - 172, hi⟩
        ·
          have hi : d - 204 < 32 := by omega
          have heq : 204 + (d - 204) = d := by omega
          simpa only [heq] using step0658 ⟨d - 204, hi⟩
  ·
    by_cases h332 : d < 332
    ·
      by_cases h268 : d < 268
      ·
        have hi : d - 236 < 32 := by omega
        have heq : 236 + (d - 236) = d := by omega
        simpa only [heq] using step0659 ⟨d - 236, hi⟩
      ·
        by_cases h300 : d < 300
        ·
          have hi : d - 268 < 32 := by omega
          have heq : 268 + (d - 268) = d := by omega
          simpa only [heq] using step0660 ⟨d - 268, hi⟩
        ·
          have hi : d - 300 < 32 := by omega
          have heq : 300 + (d - 300) = d := by omega
          simpa only [heq] using step0661 ⟨d - 300, hi⟩
    ·
      by_cases h396 : d < 396
      ·
        by_cases h364 : d < 364
        ·
          have hi : d - 332 < 32 := by omega
          have heq : 332 + (d - 332) = d := by omega
          simpa only [heq] using step0662 ⟨d - 332, hi⟩
        ·
          have hi : d - 364 < 32 := by omega
          have heq : 364 + (d - 364) = d := by omega
          simpa only [heq] using step0663 ⟨d - 364, hi⟩
      ·
        by_cases h428 : d < 428
        ·
          have hi : d - 396 < 32 := by omega
          have heq : 396 + (d - 396) = d := by omega
          simpa only [heq] using step0664 ⟨d - 396, hi⟩
        ·
          have hi : d - 428 < 29 := by omega
          have heq : 428 + (d - 428) = d := by omega
          simpa only [heq] using step0665 ⟨d - 428, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0653,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0653,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0654,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0654,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0655,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0655,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0656,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0656,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0657,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0657,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0658,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0658,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0659,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0659,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0660,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0660,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0661,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0661,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0662,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0662,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0663,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0663,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0664,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0664,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.fields0665,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.step0665,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow045
