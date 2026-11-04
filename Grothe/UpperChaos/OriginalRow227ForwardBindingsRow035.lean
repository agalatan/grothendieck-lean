import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow034
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow035
import Grothe.UpperChaos.OriginalRow227TriangleForward0514
import Grothe.UpperChaos.OriginalRow227TriangleForward0515
import Grothe.UpperChaos.OriginalRow227TriangleForward0516
import Grothe.UpperChaos.OriginalRow227TriangleForward0517
import Grothe.UpperChaos.OriginalRow227TriangleForward0518
import Grothe.UpperChaos.OriginalRow227TriangleForward0519
import Grothe.UpperChaos.OriginalRow227TriangleForward0520
import Grothe.UpperChaos.OriginalRow227TriangleForward0521
import Grothe.UpperChaos.OriginalRow227TriangleForward0522
import Grothe.UpperChaos.OriginalRow227TriangleForward0523
import Grothe.UpperChaos.OriginalRow227TriangleForward0524
import Grothe.UpperChaos.OriginalRow227TriangleForward0525
import Grothe.UpperChaos.OriginalRow227TriangleForward0526
import Grothe.UpperChaos.OriginalRow227TriangleForward0527

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0514 : OriginalRow227TriangleForward0514.entries.size = 32 := rfl

def entry0514 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0514.entries[i.val]'(by rw [size0514]; exact i.isLt)

theorem fields0514 (i : Fin 32) :
    (entry0514 i).IA = shift ∧ (entry0514 i).ID = S (34 + i.val + 1) ∧
      (entry0514 i).IC = S 35 ∧ (entry0514 i).Inext = T 34 (34 + i.val + 1) ∧
      (entry0514 i).Icur = T 34 (34 + i.val) ∧
      (entry0514 i).output = T 35 (34 + i.val) ∧
      (entry0514 i).charge = charge 34 (34 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0516_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0530_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0514 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (34 + i.val)) shift
      (S (34 + i.val + 1)) (S 35) (T 34 (34 + i.val + 1))
      (T 34 (34 + i.val)) (T 35 (34 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0514.entries OriginalRow227TriangleForward0514.checked
    ⟨i.val, by rw [size0514]; exact i.isLt⟩
  change (entry0514 i).check = true at h
  rcases fields0514 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0515 : OriginalRow227TriangleForward0515.entries.size = 32 := rfl

def entry0515 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0515.entries[i.val]'(by rw [size0515]; exact i.isLt)

theorem fields0515 (i : Fin 32) :
    (entry0515 i).IA = shift ∧ (entry0515 i).ID = S (66 + i.val + 1) ∧
      (entry0515 i).IC = S 35 ∧ (entry0515 i).Inext = T 34 (66 + i.val + 1) ∧
      (entry0515 i).Icur = T 34 (66 + i.val) ∧
      (entry0515 i).output = T 35 (66 + i.val) ∧
      (entry0515 i).charge = charge 34 (66 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0517_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0531_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0515 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (66 + i.val)) shift
      (S (66 + i.val + 1)) (S 35) (T 34 (66 + i.val + 1))
      (T 34 (66 + i.val)) (T 35 (66 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0515.entries OriginalRow227TriangleForward0515.checked
    ⟨i.val, by rw [size0515]; exact i.isLt⟩
  change (entry0515 i).check = true at h
  rcases fields0515 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0516 : OriginalRow227TriangleForward0516.entries.size = 32 := rfl

def entry0516 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0516.entries[i.val]'(by rw [size0516]; exact i.isLt)

theorem fields0516 (i : Fin 32) :
    (entry0516 i).IA = shift ∧ (entry0516 i).ID = S (98 + i.val + 1) ∧
      (entry0516 i).IC = S 35 ∧ (entry0516 i).Inext = T 34 (98 + i.val + 1) ∧
      (entry0516 i).Icur = T 34 (98 + i.val) ∧
      (entry0516 i).output = T 35 (98 + i.val) ∧
      (entry0516 i).charge = charge 34 (98 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0518_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0532_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0516 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (98 + i.val)) shift
      (S (98 + i.val + 1)) (S 35) (T 34 (98 + i.val + 1))
      (T 34 (98 + i.val)) (T 35 (98 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0516.entries OriginalRow227TriangleForward0516.checked
    ⟨i.val, by rw [size0516]; exact i.isLt⟩
  change (entry0516 i).check = true at h
  rcases fields0516 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0517 : OriginalRow227TriangleForward0517.entries.size = 32 := rfl

def entry0517 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0517.entries[i.val]'(by rw [size0517]; exact i.isLt)

theorem fields0517 (i : Fin 32) :
    (entry0517 i).IA = shift ∧ (entry0517 i).ID = S (130 + i.val + 1) ∧
      (entry0517 i).IC = S 35 ∧ (entry0517 i).Inext = T 34 (130 + i.val + 1) ∧
      (entry0517 i).Icur = T 34 (130 + i.val) ∧
      (entry0517 i).output = T 35 (130 + i.val) ∧
      (entry0517 i).charge = charge 34 (130 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0519_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0533_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0517 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (130 + i.val)) shift
      (S (130 + i.val + 1)) (S 35) (T 34 (130 + i.val + 1))
      (T 34 (130 + i.val)) (T 35 (130 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0517.entries OriginalRow227TriangleForward0517.checked
    ⟨i.val, by rw [size0517]; exact i.isLt⟩
  change (entry0517 i).check = true at h
  rcases fields0517 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0518 : OriginalRow227TriangleForward0518.entries.size = 32 := rfl

def entry0518 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0518.entries[i.val]'(by rw [size0518]; exact i.isLt)

theorem fields0518 (i : Fin 32) :
    (entry0518 i).IA = shift ∧ (entry0518 i).ID = S (162 + i.val + 1) ∧
      (entry0518 i).IC = S 35 ∧ (entry0518 i).Inext = T 34 (162 + i.val + 1) ∧
      (entry0518 i).Icur = T 34 (162 + i.val) ∧
      (entry0518 i).output = T 35 (162 + i.val) ∧
      (entry0518 i).charge = charge 34 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0520_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0534_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0518 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 35) (T 34 (162 + i.val + 1))
      (T 34 (162 + i.val)) (T 35 (162 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0518.entries OriginalRow227TriangleForward0518.checked
    ⟨i.val, by rw [size0518]; exact i.isLt⟩
  change (entry0518 i).check = true at h
  rcases fields0518 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0519 : OriginalRow227TriangleForward0519.entries.size = 32 := rfl

def entry0519 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0519.entries[i.val]'(by rw [size0519]; exact i.isLt)

theorem fields0519 (i : Fin 32) :
    (entry0519 i).IA = shift ∧ (entry0519 i).ID = S (194 + i.val + 1) ∧
      (entry0519 i).IC = S 35 ∧ (entry0519 i).Inext = T 34 (194 + i.val + 1) ∧
      (entry0519 i).Icur = T 34 (194 + i.val) ∧
      (entry0519 i).output = T 35 (194 + i.val) ∧
      (entry0519 i).charge = charge 34 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0521_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0535_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0519 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 35) (T 34 (194 + i.val + 1))
      (T 34 (194 + i.val)) (T 35 (194 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0519.entries OriginalRow227TriangleForward0519.checked
    ⟨i.val, by rw [size0519]; exact i.isLt⟩
  change (entry0519 i).check = true at h
  rcases fields0519 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0520 : OriginalRow227TriangleForward0520.entries.size = 32 := rfl

def entry0520 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0520.entries[i.val]'(by rw [size0520]; exact i.isLt)

theorem fields0520 (i : Fin 32) :
    (entry0520 i).IA = shift ∧ (entry0520 i).ID = S (226 + i.val + 1) ∧
      (entry0520 i).IC = S 35 ∧ (entry0520 i).Inext = T 34 (226 + i.val + 1) ∧
      (entry0520 i).Icur = T 34 (226 + i.val) ∧
      (entry0520 i).output = T 35 (226 + i.val) ∧
      (entry0520 i).charge = charge 34 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0522_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0536_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0520 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 35) (T 34 (226 + i.val + 1))
      (T 34 (226 + i.val)) (T 35 (226 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0520.entries OriginalRow227TriangleForward0520.checked
    ⟨i.val, by rw [size0520]; exact i.isLt⟩
  change (entry0520 i).check = true at h
  rcases fields0520 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0521 : OriginalRow227TriangleForward0521.entries.size = 32 := rfl

def entry0521 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0521.entries[i.val]'(by rw [size0521]; exact i.isLt)

theorem fields0521 (i : Fin 32) :
    (entry0521 i).IA = shift ∧ (entry0521 i).ID = S (258 + i.val + 1) ∧
      (entry0521 i).IC = S 35 ∧ (entry0521 i).Inext = T 34 (258 + i.val + 1) ∧
      (entry0521 i).Icur = T 34 (258 + i.val) ∧
      (entry0521 i).output = T 35 (258 + i.val) ∧
      (entry0521 i).charge = charge 34 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0523_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0537_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0521 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 35) (T 34 (258 + i.val + 1))
      (T 34 (258 + i.val)) (T 35 (258 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0521.entries OriginalRow227TriangleForward0521.checked
    ⟨i.val, by rw [size0521]; exact i.isLt⟩
  change (entry0521 i).check = true at h
  rcases fields0521 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0522 : OriginalRow227TriangleForward0522.entries.size = 32 := rfl

def entry0522 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0522.entries[i.val]'(by rw [size0522]; exact i.isLt)

theorem fields0522 (i : Fin 32) :
    (entry0522 i).IA = shift ∧ (entry0522 i).ID = S (290 + i.val + 1) ∧
      (entry0522 i).IC = S 35 ∧ (entry0522 i).Inext = T 34 (290 + i.val + 1) ∧
      (entry0522 i).Icur = T 34 (290 + i.val) ∧
      (entry0522 i).output = T 35 (290 + i.val) ∧
      (entry0522 i).charge = charge 34 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0524_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0538_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0522 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 35) (T 34 (290 + i.val + 1))
      (T 34 (290 + i.val)) (T 35 (290 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0522.entries OriginalRow227TriangleForward0522.checked
    ⟨i.val, by rw [size0522]; exact i.isLt⟩
  change (entry0522 i).check = true at h
  rcases fields0522 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0523 : OriginalRow227TriangleForward0523.entries.size = 32 := rfl

def entry0523 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0523.entries[i.val]'(by rw [size0523]; exact i.isLt)

theorem fields0523 (i : Fin 32) :
    (entry0523 i).IA = shift ∧ (entry0523 i).ID = S (322 + i.val + 1) ∧
      (entry0523 i).IC = S 35 ∧ (entry0523 i).Inext = T 34 (322 + i.val + 1) ∧
      (entry0523 i).Icur = T 34 (322 + i.val) ∧
      (entry0523 i).output = T 35 (322 + i.val) ∧
      (entry0523 i).charge = charge 34 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0525_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0539_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0523 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 35) (T 34 (322 + i.val + 1))
      (T 34 (322 + i.val)) (T 35 (322 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0523.entries OriginalRow227TriangleForward0523.checked
    ⟨i.val, by rw [size0523]; exact i.isLt⟩
  change (entry0523 i).check = true at h
  rcases fields0523 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0524 : OriginalRow227TriangleForward0524.entries.size = 32 := rfl

def entry0524 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0524.entries[i.val]'(by rw [size0524]; exact i.isLt)

theorem fields0524 (i : Fin 32) :
    (entry0524 i).IA = shift ∧ (entry0524 i).ID = S (354 + i.val + 1) ∧
      (entry0524 i).IC = S 35 ∧ (entry0524 i).Inext = T 34 (354 + i.val + 1) ∧
      (entry0524 i).Icur = T 34 (354 + i.val) ∧
      (entry0524 i).output = T 35 (354 + i.val) ∧
      (entry0524 i).charge = charge 34 (354 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0526_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0540_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0524 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (354 + i.val)) shift
      (S (354 + i.val + 1)) (S 35) (T 34 (354 + i.val + 1))
      (T 34 (354 + i.val)) (T 35 (354 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0524.entries OriginalRow227TriangleForward0524.checked
    ⟨i.val, by rw [size0524]; exact i.isLt⟩
  change (entry0524 i).check = true at h
  rcases fields0524 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0525 : OriginalRow227TriangleForward0525.entries.size = 32 := rfl

def entry0525 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0525.entries[i.val]'(by rw [size0525]; exact i.isLt)

theorem fields0525 (i : Fin 32) :
    (entry0525 i).IA = shift ∧ (entry0525 i).ID = S (386 + i.val + 1) ∧
      (entry0525 i).IC = S 35 ∧ (entry0525 i).Inext = T 34 (386 + i.val + 1) ∧
      (entry0525 i).Icur = T 34 (386 + i.val) ∧
      (entry0525 i).output = T 35 (386 + i.val) ∧
      (entry0525 i).charge = charge 34 (386 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0527_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0541_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0525 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (386 + i.val)) shift
      (S (386 + i.val + 1)) (S 35) (T 34 (386 + i.val + 1))
      (T 34 (386 + i.val)) (T 35 (386 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0525.entries OriginalRow227TriangleForward0525.checked
    ⟨i.val, by rw [size0525]; exact i.isLt⟩
  change (entry0525 i).check = true at h
  rcases fields0525 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0526 : OriginalRow227TriangleForward0526.entries.size = 32 := rfl

def entry0526 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0526.entries[i.val]'(by rw [size0526]; exact i.isLt)

theorem fields0526 (i : Fin 32) :
    (entry0526 i).IA = shift ∧ (entry0526 i).ID = S (418 + i.val + 1) ∧
      (entry0526 i).IC = S 35 ∧ (entry0526 i).Inext = T 34 (418 + i.val + 1) ∧
      (entry0526 i).Icur = T 34 (418 + i.val) ∧
      (entry0526 i).output = T 35 (418 + i.val) ∧
      (entry0526 i).charge = charge 34 (418 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0528_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0542_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0526 (i : Fin 32) :
    forwardStepOK (-768) (charge 34 (418 + i.val)) shift
      (S (418 + i.val + 1)) (S 35) (T 34 (418 + i.val + 1))
      (T 34 (418 + i.val)) (T 35 (418 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0526.entries OriginalRow227TriangleForward0526.checked
    ⟨i.val, by rw [size0526]; exact i.isLt⟩
  change (entry0526 i).check = true at h
  rcases fields0526 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0527 : OriginalRow227TriangleForward0527.entries.size = 17 := rfl

def entry0527 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0527.entries[i.val]'(by rw [size0527]; exact i.isLt)

theorem fields0527 (i : Fin 17) :
    (entry0527 i).IA = shift ∧ (entry0527 i).ID = S (450 + i.val + 1) ∧
      (entry0527 i).IC = S 35 ∧ (entry0527 i).Inext = T 34 (450 + i.val + 1) ∧
      (entry0527 i).Icur = T 34 (450 + i.val) ∧
      (entry0527 i).output = T 35 (450 + i.val) ∧
      (entry0527 i).charge = charge 34 (450 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings01.S_eq_root35).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow034.block0529_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow035.block0543_value ⟨16, by decide⟩).symm, rfl⟩

theorem step0527 (i : Fin 17) :
    forwardStepOK (-768) (charge 34 (450 + i.val)) shift
      (S (450 + i.val + 1)) (S 35) (T 34 (450 + i.val + 1))
      (T 34 (450 + i.val)) (T 35 (450 + i.val))
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0527.entries OriginalRow227TriangleForward0527.checked
    ⟨i.val, by rw [size0527]; exact i.isLt⟩
  change (entry0527 i).check = true at h
  rcases fields0527 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 34 ≤ d) (hhi : d < 467) :
    forwardStepOK (-768) (charge 34 d) shift (S (d + 1)) (S 35)
      (T 34 (d + 1)) (T 34 d) (T 35 d)
      (OriginalRow227Roots.root_pos 35 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 34 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h130 : d < 130
    ·
      by_cases h66 : d < 66
      ·
        have hi : d - 34 < 32 := by omega
        have heq : 34 + (d - 34) = d := by omega
        simpa only [heq] using step0514 ⟨d - 34, hi⟩
      ·
        by_cases h98 : d < 98
        ·
          have hi : d - 66 < 32 := by omega
          have heq : 66 + (d - 66) = d := by omega
          simpa only [heq] using step0515 ⟨d - 66, hi⟩
        ·
          have hi : d - 98 < 32 := by omega
          have heq : 98 + (d - 98) = d := by omega
          simpa only [heq] using step0516 ⟨d - 98, hi⟩
    ·
      by_cases h194 : d < 194
      ·
        by_cases h162 : d < 162
        ·
          have hi : d - 130 < 32 := by omega
          have heq : 130 + (d - 130) = d := by omega
          simpa only [heq] using step0517 ⟨d - 130, hi⟩
        ·
          have hi : d - 162 < 32 := by omega
          have heq : 162 + (d - 162) = d := by omega
          simpa only [heq] using step0518 ⟨d - 162, hi⟩
      ·
        by_cases h226 : d < 226
        ·
          have hi : d - 194 < 32 := by omega
          have heq : 194 + (d - 194) = d := by omega
          simpa only [heq] using step0519 ⟨d - 194, hi⟩
        ·
          have hi : d - 226 < 32 := by omega
          have heq : 226 + (d - 226) = d := by omega
          simpa only [heq] using step0520 ⟨d - 226, hi⟩
  ·
    by_cases h354 : d < 354
    ·
      by_cases h290 : d < 290
      ·
        have hi : d - 258 < 32 := by omega
        have heq : 258 + (d - 258) = d := by omega
        simpa only [heq] using step0521 ⟨d - 258, hi⟩
      ·
        by_cases h322 : d < 322
        ·
          have hi : d - 290 < 32 := by omega
          have heq : 290 + (d - 290) = d := by omega
          simpa only [heq] using step0522 ⟨d - 290, hi⟩
        ·
          have hi : d - 322 < 32 := by omega
          have heq : 322 + (d - 322) = d := by omega
          simpa only [heq] using step0523 ⟨d - 322, hi⟩
    ·
      by_cases h418 : d < 418
      ·
        by_cases h386 : d < 386
        ·
          have hi : d - 354 < 32 := by omega
          have heq : 354 + (d - 354) = d := by omega
          simpa only [heq] using step0524 ⟨d - 354, hi⟩
        ·
          have hi : d - 386 < 32 := by omega
          have heq : 386 + (d - 386) = d := by omega
          simpa only [heq] using step0525 ⟨d - 386, hi⟩
      ·
        by_cases h450 : d < 450
        ·
          have hi : d - 418 < 32 := by omega
          have heq : 418 + (d - 418) = d := by omega
          simpa only [heq] using step0526 ⟨d - 418, hi⟩
        ·
          have hi : d - 450 < 17 := by omega
          have heq : 450 + (d - 450) = d := by omega
          simpa only [heq] using step0527 ⟨d - 450, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0514,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0514,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0515,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0515,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0516,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0516,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0517,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0517,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0518,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0518,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0519,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0519,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0520,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0520,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0521,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0521,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0522,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0522,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0523,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0523,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0524,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0524,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0525,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0525,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0526,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0526,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.fields0527,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.step0527,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow035
