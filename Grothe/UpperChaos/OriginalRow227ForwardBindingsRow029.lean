import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029
import Grothe.UpperChaos.OriginalRow227TriangleForward0430
import Grothe.UpperChaos.OriginalRow227TriangleForward0431
import Grothe.UpperChaos.OriginalRow227TriangleForward0432
import Grothe.UpperChaos.OriginalRow227TriangleForward0433
import Grothe.UpperChaos.OriginalRow227TriangleForward0434
import Grothe.UpperChaos.OriginalRow227TriangleForward0435
import Grothe.UpperChaos.OriginalRow227TriangleForward0436
import Grothe.UpperChaos.OriginalRow227TriangleForward0437
import Grothe.UpperChaos.OriginalRow227TriangleForward0438
import Grothe.UpperChaos.OriginalRow227TriangleForward0439
import Grothe.UpperChaos.OriginalRow227TriangleForward0440
import Grothe.UpperChaos.OriginalRow227TriangleForward0441
import Grothe.UpperChaos.OriginalRow227TriangleForward0442
import Grothe.UpperChaos.OriginalRow227TriangleForward0443

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0430 : OriginalRow227TriangleForward0430.entries.size = 32 := rfl

def entry0430 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0430.entries[i.val]'(by rw [size0430]; exact i.isLt)

theorem fields0430 (i : Fin 32) :
    (entry0430 i).IA = shift ∧ (entry0430 i).ID = S (28 + i.val + 1) ∧
      (entry0430 i).IC = S 29 ∧ (entry0430 i).Inext = T 28 (28 + i.val + 1) ∧
      (entry0430 i).Icur = T 28 (28 + i.val) ∧
      (entry0430 i).output = T 29 (28 + i.val) ∧
      (entry0430 i).charge = charge 28 (28 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0446_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0430 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (28 + i.val)) shift
      (S (28 + i.val + 1)) (S 29) (T 28 (28 + i.val + 1))
      (T 28 (28 + i.val)) (T 29 (28 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0430.entries OriginalRow227TriangleForward0430.checked
    ⟨i.val, by rw [size0430]; exact i.isLt⟩
  change (entry0430 i).check = true at h
  rcases fields0430 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0431 : OriginalRow227TriangleForward0431.entries.size = 32 := rfl

def entry0431 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0431.entries[i.val]'(by rw [size0431]; exact i.isLt)

theorem fields0431 (i : Fin 32) :
    (entry0431 i).IA = shift ∧ (entry0431 i).ID = S (60 + i.val + 1) ∧
      (entry0431 i).IC = S 29 ∧ (entry0431 i).Inext = T 28 (60 + i.val + 1) ∧
      (entry0431 i).Icur = T 28 (60 + i.val) ∧
      (entry0431 i).output = T 29 (60 + i.val) ∧
      (entry0431 i).charge = charge 28 (60 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0447_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0431 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (60 + i.val)) shift
      (S (60 + i.val + 1)) (S 29) (T 28 (60 + i.val + 1))
      (T 28 (60 + i.val)) (T 29 (60 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0431.entries OriginalRow227TriangleForward0431.checked
    ⟨i.val, by rw [size0431]; exact i.isLt⟩
  change (entry0431 i).check = true at h
  rcases fields0431 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0432 : OriginalRow227TriangleForward0432.entries.size = 32 := rfl

def entry0432 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0432.entries[i.val]'(by rw [size0432]; exact i.isLt)

theorem fields0432 (i : Fin 32) :
    (entry0432 i).IA = shift ∧ (entry0432 i).ID = S (92 + i.val + 1) ∧
      (entry0432 i).IC = S 29 ∧ (entry0432 i).Inext = T 28 (92 + i.val + 1) ∧
      (entry0432 i).Icur = T 28 (92 + i.val) ∧
      (entry0432 i).output = T 29 (92 + i.val) ∧
      (entry0432 i).charge = charge 28 (92 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0448_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0432 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (92 + i.val)) shift
      (S (92 + i.val + 1)) (S 29) (T 28 (92 + i.val + 1))
      (T 28 (92 + i.val)) (T 29 (92 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0432.entries OriginalRow227TriangleForward0432.checked
    ⟨i.val, by rw [size0432]; exact i.isLt⟩
  change (entry0432 i).check = true at h
  rcases fields0432 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0433 : OriginalRow227TriangleForward0433.entries.size = 32 := rfl

def entry0433 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0433.entries[i.val]'(by rw [size0433]; exact i.isLt)

theorem fields0433 (i : Fin 32) :
    (entry0433 i).IA = shift ∧ (entry0433 i).ID = S (124 + i.val + 1) ∧
      (entry0433 i).IC = S 29 ∧ (entry0433 i).Inext = T 28 (124 + i.val + 1) ∧
      (entry0433 i).Icur = T 28 (124 + i.val) ∧
      (entry0433 i).output = T 29 (124 + i.val) ∧
      (entry0433 i).charge = charge 28 (124 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0449_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0433 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (124 + i.val)) shift
      (S (124 + i.val + 1)) (S 29) (T 28 (124 + i.val + 1))
      (T 28 (124 + i.val)) (T 29 (124 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0433.entries OriginalRow227TriangleForward0433.checked
    ⟨i.val, by rw [size0433]; exact i.isLt⟩
  change (entry0433 i).check = true at h
  rcases fields0433 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0434 : OriginalRow227TriangleForward0434.entries.size = 32 := rfl

def entry0434 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0434.entries[i.val]'(by rw [size0434]; exact i.isLt)

theorem fields0434 (i : Fin 32) :
    (entry0434 i).IA = shift ∧ (entry0434 i).ID = S (156 + i.val + 1) ∧
      (entry0434 i).IC = S 29 ∧ (entry0434 i).Inext = T 28 (156 + i.val + 1) ∧
      (entry0434 i).Icur = T 28 (156 + i.val) ∧
      (entry0434 i).output = T 29 (156 + i.val) ∧
      (entry0434 i).charge = charge 28 (156 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0450_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0434 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (156 + i.val)) shift
      (S (156 + i.val + 1)) (S 29) (T 28 (156 + i.val + 1))
      (T 28 (156 + i.val)) (T 29 (156 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0434.entries OriginalRow227TriangleForward0434.checked
    ⟨i.val, by rw [size0434]; exact i.isLt⟩
  change (entry0434 i).check = true at h
  rcases fields0434 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0435 : OriginalRow227TriangleForward0435.entries.size = 32 := rfl

def entry0435 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0435.entries[i.val]'(by rw [size0435]; exact i.isLt)

theorem fields0435 (i : Fin 32) :
    (entry0435 i).IA = shift ∧ (entry0435 i).ID = S (188 + i.val + 1) ∧
      (entry0435 i).IC = S 29 ∧ (entry0435 i).Inext = T 28 (188 + i.val + 1) ∧
      (entry0435 i).Icur = T 28 (188 + i.val) ∧
      (entry0435 i).output = T 29 (188 + i.val) ∧
      (entry0435 i).charge = charge 28 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0451_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0435 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 29) (T 28 (188 + i.val + 1))
      (T 28 (188 + i.val)) (T 29 (188 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0435.entries OriginalRow227TriangleForward0435.checked
    ⟨i.val, by rw [size0435]; exact i.isLt⟩
  change (entry0435 i).check = true at h
  rcases fields0435 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0436 : OriginalRow227TriangleForward0436.entries.size = 32 := rfl

def entry0436 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0436.entries[i.val]'(by rw [size0436]; exact i.isLt)

theorem fields0436 (i : Fin 32) :
    (entry0436 i).IA = shift ∧ (entry0436 i).ID = S (220 + i.val + 1) ∧
      (entry0436 i).IC = S 29 ∧ (entry0436 i).Inext = T 28 (220 + i.val + 1) ∧
      (entry0436 i).Icur = T 28 (220 + i.val) ∧
      (entry0436 i).output = T 29 (220 + i.val) ∧
      (entry0436 i).charge = charge 28 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0452_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0436 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 29) (T 28 (220 + i.val + 1))
      (T 28 (220 + i.val)) (T 29 (220 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0436.entries OriginalRow227TriangleForward0436.checked
    ⟨i.val, by rw [size0436]; exact i.isLt⟩
  change (entry0436 i).check = true at h
  rcases fields0436 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0437 : OriginalRow227TriangleForward0437.entries.size = 32 := rfl

def entry0437 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0437.entries[i.val]'(by rw [size0437]; exact i.isLt)

theorem fields0437 (i : Fin 32) :
    (entry0437 i).IA = shift ∧ (entry0437 i).ID = S (252 + i.val + 1) ∧
      (entry0437 i).IC = S 29 ∧ (entry0437 i).Inext = T 28 (252 + i.val + 1) ∧
      (entry0437 i).Icur = T 28 (252 + i.val) ∧
      (entry0437 i).output = T 29 (252 + i.val) ∧
      (entry0437 i).charge = charge 28 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0453_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0437 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 29) (T 28 (252 + i.val + 1))
      (T 28 (252 + i.val)) (T 29 (252 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0437.entries OriginalRow227TriangleForward0437.checked
    ⟨i.val, by rw [size0437]; exact i.isLt⟩
  change (entry0437 i).check = true at h
  rcases fields0437 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0438 : OriginalRow227TriangleForward0438.entries.size = 32 := rfl

def entry0438 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0438.entries[i.val]'(by rw [size0438]; exact i.isLt)

theorem fields0438 (i : Fin 32) :
    (entry0438 i).IA = shift ∧ (entry0438 i).ID = S (284 + i.val + 1) ∧
      (entry0438 i).IC = S 29 ∧ (entry0438 i).Inext = T 28 (284 + i.val + 1) ∧
      (entry0438 i).Icur = T 28 (284 + i.val) ∧
      (entry0438 i).output = T 29 (284 + i.val) ∧
      (entry0438 i).charge = charge 28 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0454_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0438 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 29) (T 28 (284 + i.val + 1))
      (T 28 (284 + i.val)) (T 29 (284 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0438.entries OriginalRow227TriangleForward0438.checked
    ⟨i.val, by rw [size0438]; exact i.isLt⟩
  change (entry0438 i).check = true at h
  rcases fields0438 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0439 : OriginalRow227TriangleForward0439.entries.size = 32 := rfl

def entry0439 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0439.entries[i.val]'(by rw [size0439]; exact i.isLt)

theorem fields0439 (i : Fin 32) :
    (entry0439 i).IA = shift ∧ (entry0439 i).ID = S (316 + i.val + 1) ∧
      (entry0439 i).IC = S 29 ∧ (entry0439 i).Inext = T 28 (316 + i.val + 1) ∧
      (entry0439 i).Icur = T 28 (316 + i.val) ∧
      (entry0439 i).output = T 29 (316 + i.val) ∧
      (entry0439 i).charge = charge 28 (316 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0455_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0439 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (316 + i.val)) shift
      (S (316 + i.val + 1)) (S 29) (T 28 (316 + i.val + 1))
      (T 28 (316 + i.val)) (T 29 (316 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0439.entries OriginalRow227TriangleForward0439.checked
    ⟨i.val, by rw [size0439]; exact i.isLt⟩
  change (entry0439 i).check = true at h
  rcases fields0439 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0440 : OriginalRow227TriangleForward0440.entries.size = 32 := rfl

def entry0440 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0440.entries[i.val]'(by rw [size0440]; exact i.isLt)

theorem fields0440 (i : Fin 32) :
    (entry0440 i).IA = shift ∧ (entry0440 i).ID = S (348 + i.val + 1) ∧
      (entry0440 i).IC = S 29 ∧ (entry0440 i).Inext = T 28 (348 + i.val + 1) ∧
      (entry0440 i).Icur = T 28 (348 + i.val) ∧
      (entry0440 i).output = T 29 (348 + i.val) ∧
      (entry0440 i).charge = charge 28 (348 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0456_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0440 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (348 + i.val)) shift
      (S (348 + i.val + 1)) (S 29) (T 28 (348 + i.val + 1))
      (T 28 (348 + i.val)) (T 29 (348 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0440.entries OriginalRow227TriangleForward0440.checked
    ⟨i.val, by rw [size0440]; exact i.isLt⟩
  change (entry0440 i).check = true at h
  rcases fields0440 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0441 : OriginalRow227TriangleForward0441.entries.size = 32 := rfl

def entry0441 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0441.entries[i.val]'(by rw [size0441]; exact i.isLt)

theorem fields0441 (i : Fin 32) :
    (entry0441 i).IA = shift ∧ (entry0441 i).ID = S (380 + i.val + 1) ∧
      (entry0441 i).IC = S 29 ∧ (entry0441 i).Inext = T 28 (380 + i.val + 1) ∧
      (entry0441 i).Icur = T 28 (380 + i.val) ∧
      (entry0441 i).output = T 29 (380 + i.val) ∧
      (entry0441 i).charge = charge 28 (380 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0457_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0441 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (380 + i.val)) shift
      (S (380 + i.val + 1)) (S 29) (T 28 (380 + i.val + 1))
      (T 28 (380 + i.val)) (T 29 (380 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0441.entries OriginalRow227TriangleForward0441.checked
    ⟨i.val, by rw [size0441]; exact i.isLt⟩
  change (entry0441 i).check = true at h
  rcases fields0441 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0442 : OriginalRow227TriangleForward0442.entries.size = 32 := rfl

def entry0442 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0442.entries[i.val]'(by rw [size0442]; exact i.isLt)

theorem fields0442 (i : Fin 32) :
    (entry0442 i).IA = shift ∧ (entry0442 i).ID = S (412 + i.val + 1) ∧
      (entry0442 i).IC = S 29 ∧ (entry0442 i).Inext = T 28 (412 + i.val + 1) ∧
      (entry0442 i).Icur = T 28 (412 + i.val) ∧
      (entry0442 i).output = T 29 (412 + i.val) ∧
      (entry0442 i).charge = charge 28 (412 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0458_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0442 (i : Fin 32) :
    forwardStepOK (-768) (charge 28 (412 + i.val)) shift
      (S (412 + i.val + 1)) (S 29) (T 28 (412 + i.val + 1))
      (T 28 (412 + i.val)) (T 29 (412 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0442.entries OriginalRow227TriangleForward0442.checked
    ⟨i.val, by rw [size0442]; exact i.isLt⟩
  change (entry0442 i).check = true at h
  rcases fields0442 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0443 : OriginalRow227TriangleForward0443.entries.size = 29 := rfl

def entry0443 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0443.entries[i.val]'(by rw [size0443]; exact i.isLt)

theorem fields0443 (i : Fin 29) :
    (entry0443 i).IA = shift ∧ (entry0443 i).ID = S (444 + i.val + 1) ∧
      (entry0443 i).IC = S 29 ∧ (entry0443 i).Inext = T 28 (444 + i.val + 1) ∧
      (entry0443 i).Icur = T 28 (444 + i.val) ∧
      (entry0443 i).output = T 29 (444 + i.val) ∧
      (entry0443 i).charge = charge 28 (444 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root29).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow029.block0459_value ⟨28, by decide⟩).symm, rfl⟩

theorem step0443 (i : Fin 29) :
    forwardStepOK (-768) (charge 28 (444 + i.val)) shift
      (S (444 + i.val + 1)) (S 29) (T 28 (444 + i.val + 1))
      (T 28 (444 + i.val)) (T 29 (444 + i.val))
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0443.entries OriginalRow227TriangleForward0443.checked
    ⟨i.val, by rw [size0443]; exact i.isLt⟩
  change (entry0443 i).check = true at h
  rcases fields0443 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 28 ≤ d) (hhi : d < 473) :
    forwardStepOK (-768) (charge 28 d) shift (S (d + 1)) (S 29)
      (T 28 (d + 1)) (T 28 d) (T 29 d)
      (OriginalRow227Roots.root_pos 29 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 28 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h124 : d < 124
    ·
      by_cases h60 : d < 60
      ·
        have hi : d - 28 < 32 := by omega
        have heq : 28 + (d - 28) = d := by omega
        simpa only [heq] using step0430 ⟨d - 28, hi⟩
      ·
        by_cases h92 : d < 92
        ·
          have hi : d - 60 < 32 := by omega
          have heq : 60 + (d - 60) = d := by omega
          simpa only [heq] using step0431 ⟨d - 60, hi⟩
        ·
          have hi : d - 92 < 32 := by omega
          have heq : 92 + (d - 92) = d := by omega
          simpa only [heq] using step0432 ⟨d - 92, hi⟩
    ·
      by_cases h188 : d < 188
      ·
        by_cases h156 : d < 156
        ·
          have hi : d - 124 < 32 := by omega
          have heq : 124 + (d - 124) = d := by omega
          simpa only [heq] using step0433 ⟨d - 124, hi⟩
        ·
          have hi : d - 156 < 32 := by omega
          have heq : 156 + (d - 156) = d := by omega
          simpa only [heq] using step0434 ⟨d - 156, hi⟩
      ·
        by_cases h220 : d < 220
        ·
          have hi : d - 188 < 32 := by omega
          have heq : 188 + (d - 188) = d := by omega
          simpa only [heq] using step0435 ⟨d - 188, hi⟩
        ·
          have hi : d - 220 < 32 := by omega
          have heq : 220 + (d - 220) = d := by omega
          simpa only [heq] using step0436 ⟨d - 220, hi⟩
  ·
    by_cases h348 : d < 348
    ·
      by_cases h284 : d < 284
      ·
        have hi : d - 252 < 32 := by omega
        have heq : 252 + (d - 252) = d := by omega
        simpa only [heq] using step0437 ⟨d - 252, hi⟩
      ·
        by_cases h316 : d < 316
        ·
          have hi : d - 284 < 32 := by omega
          have heq : 284 + (d - 284) = d := by omega
          simpa only [heq] using step0438 ⟨d - 284, hi⟩
        ·
          have hi : d - 316 < 32 := by omega
          have heq : 316 + (d - 316) = d := by omega
          simpa only [heq] using step0439 ⟨d - 316, hi⟩
    ·
      by_cases h412 : d < 412
      ·
        by_cases h380 : d < 380
        ·
          have hi : d - 348 < 32 := by omega
          have heq : 348 + (d - 348) = d := by omega
          simpa only [heq] using step0440 ⟨d - 348, hi⟩
        ·
          have hi : d - 380 < 32 := by omega
          have heq : 380 + (d - 380) = d := by omega
          simpa only [heq] using step0441 ⟨d - 380, hi⟩
      ·
        by_cases h444 : d < 444
        ·
          have hi : d - 412 < 32 := by omega
          have heq : 412 + (d - 412) = d := by omega
          simpa only [heq] using step0442 ⟨d - 412, hi⟩
        ·
          have hi : d - 444 < 29 := by omega
          have heq : 444 + (d - 444) = d := by omega
          simpa only [heq] using step0443 ⟨d - 444, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0430,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0430,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0431,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0431,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0432,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0432,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0433,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0433,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0434,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0434,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0435,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0435,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0436,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0436,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0437,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0437,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0438,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0438,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0439,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0439,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0440,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0440,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0441,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0441,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0442,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0442,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.fields0443,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.step0443,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow029
