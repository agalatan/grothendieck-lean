import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow032
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow033
import Grothe.UpperChaos.OriginalRow227TriangleForward0486
import Grothe.UpperChaos.OriginalRow227TriangleForward0487
import Grothe.UpperChaos.OriginalRow227TriangleForward0488
import Grothe.UpperChaos.OriginalRow227TriangleForward0489
import Grothe.UpperChaos.OriginalRow227TriangleForward0490
import Grothe.UpperChaos.OriginalRow227TriangleForward0491
import Grothe.UpperChaos.OriginalRow227TriangleForward0492
import Grothe.UpperChaos.OriginalRow227TriangleForward0493
import Grothe.UpperChaos.OriginalRow227TriangleForward0494
import Grothe.UpperChaos.OriginalRow227TriangleForward0495
import Grothe.UpperChaos.OriginalRow227TriangleForward0496
import Grothe.UpperChaos.OriginalRow227TriangleForward0497
import Grothe.UpperChaos.OriginalRow227TriangleForward0498
import Grothe.UpperChaos.OriginalRow227TriangleForward0499

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0486 : OriginalRow227TriangleForward0486.entries.size = 32 := rfl

def entry0486 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0486.entries[i.val]'(by rw [size0486]; exact i.isLt)

theorem fields0486 (i : Fin 32) :
    (entry0486 i).IA = shift ∧ (entry0486 i).ID = S (32 + i.val + 1) ∧
      (entry0486 i).IC = S 33 ∧ (entry0486 i).Inext = T 32 (32 + i.val + 1) ∧
      (entry0486 i).Icur = T 32 (32 + i.val) ∧
      (entry0486 i).output = T 33 (32 + i.val) ∧
      (entry0486 i).charge = charge 32 (32 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root33).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root34).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root35).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root36).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root37).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root38).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0488_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0502_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0486 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (32 + i.val)) shift
      (S (32 + i.val + 1)) (S 33) (T 32 (32 + i.val + 1))
      (T 32 (32 + i.val)) (T 33 (32 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0486.entries OriginalRow227TriangleForward0486.checked
    ⟨i.val, by rw [size0486]; exact i.isLt⟩
  change (entry0486 i).check = true at h
  rcases fields0486 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0487 : OriginalRow227TriangleForward0487.entries.size = 32 := rfl

def entry0487 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0487.entries[i.val]'(by rw [size0487]; exact i.isLt)

theorem fields0487 (i : Fin 32) :
    (entry0487 i).IA = shift ∧ (entry0487 i).ID = S (64 + i.val + 1) ∧
      (entry0487 i).IC = S 33 ∧ (entry0487 i).Inext = T 32 (64 + i.val + 1) ∧
      (entry0487 i).Icur = T 32 (64 + i.val) ∧
      (entry0487 i).output = T 33 (64 + i.val) ∧
      (entry0487 i).charge = charge 32 (64 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0489_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0503_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0487 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (64 + i.val)) shift
      (S (64 + i.val + 1)) (S 33) (T 32 (64 + i.val + 1))
      (T 32 (64 + i.val)) (T 33 (64 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0487.entries OriginalRow227TriangleForward0487.checked
    ⟨i.val, by rw [size0487]; exact i.isLt⟩
  change (entry0487 i).check = true at h
  rcases fields0487 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0488 : OriginalRow227TriangleForward0488.entries.size = 32 := rfl

def entry0488 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0488.entries[i.val]'(by rw [size0488]; exact i.isLt)

theorem fields0488 (i : Fin 32) :
    (entry0488 i).IA = shift ∧ (entry0488 i).ID = S (96 + i.val + 1) ∧
      (entry0488 i).IC = S 33 ∧ (entry0488 i).Inext = T 32 (96 + i.val + 1) ∧
      (entry0488 i).Icur = T 32 (96 + i.val) ∧
      (entry0488 i).output = T 33 (96 + i.val) ∧
      (entry0488 i).charge = charge 32 (96 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0490_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0504_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0488 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (96 + i.val)) shift
      (S (96 + i.val + 1)) (S 33) (T 32 (96 + i.val + 1))
      (T 32 (96 + i.val)) (T 33 (96 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0488.entries OriginalRow227TriangleForward0488.checked
    ⟨i.val, by rw [size0488]; exact i.isLt⟩
  change (entry0488 i).check = true at h
  rcases fields0488 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0489 : OriginalRow227TriangleForward0489.entries.size = 32 := rfl

def entry0489 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0489.entries[i.val]'(by rw [size0489]; exact i.isLt)

theorem fields0489 (i : Fin 32) :
    (entry0489 i).IA = shift ∧ (entry0489 i).ID = S (128 + i.val + 1) ∧
      (entry0489 i).IC = S 33 ∧ (entry0489 i).Inext = T 32 (128 + i.val + 1) ∧
      (entry0489 i).Icur = T 32 (128 + i.val) ∧
      (entry0489 i).output = T 33 (128 + i.val) ∧
      (entry0489 i).charge = charge 32 (128 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0491_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0505_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0489 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (128 + i.val)) shift
      (S (128 + i.val + 1)) (S 33) (T 32 (128 + i.val + 1))
      (T 32 (128 + i.val)) (T 33 (128 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0489.entries OriginalRow227TriangleForward0489.checked
    ⟨i.val, by rw [size0489]; exact i.isLt⟩
  change (entry0489 i).check = true at h
  rcases fields0489 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0490 : OriginalRow227TriangleForward0490.entries.size = 32 := rfl

def entry0490 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0490.entries[i.val]'(by rw [size0490]; exact i.isLt)

theorem fields0490 (i : Fin 32) :
    (entry0490 i).IA = shift ∧ (entry0490 i).ID = S (160 + i.val + 1) ∧
      (entry0490 i).IC = S 33 ∧ (entry0490 i).Inext = T 32 (160 + i.val + 1) ∧
      (entry0490 i).Icur = T 32 (160 + i.val) ∧
      (entry0490 i).output = T 33 (160 + i.val) ∧
      (entry0490 i).charge = charge 32 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0492_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0506_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0490 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 33) (T 32 (160 + i.val + 1))
      (T 32 (160 + i.val)) (T 33 (160 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0490.entries OriginalRow227TriangleForward0490.checked
    ⟨i.val, by rw [size0490]; exact i.isLt⟩
  change (entry0490 i).check = true at h
  rcases fields0490 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0491 : OriginalRow227TriangleForward0491.entries.size = 32 := rfl

def entry0491 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0491.entries[i.val]'(by rw [size0491]; exact i.isLt)

theorem fields0491 (i : Fin 32) :
    (entry0491 i).IA = shift ∧ (entry0491 i).ID = S (192 + i.val + 1) ∧
      (entry0491 i).IC = S 33 ∧ (entry0491 i).Inext = T 32 (192 + i.val + 1) ∧
      (entry0491 i).Icur = T 32 (192 + i.val) ∧
      (entry0491 i).output = T 33 (192 + i.val) ∧
      (entry0491 i).charge = charge 32 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0493_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0507_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0491 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 33) (T 32 (192 + i.val + 1))
      (T 32 (192 + i.val)) (T 33 (192 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0491.entries OriginalRow227TriangleForward0491.checked
    ⟨i.val, by rw [size0491]; exact i.isLt⟩
  change (entry0491 i).check = true at h
  rcases fields0491 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0492 : OriginalRow227TriangleForward0492.entries.size = 32 := rfl

def entry0492 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0492.entries[i.val]'(by rw [size0492]; exact i.isLt)

theorem fields0492 (i : Fin 32) :
    (entry0492 i).IA = shift ∧ (entry0492 i).ID = S (224 + i.val + 1) ∧
      (entry0492 i).IC = S 33 ∧ (entry0492 i).Inext = T 32 (224 + i.val + 1) ∧
      (entry0492 i).Icur = T 32 (224 + i.val) ∧
      (entry0492 i).output = T 33 (224 + i.val) ∧
      (entry0492 i).charge = charge 32 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0494_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0508_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0492 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 33) (T 32 (224 + i.val + 1))
      (T 32 (224 + i.val)) (T 33 (224 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0492.entries OriginalRow227TriangleForward0492.checked
    ⟨i.val, by rw [size0492]; exact i.isLt⟩
  change (entry0492 i).check = true at h
  rcases fields0492 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0493 : OriginalRow227TriangleForward0493.entries.size = 32 := rfl

def entry0493 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0493.entries[i.val]'(by rw [size0493]; exact i.isLt)

theorem fields0493 (i : Fin 32) :
    (entry0493 i).IA = shift ∧ (entry0493 i).ID = S (256 + i.val + 1) ∧
      (entry0493 i).IC = S 33 ∧ (entry0493 i).Inext = T 32 (256 + i.val + 1) ∧
      (entry0493 i).Icur = T 32 (256 + i.val) ∧
      (entry0493 i).output = T 33 (256 + i.val) ∧
      (entry0493 i).charge = charge 32 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0495_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0509_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0493 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 33) (T 32 (256 + i.val + 1))
      (T 32 (256 + i.val)) (T 33 (256 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0493.entries OriginalRow227TriangleForward0493.checked
    ⟨i.val, by rw [size0493]; exact i.isLt⟩
  change (entry0493 i).check = true at h
  rcases fields0493 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0494 : OriginalRow227TriangleForward0494.entries.size = 32 := rfl

def entry0494 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0494.entries[i.val]'(by rw [size0494]; exact i.isLt)

theorem fields0494 (i : Fin 32) :
    (entry0494 i).IA = shift ∧ (entry0494 i).ID = S (288 + i.val + 1) ∧
      (entry0494 i).IC = S 33 ∧ (entry0494 i).Inext = T 32 (288 + i.val + 1) ∧
      (entry0494 i).Icur = T 32 (288 + i.val) ∧
      (entry0494 i).output = T 33 (288 + i.val) ∧
      (entry0494 i).charge = charge 32 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0496_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0510_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0494 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 33) (T 32 (288 + i.val + 1))
      (T 32 (288 + i.val)) (T 33 (288 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0494.entries OriginalRow227TriangleForward0494.checked
    ⟨i.val, by rw [size0494]; exact i.isLt⟩
  change (entry0494 i).check = true at h
  rcases fields0494 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0495 : OriginalRow227TriangleForward0495.entries.size = 32 := rfl

def entry0495 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0495.entries[i.val]'(by rw [size0495]; exact i.isLt)

theorem fields0495 (i : Fin 32) :
    (entry0495 i).IA = shift ∧ (entry0495 i).ID = S (320 + i.val + 1) ∧
      (entry0495 i).IC = S 33 ∧ (entry0495 i).Inext = T 32 (320 + i.val + 1) ∧
      (entry0495 i).Icur = T 32 (320 + i.val) ∧
      (entry0495 i).output = T 33 (320 + i.val) ∧
      (entry0495 i).charge = charge 32 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0497_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0511_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0495 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 33) (T 32 (320 + i.val + 1))
      (T 32 (320 + i.val)) (T 33 (320 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0495.entries OriginalRow227TriangleForward0495.checked
    ⟨i.val, by rw [size0495]; exact i.isLt⟩
  change (entry0495 i).check = true at h
  rcases fields0495 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0496 : OriginalRow227TriangleForward0496.entries.size = 32 := rfl

def entry0496 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0496.entries[i.val]'(by rw [size0496]; exact i.isLt)

theorem fields0496 (i : Fin 32) :
    (entry0496 i).IA = shift ∧ (entry0496 i).ID = S (352 + i.val + 1) ∧
      (entry0496 i).IC = S 33 ∧ (entry0496 i).Inext = T 32 (352 + i.val + 1) ∧
      (entry0496 i).Icur = T 32 (352 + i.val) ∧
      (entry0496 i).output = T 33 (352 + i.val) ∧
      (entry0496 i).charge = charge 32 (352 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0498_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0512_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0496 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (352 + i.val)) shift
      (S (352 + i.val + 1)) (S 33) (T 32 (352 + i.val + 1))
      (T 32 (352 + i.val)) (T 33 (352 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0496.entries OriginalRow227TriangleForward0496.checked
    ⟨i.val, by rw [size0496]; exact i.isLt⟩
  change (entry0496 i).check = true at h
  rcases fields0496 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0497 : OriginalRow227TriangleForward0497.entries.size = 32 := rfl

def entry0497 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0497.entries[i.val]'(by rw [size0497]; exact i.isLt)

theorem fields0497 (i : Fin 32) :
    (entry0497 i).IA = shift ∧ (entry0497 i).ID = S (384 + i.val + 1) ∧
      (entry0497 i).IC = S 33 ∧ (entry0497 i).Inext = T 32 (384 + i.val + 1) ∧
      (entry0497 i).Icur = T 32 (384 + i.val) ∧
      (entry0497 i).output = T 33 (384 + i.val) ∧
      (entry0497 i).charge = charge 32 (384 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0499_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0513_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0497 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (384 + i.val)) shift
      (S (384 + i.val + 1)) (S 33) (T 32 (384 + i.val + 1))
      (T 32 (384 + i.val)) (T 33 (384 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0497.entries OriginalRow227TriangleForward0497.checked
    ⟨i.val, by rw [size0497]; exact i.isLt⟩
  change (entry0497 i).check = true at h
  rcases fields0497 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0498 : OriginalRow227TriangleForward0498.entries.size = 32 := rfl

def entry0498 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0498.entries[i.val]'(by rw [size0498]; exact i.isLt)

theorem fields0498 (i : Fin 32) :
    (entry0498 i).IA = shift ∧ (entry0498 i).ID = S (416 + i.val + 1) ∧
      (entry0498 i).IC = S 33 ∧ (entry0498 i).Inext = T 32 (416 + i.val + 1) ∧
      (entry0498 i).Icur = T 32 (416 + i.val) ∧
      (entry0498 i).output = T 33 (416 + i.val) ∧
      (entry0498 i).charge = charge 32 (416 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0500_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0514_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0498 (i : Fin 32) :
    forwardStepOK (-768) (charge 32 (416 + i.val)) shift
      (S (416 + i.val + 1)) (S 33) (T 32 (416 + i.val + 1))
      (T 32 (416 + i.val)) (T 33 (416 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0498.entries OriginalRow227TriangleForward0498.checked
    ⟨i.val, by rw [size0498]; exact i.isLt⟩
  change (entry0498 i).check = true at h
  rcases fields0498 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0499 : OriginalRow227TriangleForward0499.entries.size = 21 := rfl

def entry0499 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0499.entries[i.val]'(by rw [size0499]; exact i.isLt)

theorem fields0499 (i : Fin 21) :
    (entry0499 i).IA = shift ∧ (entry0499 i).ID = S (448 + i.val + 1) ∧
      (entry0499 i).IC = S 33 ∧ (entry0499 i).Inext = T 32 (448 + i.val + 1) ∧
      (entry0499 i).Icur = T 32 (448 + i.val) ∧
      (entry0499 i).output = T 33 (448 + i.val) ∧
      (entry0499 i).charge = charge 32 (448 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root464).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root465).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root466).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root467).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root468).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root469).symm, (OriginalRow227RootBindings01.S_eq_root33).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow032.block0501_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow033.block0515_value ⟨20, by decide⟩).symm, rfl⟩

theorem step0499 (i : Fin 21) :
    forwardStepOK (-768) (charge 32 (448 + i.val)) shift
      (S (448 + i.val + 1)) (S 33) (T 32 (448 + i.val + 1))
      (T 32 (448 + i.val)) (T 33 (448 + i.val))
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0499.entries OriginalRow227TriangleForward0499.checked
    ⟨i.val, by rw [size0499]; exact i.isLt⟩
  change (entry0499 i).check = true at h
  rcases fields0499 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 32 ≤ d) (hhi : d < 469) :
    forwardStepOK (-768) (charge 32 d) shift (S (d + 1)) (S 33)
      (T 32 (d + 1)) (T 32 d) (T 33 d)
      (OriginalRow227Roots.root_pos 33 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 32 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h128 : d < 128
    ·
      by_cases h64 : d < 64
      ·
        have hi : d - 32 < 32 := by omega
        have heq : 32 + (d - 32) = d := by omega
        simpa only [heq] using step0486 ⟨d - 32, hi⟩
      ·
        by_cases h96 : d < 96
        ·
          have hi : d - 64 < 32 := by omega
          have heq : 64 + (d - 64) = d := by omega
          simpa only [heq] using step0487 ⟨d - 64, hi⟩
        ·
          have hi : d - 96 < 32 := by omega
          have heq : 96 + (d - 96) = d := by omega
          simpa only [heq] using step0488 ⟨d - 96, hi⟩
    ·
      by_cases h192 : d < 192
      ·
        by_cases h160 : d < 160
        ·
          have hi : d - 128 < 32 := by omega
          have heq : 128 + (d - 128) = d := by omega
          simpa only [heq] using step0489 ⟨d - 128, hi⟩
        ·
          have hi : d - 160 < 32 := by omega
          have heq : 160 + (d - 160) = d := by omega
          simpa only [heq] using step0490 ⟨d - 160, hi⟩
      ·
        by_cases h224 : d < 224
        ·
          have hi : d - 192 < 32 := by omega
          have heq : 192 + (d - 192) = d := by omega
          simpa only [heq] using step0491 ⟨d - 192, hi⟩
        ·
          have hi : d - 224 < 32 := by omega
          have heq : 224 + (d - 224) = d := by omega
          simpa only [heq] using step0492 ⟨d - 224, hi⟩
  ·
    by_cases h352 : d < 352
    ·
      by_cases h288 : d < 288
      ·
        have hi : d - 256 < 32 := by omega
        have heq : 256 + (d - 256) = d := by omega
        simpa only [heq] using step0493 ⟨d - 256, hi⟩
      ·
        by_cases h320 : d < 320
        ·
          have hi : d - 288 < 32 := by omega
          have heq : 288 + (d - 288) = d := by omega
          simpa only [heq] using step0494 ⟨d - 288, hi⟩
        ·
          have hi : d - 320 < 32 := by omega
          have heq : 320 + (d - 320) = d := by omega
          simpa only [heq] using step0495 ⟨d - 320, hi⟩
    ·
      by_cases h416 : d < 416
      ·
        by_cases h384 : d < 384
        ·
          have hi : d - 352 < 32 := by omega
          have heq : 352 + (d - 352) = d := by omega
          simpa only [heq] using step0496 ⟨d - 352, hi⟩
        ·
          have hi : d - 384 < 32 := by omega
          have heq : 384 + (d - 384) = d := by omega
          simpa only [heq] using step0497 ⟨d - 384, hi⟩
      ·
        by_cases h448 : d < 448
        ·
          have hi : d - 416 < 32 := by omega
          have heq : 416 + (d - 416) = d := by omega
          simpa only [heq] using step0498 ⟨d - 416, hi⟩
        ·
          have hi : d - 448 < 21 := by omega
          have heq : 448 + (d - 448) = d := by omega
          simpa only [heq] using step0499 ⟨d - 448, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0486,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0486,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0487,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0487,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0488,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0488,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0489,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0489,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0490,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0490,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0491,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0491,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0492,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0492,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0493,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0493,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0494,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0494,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0495,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0495,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0496,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0496,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0497,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0497,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0498,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0498,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.fields0499,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.step0499,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow033
