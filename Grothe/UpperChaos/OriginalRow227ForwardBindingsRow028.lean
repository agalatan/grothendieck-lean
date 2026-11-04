import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028
import Grothe.UpperChaos.OriginalRow227TriangleForward0416
import Grothe.UpperChaos.OriginalRow227TriangleForward0417
import Grothe.UpperChaos.OriginalRow227TriangleForward0418
import Grothe.UpperChaos.OriginalRow227TriangleForward0419
import Grothe.UpperChaos.OriginalRow227TriangleForward0420
import Grothe.UpperChaos.OriginalRow227TriangleForward0421
import Grothe.UpperChaos.OriginalRow227TriangleForward0422
import Grothe.UpperChaos.OriginalRow227TriangleForward0423
import Grothe.UpperChaos.OriginalRow227TriangleForward0424
import Grothe.UpperChaos.OriginalRow227TriangleForward0425
import Grothe.UpperChaos.OriginalRow227TriangleForward0426
import Grothe.UpperChaos.OriginalRow227TriangleForward0427
import Grothe.UpperChaos.OriginalRow227TriangleForward0428
import Grothe.UpperChaos.OriginalRow227TriangleForward0429

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0416 : OriginalRow227TriangleForward0416.entries.size = 32 := rfl

def entry0416 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0416.entries[i.val]'(by rw [size0416]; exact i.isLt)

theorem fields0416 (i : Fin 32) :
    (entry0416 i).IA = shift ∧ (entry0416 i).ID = S (27 + i.val + 1) ∧
      (entry0416 i).IC = S 28 ∧ (entry0416 i).Inext = T 27 (27 + i.val + 1) ∧
      (entry0416 i).Icur = T 27 (27 + i.val) ∧
      (entry0416 i).output = T 28 (27 + i.val) ∧
      (entry0416 i).charge = charge 27 (27 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root28).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root29).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root30).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root31).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings00.S_eq_root32).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0417_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0432_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0416 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (27 + i.val)) shift
      (S (27 + i.val + 1)) (S 28) (T 27 (27 + i.val + 1))
      (T 27 (27 + i.val)) (T 28 (27 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0416.entries OriginalRow227TriangleForward0416.checked
    ⟨i.val, by rw [size0416]; exact i.isLt⟩
  change (entry0416 i).check = true at h
  rcases fields0416 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0417 : OriginalRow227TriangleForward0417.entries.size = 32 := rfl

def entry0417 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0417.entries[i.val]'(by rw [size0417]; exact i.isLt)

theorem fields0417 (i : Fin 32) :
    (entry0417 i).IA = shift ∧ (entry0417 i).ID = S (59 + i.val + 1) ∧
      (entry0417 i).IC = S 28 ∧ (entry0417 i).Inext = T 27 (59 + i.val + 1) ∧
      (entry0417 i).Icur = T 27 (59 + i.val) ∧
      (entry0417 i).output = T 28 (59 + i.val) ∧
      (entry0417 i).charge = charge 27 (59 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0418_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0433_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0417 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (59 + i.val)) shift
      (S (59 + i.val + 1)) (S 28) (T 27 (59 + i.val + 1))
      (T 27 (59 + i.val)) (T 28 (59 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0417.entries OriginalRow227TriangleForward0417.checked
    ⟨i.val, by rw [size0417]; exact i.isLt⟩
  change (entry0417 i).check = true at h
  rcases fields0417 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0418 : OriginalRow227TriangleForward0418.entries.size = 32 := rfl

def entry0418 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0418.entries[i.val]'(by rw [size0418]; exact i.isLt)

theorem fields0418 (i : Fin 32) :
    (entry0418 i).IA = shift ∧ (entry0418 i).ID = S (91 + i.val + 1) ∧
      (entry0418 i).IC = S 28 ∧ (entry0418 i).Inext = T 27 (91 + i.val + 1) ∧
      (entry0418 i).Icur = T 27 (91 + i.val) ∧
      (entry0418 i).output = T 28 (91 + i.val) ∧
      (entry0418 i).charge = charge 27 (91 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0419_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0434_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0418 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (91 + i.val)) shift
      (S (91 + i.val + 1)) (S 28) (T 27 (91 + i.val + 1))
      (T 27 (91 + i.val)) (T 28 (91 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0418.entries OriginalRow227TriangleForward0418.checked
    ⟨i.val, by rw [size0418]; exact i.isLt⟩
  change (entry0418 i).check = true at h
  rcases fields0418 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0419 : OriginalRow227TriangleForward0419.entries.size = 32 := rfl

def entry0419 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0419.entries[i.val]'(by rw [size0419]; exact i.isLt)

theorem fields0419 (i : Fin 32) :
    (entry0419 i).IA = shift ∧ (entry0419 i).ID = S (123 + i.val + 1) ∧
      (entry0419 i).IC = S 28 ∧ (entry0419 i).Inext = T 27 (123 + i.val + 1) ∧
      (entry0419 i).Icur = T 27 (123 + i.val) ∧
      (entry0419 i).output = T 28 (123 + i.val) ∧
      (entry0419 i).charge = charge 27 (123 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0420_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0435_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0419 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (123 + i.val)) shift
      (S (123 + i.val + 1)) (S 28) (T 27 (123 + i.val + 1))
      (T 27 (123 + i.val)) (T 28 (123 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0419.entries OriginalRow227TriangleForward0419.checked
    ⟨i.val, by rw [size0419]; exact i.isLt⟩
  change (entry0419 i).check = true at h
  rcases fields0419 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0420 : OriginalRow227TriangleForward0420.entries.size = 32 := rfl

def entry0420 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0420.entries[i.val]'(by rw [size0420]; exact i.isLt)

theorem fields0420 (i : Fin 32) :
    (entry0420 i).IA = shift ∧ (entry0420 i).ID = S (155 + i.val + 1) ∧
      (entry0420 i).IC = S 28 ∧ (entry0420 i).Inext = T 27 (155 + i.val + 1) ∧
      (entry0420 i).Icur = T 27 (155 + i.val) ∧
      (entry0420 i).output = T 28 (155 + i.val) ∧
      (entry0420 i).charge = charge 27 (155 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0421_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0436_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0420 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (155 + i.val)) shift
      (S (155 + i.val + 1)) (S 28) (T 27 (155 + i.val + 1))
      (T 27 (155 + i.val)) (T 28 (155 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0420.entries OriginalRow227TriangleForward0420.checked
    ⟨i.val, by rw [size0420]; exact i.isLt⟩
  change (entry0420 i).check = true at h
  rcases fields0420 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0421 : OriginalRow227TriangleForward0421.entries.size = 32 := rfl

def entry0421 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0421.entries[i.val]'(by rw [size0421]; exact i.isLt)

theorem fields0421 (i : Fin 32) :
    (entry0421 i).IA = shift ∧ (entry0421 i).ID = S (187 + i.val + 1) ∧
      (entry0421 i).IC = S 28 ∧ (entry0421 i).Inext = T 27 (187 + i.val + 1) ∧
      (entry0421 i).Icur = T 27 (187 + i.val) ∧
      (entry0421 i).output = T 28 (187 + i.val) ∧
      (entry0421 i).charge = charge 27 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0422_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0437_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0421 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 28) (T 27 (187 + i.val + 1))
      (T 27 (187 + i.val)) (T 28 (187 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0421.entries OriginalRow227TriangleForward0421.checked
    ⟨i.val, by rw [size0421]; exact i.isLt⟩
  change (entry0421 i).check = true at h
  rcases fields0421 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0422 : OriginalRow227TriangleForward0422.entries.size = 32 := rfl

def entry0422 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0422.entries[i.val]'(by rw [size0422]; exact i.isLt)

theorem fields0422 (i : Fin 32) :
    (entry0422 i).IA = shift ∧ (entry0422 i).ID = S (219 + i.val + 1) ∧
      (entry0422 i).IC = S 28 ∧ (entry0422 i).Inext = T 27 (219 + i.val + 1) ∧
      (entry0422 i).Icur = T 27 (219 + i.val) ∧
      (entry0422 i).output = T 28 (219 + i.val) ∧
      (entry0422 i).charge = charge 27 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0423_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0438_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0422 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 28) (T 27 (219 + i.val + 1))
      (T 27 (219 + i.val)) (T 28 (219 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0422.entries OriginalRow227TriangleForward0422.checked
    ⟨i.val, by rw [size0422]; exact i.isLt⟩
  change (entry0422 i).check = true at h
  rcases fields0422 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0423 : OriginalRow227TriangleForward0423.entries.size = 32 := rfl

def entry0423 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0423.entries[i.val]'(by rw [size0423]; exact i.isLt)

theorem fields0423 (i : Fin 32) :
    (entry0423 i).IA = shift ∧ (entry0423 i).ID = S (251 + i.val + 1) ∧
      (entry0423 i).IC = S 28 ∧ (entry0423 i).Inext = T 27 (251 + i.val + 1) ∧
      (entry0423 i).Icur = T 27 (251 + i.val) ∧
      (entry0423 i).output = T 28 (251 + i.val) ∧
      (entry0423 i).charge = charge 27 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0424_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0439_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0423 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 28) (T 27 (251 + i.val + 1))
      (T 27 (251 + i.val)) (T 28 (251 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0423.entries OriginalRow227TriangleForward0423.checked
    ⟨i.val, by rw [size0423]; exact i.isLt⟩
  change (entry0423 i).check = true at h
  rcases fields0423 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0424 : OriginalRow227TriangleForward0424.entries.size = 32 := rfl

def entry0424 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0424.entries[i.val]'(by rw [size0424]; exact i.isLt)

theorem fields0424 (i : Fin 32) :
    (entry0424 i).IA = shift ∧ (entry0424 i).ID = S (283 + i.val + 1) ∧
      (entry0424 i).IC = S 28 ∧ (entry0424 i).Inext = T 27 (283 + i.val + 1) ∧
      (entry0424 i).Icur = T 27 (283 + i.val) ∧
      (entry0424 i).output = T 28 (283 + i.val) ∧
      (entry0424 i).charge = charge 27 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0425_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0440_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0424 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 28) (T 27 (283 + i.val + 1))
      (T 27 (283 + i.val)) (T 28 (283 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0424.entries OriginalRow227TriangleForward0424.checked
    ⟨i.val, by rw [size0424]; exact i.isLt⟩
  change (entry0424 i).check = true at h
  rcases fields0424 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0425 : OriginalRow227TriangleForward0425.entries.size = 32 := rfl

def entry0425 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0425.entries[i.val]'(by rw [size0425]; exact i.isLt)

theorem fields0425 (i : Fin 32) :
    (entry0425 i).IA = shift ∧ (entry0425 i).ID = S (315 + i.val + 1) ∧
      (entry0425 i).IC = S 28 ∧ (entry0425 i).Inext = T 27 (315 + i.val + 1) ∧
      (entry0425 i).Icur = T 27 (315 + i.val) ∧
      (entry0425 i).output = T 28 (315 + i.val) ∧
      (entry0425 i).charge = charge 27 (315 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0426_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0441_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0425 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (315 + i.val)) shift
      (S (315 + i.val + 1)) (S 28) (T 27 (315 + i.val + 1))
      (T 27 (315 + i.val)) (T 28 (315 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0425.entries OriginalRow227TriangleForward0425.checked
    ⟨i.val, by rw [size0425]; exact i.isLt⟩
  change (entry0425 i).check = true at h
  rcases fields0425 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0426 : OriginalRow227TriangleForward0426.entries.size = 32 := rfl

def entry0426 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0426.entries[i.val]'(by rw [size0426]; exact i.isLt)

theorem fields0426 (i : Fin 32) :
    (entry0426 i).IA = shift ∧ (entry0426 i).ID = S (347 + i.val + 1) ∧
      (entry0426 i).IC = S 28 ∧ (entry0426 i).Inext = T 27 (347 + i.val + 1) ∧
      (entry0426 i).Icur = T 27 (347 + i.val) ∧
      (entry0426 i).output = T 28 (347 + i.val) ∧
      (entry0426 i).charge = charge 27 (347 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0427_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0442_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0426 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (347 + i.val)) shift
      (S (347 + i.val + 1)) (S 28) (T 27 (347 + i.val + 1))
      (T 27 (347 + i.val)) (T 28 (347 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0426.entries OriginalRow227TriangleForward0426.checked
    ⟨i.val, by rw [size0426]; exact i.isLt⟩
  change (entry0426 i).check = true at h
  rcases fields0426 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0427 : OriginalRow227TriangleForward0427.entries.size = 32 := rfl

def entry0427 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0427.entries[i.val]'(by rw [size0427]; exact i.isLt)

theorem fields0427 (i : Fin 32) :
    (entry0427 i).IA = shift ∧ (entry0427 i).ID = S (379 + i.val + 1) ∧
      (entry0427 i).IC = S 28 ∧ (entry0427 i).Inext = T 27 (379 + i.val + 1) ∧
      (entry0427 i).Icur = T 27 (379 + i.val) ∧
      (entry0427 i).output = T 28 (379 + i.val) ∧
      (entry0427 i).charge = charge 27 (379 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0428_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0443_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0427 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (379 + i.val)) shift
      (S (379 + i.val + 1)) (S 28) (T 27 (379 + i.val + 1))
      (T 27 (379 + i.val)) (T 28 (379 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0427.entries OriginalRow227TriangleForward0427.checked
    ⟨i.val, by rw [size0427]; exact i.isLt⟩
  change (entry0427 i).check = true at h
  rcases fields0427 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0428 : OriginalRow227TriangleForward0428.entries.size = 32 := rfl

def entry0428 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0428.entries[i.val]'(by rw [size0428]; exact i.isLt)

theorem fields0428 (i : Fin 32) :
    (entry0428 i).IA = shift ∧ (entry0428 i).ID = S (411 + i.val + 1) ∧
      (entry0428 i).IC = S 28 ∧ (entry0428 i).Inext = T 27 (411 + i.val + 1) ∧
      (entry0428 i).Icur = T 27 (411 + i.val) ∧
      (entry0428 i).output = T 28 (411 + i.val) ∧
      (entry0428 i).charge = charge 27 (411 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0429_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0444_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0428 (i : Fin 32) :
    forwardStepOK (-768) (charge 27 (411 + i.val)) shift
      (S (411 + i.val + 1)) (S 28) (T 27 (411 + i.val + 1))
      (T 27 (411 + i.val)) (T 28 (411 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0428.entries OriginalRow227TriangleForward0428.checked
    ⟨i.val, by rw [size0428]; exact i.isLt⟩
  change (entry0428 i).check = true at h
  rcases fields0428 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0429 : OriginalRow227TriangleForward0429.entries.size = 31 := rfl

def entry0429 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0429.entries[i.val]'(by rw [size0429]; exact i.isLt)

theorem fields0429 (i : Fin 31) :
    (entry0429 i).IA = shift ∧ (entry0429 i).ID = S (443 + i.val + 1) ∧
      (entry0429 i).IC = S 28 ∧ (entry0429 i).Inext = T 27 (443 + i.val + 1) ∧
      (entry0429 i).Icur = T 27 (443 + i.val) ∧
      (entry0429 i).output = T 28 (443 + i.val) ∧
      (entry0429 i).charge = charge 27 (443 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root470).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root471).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root472).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root473).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root474).symm, (OriginalRow227RootBindings00.S_eq_root28).symm,
      (OriginalRow227TriangleBindingsRow027.block0431_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow027.block0430_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow028.block0445_value ⟨30, by decide⟩).symm, rfl⟩

theorem step0429 (i : Fin 31) :
    forwardStepOK (-768) (charge 27 (443 + i.val)) shift
      (S (443 + i.val + 1)) (S 28) (T 27 (443 + i.val + 1))
      (T 27 (443 + i.val)) (T 28 (443 + i.val))
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0429.entries OriginalRow227TriangleForward0429.checked
    ⟨i.val, by rw [size0429]; exact i.isLt⟩
  change (entry0429 i).check = true at h
  rcases fields0429 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 27 ≤ d) (hhi : d < 474) :
    forwardStepOK (-768) (charge 27 d) shift (S (d + 1)) (S 28)
      (T 27 (d + 1)) (T 27 d) (T 28 d)
      (OriginalRow227Roots.root_pos 28 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 27 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h123 : d < 123
    ·
      by_cases h59 : d < 59
      ·
        have hi : d - 27 < 32 := by omega
        have heq : 27 + (d - 27) = d := by omega
        simpa only [heq] using step0416 ⟨d - 27, hi⟩
      ·
        by_cases h91 : d < 91
        ·
          have hi : d - 59 < 32 := by omega
          have heq : 59 + (d - 59) = d := by omega
          simpa only [heq] using step0417 ⟨d - 59, hi⟩
        ·
          have hi : d - 91 < 32 := by omega
          have heq : 91 + (d - 91) = d := by omega
          simpa only [heq] using step0418 ⟨d - 91, hi⟩
    ·
      by_cases h187 : d < 187
      ·
        by_cases h155 : d < 155
        ·
          have hi : d - 123 < 32 := by omega
          have heq : 123 + (d - 123) = d := by omega
          simpa only [heq] using step0419 ⟨d - 123, hi⟩
        ·
          have hi : d - 155 < 32 := by omega
          have heq : 155 + (d - 155) = d := by omega
          simpa only [heq] using step0420 ⟨d - 155, hi⟩
      ·
        by_cases h219 : d < 219
        ·
          have hi : d - 187 < 32 := by omega
          have heq : 187 + (d - 187) = d := by omega
          simpa only [heq] using step0421 ⟨d - 187, hi⟩
        ·
          have hi : d - 219 < 32 := by omega
          have heq : 219 + (d - 219) = d := by omega
          simpa only [heq] using step0422 ⟨d - 219, hi⟩
  ·
    by_cases h347 : d < 347
    ·
      by_cases h283 : d < 283
      ·
        have hi : d - 251 < 32 := by omega
        have heq : 251 + (d - 251) = d := by omega
        simpa only [heq] using step0423 ⟨d - 251, hi⟩
      ·
        by_cases h315 : d < 315
        ·
          have hi : d - 283 < 32 := by omega
          have heq : 283 + (d - 283) = d := by omega
          simpa only [heq] using step0424 ⟨d - 283, hi⟩
        ·
          have hi : d - 315 < 32 := by omega
          have heq : 315 + (d - 315) = d := by omega
          simpa only [heq] using step0425 ⟨d - 315, hi⟩
    ·
      by_cases h411 : d < 411
      ·
        by_cases h379 : d < 379
        ·
          have hi : d - 347 < 32 := by omega
          have heq : 347 + (d - 347) = d := by omega
          simpa only [heq] using step0426 ⟨d - 347, hi⟩
        ·
          have hi : d - 379 < 32 := by omega
          have heq : 379 + (d - 379) = d := by omega
          simpa only [heq] using step0427 ⟨d - 379, hi⟩
      ·
        by_cases h443 : d < 443
        ·
          have hi : d - 411 < 32 := by omega
          have heq : 411 + (d - 411) = d := by omega
          simpa only [heq] using step0428 ⟨d - 411, hi⟩
        ·
          have hi : d - 443 < 31 := by omega
          have heq : 443 + (d - 443) = d := by omega
          simpa only [heq] using step0429 ⟨d - 443, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0416,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0416,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0417,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0417,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0418,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0418,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0419,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0419,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0420,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0420,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0421,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0421,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0422,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0422,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0423,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0423,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0424,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0424,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0425,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0425,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0426,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0426,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0427,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0427,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0428,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0428,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.fields0429,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.step0429,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow028
