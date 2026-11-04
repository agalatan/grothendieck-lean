import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow036
import Grothe.UpperChaos.OriginalRow227TriangleForward0528
import Grothe.UpperChaos.OriginalRow227TriangleForward0529
import Grothe.UpperChaos.OriginalRow227TriangleForward0530
import Grothe.UpperChaos.OriginalRow227TriangleForward0531
import Grothe.UpperChaos.OriginalRow227TriangleForward0532
import Grothe.UpperChaos.OriginalRow227TriangleForward0533
import Grothe.UpperChaos.OriginalRow227TriangleForward0534
import Grothe.UpperChaos.OriginalRow227TriangleForward0535
import Grothe.UpperChaos.OriginalRow227TriangleForward0536
import Grothe.UpperChaos.OriginalRow227TriangleForward0537
import Grothe.UpperChaos.OriginalRow227TriangleForward0538
import Grothe.UpperChaos.OriginalRow227TriangleForward0539
import Grothe.UpperChaos.OriginalRow227TriangleForward0540
import Grothe.UpperChaos.OriginalRow227TriangleForward0541

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0528 : OriginalRow227TriangleForward0528.entries.size = 32 := rfl

def entry0528 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0528.entries[i.val]'(by rw [size0528]; exact i.isLt)

theorem fields0528 (i : Fin 32) :
    (entry0528 i).IA = shift ∧ (entry0528 i).ID = S (35 + i.val + 1) ∧
      (entry0528 i).IC = S 36 ∧ (entry0528 i).Inext = T 35 (35 + i.val + 1) ∧
      (entry0528 i).Icur = T 35 (35 + i.val) ∧
      (entry0528 i).output = T 36 (35 + i.val) ∧
      (entry0528 i).charge = charge 35 (35 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0544_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0528 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (35 + i.val)) shift
      (S (35 + i.val + 1)) (S 36) (T 35 (35 + i.val + 1))
      (T 35 (35 + i.val)) (T 36 (35 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0528.entries OriginalRow227TriangleForward0528.checked
    ⟨i.val, by rw [size0528]; exact i.isLt⟩
  change (entry0528 i).check = true at h
  rcases fields0528 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0529 : OriginalRow227TriangleForward0529.entries.size = 32 := rfl

def entry0529 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0529.entries[i.val]'(by rw [size0529]; exact i.isLt)

theorem fields0529 (i : Fin 32) :
    (entry0529 i).IA = shift ∧ (entry0529 i).ID = S (67 + i.val + 1) ∧
      (entry0529 i).IC = S 36 ∧ (entry0529 i).Inext = T 35 (67 + i.val + 1) ∧
      (entry0529 i).Icur = T 35 (67 + i.val) ∧
      (entry0529 i).output = T 36 (67 + i.val) ∧
      (entry0529 i).charge = charge 35 (67 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0545_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0529 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (67 + i.val)) shift
      (S (67 + i.val + 1)) (S 36) (T 35 (67 + i.val + 1))
      (T 35 (67 + i.val)) (T 36 (67 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0529.entries OriginalRow227TriangleForward0529.checked
    ⟨i.val, by rw [size0529]; exact i.isLt⟩
  change (entry0529 i).check = true at h
  rcases fields0529 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0530 : OriginalRow227TriangleForward0530.entries.size = 32 := rfl

def entry0530 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0530.entries[i.val]'(by rw [size0530]; exact i.isLt)

theorem fields0530 (i : Fin 32) :
    (entry0530 i).IA = shift ∧ (entry0530 i).ID = S (99 + i.val + 1) ∧
      (entry0530 i).IC = S 36 ∧ (entry0530 i).Inext = T 35 (99 + i.val + 1) ∧
      (entry0530 i).Icur = T 35 (99 + i.val) ∧
      (entry0530 i).output = T 36 (99 + i.val) ∧
      (entry0530 i).charge = charge 35 (99 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0546_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0530 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (99 + i.val)) shift
      (S (99 + i.val + 1)) (S 36) (T 35 (99 + i.val + 1))
      (T 35 (99 + i.val)) (T 36 (99 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0530.entries OriginalRow227TriangleForward0530.checked
    ⟨i.val, by rw [size0530]; exact i.isLt⟩
  change (entry0530 i).check = true at h
  rcases fields0530 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0531 : OriginalRow227TriangleForward0531.entries.size = 32 := rfl

def entry0531 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0531.entries[i.val]'(by rw [size0531]; exact i.isLt)

theorem fields0531 (i : Fin 32) :
    (entry0531 i).IA = shift ∧ (entry0531 i).ID = S (131 + i.val + 1) ∧
      (entry0531 i).IC = S 36 ∧ (entry0531 i).Inext = T 35 (131 + i.val + 1) ∧
      (entry0531 i).Icur = T 35 (131 + i.val) ∧
      (entry0531 i).output = T 36 (131 + i.val) ∧
      (entry0531 i).charge = charge 35 (131 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0547_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0531 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (131 + i.val)) shift
      (S (131 + i.val + 1)) (S 36) (T 35 (131 + i.val + 1))
      (T 35 (131 + i.val)) (T 36 (131 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0531.entries OriginalRow227TriangleForward0531.checked
    ⟨i.val, by rw [size0531]; exact i.isLt⟩
  change (entry0531 i).check = true at h
  rcases fields0531 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0532 : OriginalRow227TriangleForward0532.entries.size = 32 := rfl

def entry0532 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0532.entries[i.val]'(by rw [size0532]; exact i.isLt)

theorem fields0532 (i : Fin 32) :
    (entry0532 i).IA = shift ∧ (entry0532 i).ID = S (163 + i.val + 1) ∧
      (entry0532 i).IC = S 36 ∧ (entry0532 i).Inext = T 35 (163 + i.val + 1) ∧
      (entry0532 i).Icur = T 35 (163 + i.val) ∧
      (entry0532 i).output = T 36 (163 + i.val) ∧
      (entry0532 i).charge = charge 35 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0548_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0532 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 36) (T 35 (163 + i.val + 1))
      (T 35 (163 + i.val)) (T 36 (163 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0532.entries OriginalRow227TriangleForward0532.checked
    ⟨i.val, by rw [size0532]; exact i.isLt⟩
  change (entry0532 i).check = true at h
  rcases fields0532 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0533 : OriginalRow227TriangleForward0533.entries.size = 32 := rfl

def entry0533 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0533.entries[i.val]'(by rw [size0533]; exact i.isLt)

theorem fields0533 (i : Fin 32) :
    (entry0533 i).IA = shift ∧ (entry0533 i).ID = S (195 + i.val + 1) ∧
      (entry0533 i).IC = S 36 ∧ (entry0533 i).Inext = T 35 (195 + i.val + 1) ∧
      (entry0533 i).Icur = T 35 (195 + i.val) ∧
      (entry0533 i).output = T 36 (195 + i.val) ∧
      (entry0533 i).charge = charge 35 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0549_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0533 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 36) (T 35 (195 + i.val + 1))
      (T 35 (195 + i.val)) (T 36 (195 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0533.entries OriginalRow227TriangleForward0533.checked
    ⟨i.val, by rw [size0533]; exact i.isLt⟩
  change (entry0533 i).check = true at h
  rcases fields0533 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0534 : OriginalRow227TriangleForward0534.entries.size = 32 := rfl

def entry0534 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0534.entries[i.val]'(by rw [size0534]; exact i.isLt)

theorem fields0534 (i : Fin 32) :
    (entry0534 i).IA = shift ∧ (entry0534 i).ID = S (227 + i.val + 1) ∧
      (entry0534 i).IC = S 36 ∧ (entry0534 i).Inext = T 35 (227 + i.val + 1) ∧
      (entry0534 i).Icur = T 35 (227 + i.val) ∧
      (entry0534 i).output = T 36 (227 + i.val) ∧
      (entry0534 i).charge = charge 35 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0550_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0534 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 36) (T 35 (227 + i.val + 1))
      (T 35 (227 + i.val)) (T 36 (227 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0534.entries OriginalRow227TriangleForward0534.checked
    ⟨i.val, by rw [size0534]; exact i.isLt⟩
  change (entry0534 i).check = true at h
  rcases fields0534 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0535 : OriginalRow227TriangleForward0535.entries.size = 32 := rfl

def entry0535 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0535.entries[i.val]'(by rw [size0535]; exact i.isLt)

theorem fields0535 (i : Fin 32) :
    (entry0535 i).IA = shift ∧ (entry0535 i).ID = S (259 + i.val + 1) ∧
      (entry0535 i).IC = S 36 ∧ (entry0535 i).Inext = T 35 (259 + i.val + 1) ∧
      (entry0535 i).Icur = T 35 (259 + i.val) ∧
      (entry0535 i).output = T 36 (259 + i.val) ∧
      (entry0535 i).charge = charge 35 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0551_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0535 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 36) (T 35 (259 + i.val + 1))
      (T 35 (259 + i.val)) (T 36 (259 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0535.entries OriginalRow227TriangleForward0535.checked
    ⟨i.val, by rw [size0535]; exact i.isLt⟩
  change (entry0535 i).check = true at h
  rcases fields0535 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0536 : OriginalRow227TriangleForward0536.entries.size = 32 := rfl

def entry0536 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0536.entries[i.val]'(by rw [size0536]; exact i.isLt)

theorem fields0536 (i : Fin 32) :
    (entry0536 i).IA = shift ∧ (entry0536 i).ID = S (291 + i.val + 1) ∧
      (entry0536 i).IC = S 36 ∧ (entry0536 i).Inext = T 35 (291 + i.val + 1) ∧
      (entry0536 i).Icur = T 35 (291 + i.val) ∧
      (entry0536 i).output = T 36 (291 + i.val) ∧
      (entry0536 i).charge = charge 35 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0552_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0536 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 36) (T 35 (291 + i.val + 1))
      (T 35 (291 + i.val)) (T 36 (291 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0536.entries OriginalRow227TriangleForward0536.checked
    ⟨i.val, by rw [size0536]; exact i.isLt⟩
  change (entry0536 i).check = true at h
  rcases fields0536 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0537 : OriginalRow227TriangleForward0537.entries.size = 32 := rfl

def entry0537 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0537.entries[i.val]'(by rw [size0537]; exact i.isLt)

theorem fields0537 (i : Fin 32) :
    (entry0537 i).IA = shift ∧ (entry0537 i).ID = S (323 + i.val + 1) ∧
      (entry0537 i).IC = S 36 ∧ (entry0537 i).Inext = T 35 (323 + i.val + 1) ∧
      (entry0537 i).Icur = T 35 (323 + i.val) ∧
      (entry0537 i).output = T 36 (323 + i.val) ∧
      (entry0537 i).charge = charge 35 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0553_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0537 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 36) (T 35 (323 + i.val + 1))
      (T 35 (323 + i.val)) (T 36 (323 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0537.entries OriginalRow227TriangleForward0537.checked
    ⟨i.val, by rw [size0537]; exact i.isLt⟩
  change (entry0537 i).check = true at h
  rcases fields0537 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0538 : OriginalRow227TriangleForward0538.entries.size = 32 := rfl

def entry0538 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0538.entries[i.val]'(by rw [size0538]; exact i.isLt)

theorem fields0538 (i : Fin 32) :
    (entry0538 i).IA = shift ∧ (entry0538 i).ID = S (355 + i.val + 1) ∧
      (entry0538 i).IC = S 36 ∧ (entry0538 i).Inext = T 35 (355 + i.val + 1) ∧
      (entry0538 i).Icur = T 35 (355 + i.val) ∧
      (entry0538 i).output = T 36 (355 + i.val) ∧
      (entry0538 i).charge = charge 35 (355 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0554_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0538 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (355 + i.val)) shift
      (S (355 + i.val + 1)) (S 36) (T 35 (355 + i.val + 1))
      (T 35 (355 + i.val)) (T 36 (355 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0538.entries OriginalRow227TriangleForward0538.checked
    ⟨i.val, by rw [size0538]; exact i.isLt⟩
  change (entry0538 i).check = true at h
  rcases fields0538 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0539 : OriginalRow227TriangleForward0539.entries.size = 32 := rfl

def entry0539 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0539.entries[i.val]'(by rw [size0539]; exact i.isLt)

theorem fields0539 (i : Fin 32) :
    (entry0539 i).IA = shift ∧ (entry0539 i).ID = S (387 + i.val + 1) ∧
      (entry0539 i).IC = S 36 ∧ (entry0539 i).Inext = T 35 (387 + i.val + 1) ∧
      (entry0539 i).Icur = T 35 (387 + i.val) ∧
      (entry0539 i).output = T 36 (387 + i.val) ∧
      (entry0539 i).charge = charge 35 (387 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0555_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0539 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (387 + i.val)) shift
      (S (387 + i.val + 1)) (S 36) (T 35 (387 + i.val + 1))
      (T 35 (387 + i.val)) (T 36 (387 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0539.entries OriginalRow227TriangleForward0539.checked
    ⟨i.val, by rw [size0539]; exact i.isLt⟩
  change (entry0539 i).check = true at h
  rcases fields0539 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0540 : OriginalRow227TriangleForward0540.entries.size = 32 := rfl

def entry0540 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0540.entries[i.val]'(by rw [size0540]; exact i.isLt)

theorem fields0540 (i : Fin 32) :
    (entry0540 i).IA = shift ∧ (entry0540 i).ID = S (419 + i.val + 1) ∧
      (entry0540 i).IC = S 36 ∧ (entry0540 i).Inext = T 35 (419 + i.val + 1) ∧
      (entry0540 i).Icur = T 35 (419 + i.val) ∧
      (entry0540 i).output = T 36 (419 + i.val) ∧
      (entry0540 i).charge = charge 35 (419 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0556_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0540 (i : Fin 32) :
    forwardStepOK (-768) (charge 35 (419 + i.val)) shift
      (S (419 + i.val + 1)) (S 36) (T 35 (419 + i.val + 1))
      (T 35 (419 + i.val)) (T 36 (419 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0540.entries OriginalRow227TriangleForward0540.checked
    ⟨i.val, by rw [size0540]; exact i.isLt⟩
  change (entry0540 i).check = true at h
  rcases fields0540 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0541 : OriginalRow227TriangleForward0541.entries.size = 15 := rfl

def entry0541 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0541.entries[i.val]'(by rw [size0541]; exact i.isLt)

theorem fields0541 (i : Fin 15) :
    (entry0541 i).IA = shift ∧ (entry0541 i).ID = S (451 + i.val + 1) ∧
      (entry0541 i).IC = S 36 ∧ (entry0541 i).Inext = T 35 (451 + i.val + 1) ∧
      (entry0541 i).Icur = T 35 (451 + i.val) ∧
      (entry0541 i).output = T 36 (451 + i.val) ∧
      (entry0541 i).charge = charge 35 (451 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings01.S_eq_root36).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow036.block0557_value ⟨14, by decide⟩).symm, rfl⟩

theorem step0541 (i : Fin 15) :
    forwardStepOK (-768) (charge 35 (451 + i.val)) shift
      (S (451 + i.val + 1)) (S 36) (T 35 (451 + i.val + 1))
      (T 35 (451 + i.val)) (T 36 (451 + i.val))
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0541.entries OriginalRow227TriangleForward0541.checked
    ⟨i.val, by rw [size0541]; exact i.isLt⟩
  change (entry0541 i).check = true at h
  rcases fields0541 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 35 ≤ d) (hhi : d < 466) :
    forwardStepOK (-768) (charge 35 d) shift (S (d + 1)) (S 36)
      (T 35 (d + 1)) (T 35 d) (T 36 d)
      (OriginalRow227Roots.root_pos 36 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 35 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h131 : d < 131
    ·
      by_cases h67 : d < 67
      ·
        have hi : d - 35 < 32 := by omega
        have heq : 35 + (d - 35) = d := by omega
        simpa only [heq] using step0528 ⟨d - 35, hi⟩
      ·
        by_cases h99 : d < 99
        ·
          have hi : d - 67 < 32 := by omega
          have heq : 67 + (d - 67) = d := by omega
          simpa only [heq] using step0529 ⟨d - 67, hi⟩
        ·
          have hi : d - 99 < 32 := by omega
          have heq : 99 + (d - 99) = d := by omega
          simpa only [heq] using step0530 ⟨d - 99, hi⟩
    ·
      by_cases h195 : d < 195
      ·
        by_cases h163 : d < 163
        ·
          have hi : d - 131 < 32 := by omega
          have heq : 131 + (d - 131) = d := by omega
          simpa only [heq] using step0531 ⟨d - 131, hi⟩
        ·
          have hi : d - 163 < 32 := by omega
          have heq : 163 + (d - 163) = d := by omega
          simpa only [heq] using step0532 ⟨d - 163, hi⟩
      ·
        by_cases h227 : d < 227
        ·
          have hi : d - 195 < 32 := by omega
          have heq : 195 + (d - 195) = d := by omega
          simpa only [heq] using step0533 ⟨d - 195, hi⟩
        ·
          have hi : d - 227 < 32 := by omega
          have heq : 227 + (d - 227) = d := by omega
          simpa only [heq] using step0534 ⟨d - 227, hi⟩
  ·
    by_cases h355 : d < 355
    ·
      by_cases h291 : d < 291
      ·
        have hi : d - 259 < 32 := by omega
        have heq : 259 + (d - 259) = d := by omega
        simpa only [heq] using step0535 ⟨d - 259, hi⟩
      ·
        by_cases h323 : d < 323
        ·
          have hi : d - 291 < 32 := by omega
          have heq : 291 + (d - 291) = d := by omega
          simpa only [heq] using step0536 ⟨d - 291, hi⟩
        ·
          have hi : d - 323 < 32 := by omega
          have heq : 323 + (d - 323) = d := by omega
          simpa only [heq] using step0537 ⟨d - 323, hi⟩
    ·
      by_cases h419 : d < 419
      ·
        by_cases h387 : d < 387
        ·
          have hi : d - 355 < 32 := by omega
          have heq : 355 + (d - 355) = d := by omega
          simpa only [heq] using step0538 ⟨d - 355, hi⟩
        ·
          have hi : d - 387 < 32 := by omega
          have heq : 387 + (d - 387) = d := by omega
          simpa only [heq] using step0539 ⟨d - 387, hi⟩
      ·
        by_cases h451 : d < 451
        ·
          have hi : d - 419 < 32 := by omega
          have heq : 419 + (d - 419) = d := by omega
          simpa only [heq] using step0540 ⟨d - 419, hi⟩
        ·
          have hi : d - 451 < 15 := by omega
          have heq : 451 + (d - 451) = d := by omega
          simpa only [heq] using step0541 ⟨d - 451, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0528,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0528,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0529,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0529,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0530,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0530,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0531,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0531,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0532,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0532,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0533,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0533,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0534,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0534,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0535,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0535,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0536,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0536,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0537,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0537,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0538,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0538,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0539,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0539,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0540,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0540,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.fields0541,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.step0541,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow036
