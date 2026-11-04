import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow038
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039
import Grothe.UpperChaos.OriginalRow227TriangleForward0570
import Grothe.UpperChaos.OriginalRow227TriangleForward0571
import Grothe.UpperChaos.OriginalRow227TriangleForward0572
import Grothe.UpperChaos.OriginalRow227TriangleForward0573
import Grothe.UpperChaos.OriginalRow227TriangleForward0574
import Grothe.UpperChaos.OriginalRow227TriangleForward0575
import Grothe.UpperChaos.OriginalRow227TriangleForward0576
import Grothe.UpperChaos.OriginalRow227TriangleForward0577
import Grothe.UpperChaos.OriginalRow227TriangleForward0578
import Grothe.UpperChaos.OriginalRow227TriangleForward0579
import Grothe.UpperChaos.OriginalRow227TriangleForward0580
import Grothe.UpperChaos.OriginalRow227TriangleForward0581
import Grothe.UpperChaos.OriginalRow227TriangleForward0582
import Grothe.UpperChaos.OriginalRow227TriangleForward0583

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0570 : OriginalRow227TriangleForward0570.entries.size = 32 := rfl

def entry0570 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0570.entries[i.val]'(by rw [size0570]; exact i.isLt)

theorem fields0570 (i : Fin 32) :
    (entry0570 i).IA = shift ∧ (entry0570 i).ID = S (38 + i.val + 1) ∧
      (entry0570 i).IC = S 39 ∧ (entry0570 i).Inext = T 38 (38 + i.val + 1) ∧
      (entry0570 i).Icur = T 38 (38 + i.val) ∧
      (entry0570 i).output = T 39 (38 + i.val) ∧
      (entry0570 i).charge = charge 38 (38 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root39).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0572_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0570 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (38 + i.val)) shift
      (S (38 + i.val + 1)) (S 39) (T 38 (38 + i.val + 1))
      (T 38 (38 + i.val)) (T 39 (38 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0570.entries OriginalRow227TriangleForward0570.checked
    ⟨i.val, by rw [size0570]; exact i.isLt⟩
  change (entry0570 i).check = true at h
  rcases fields0570 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0571 : OriginalRow227TriangleForward0571.entries.size = 32 := rfl

def entry0571 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0571.entries[i.val]'(by rw [size0571]; exact i.isLt)

theorem fields0571 (i : Fin 32) :
    (entry0571 i).IA = shift ∧ (entry0571 i).ID = S (70 + i.val + 1) ∧
      (entry0571 i).IC = S 39 ∧ (entry0571 i).Inext = T 38 (70 + i.val + 1) ∧
      (entry0571 i).Icur = T 38 (70 + i.val) ∧
      (entry0571 i).output = T 39 (70 + i.val) ∧
      (entry0571 i).charge = charge 38 (70 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0573_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0571 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (70 + i.val)) shift
      (S (70 + i.val + 1)) (S 39) (T 38 (70 + i.val + 1))
      (T 38 (70 + i.val)) (T 39 (70 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0571.entries OriginalRow227TriangleForward0571.checked
    ⟨i.val, by rw [size0571]; exact i.isLt⟩
  change (entry0571 i).check = true at h
  rcases fields0571 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0572 : OriginalRow227TriangleForward0572.entries.size = 32 := rfl

def entry0572 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0572.entries[i.val]'(by rw [size0572]; exact i.isLt)

theorem fields0572 (i : Fin 32) :
    (entry0572 i).IA = shift ∧ (entry0572 i).ID = S (102 + i.val + 1) ∧
      (entry0572 i).IC = S 39 ∧ (entry0572 i).Inext = T 38 (102 + i.val + 1) ∧
      (entry0572 i).Icur = T 38 (102 + i.val) ∧
      (entry0572 i).output = T 39 (102 + i.val) ∧
      (entry0572 i).charge = charge 38 (102 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0574_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0572 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (102 + i.val)) shift
      (S (102 + i.val + 1)) (S 39) (T 38 (102 + i.val + 1))
      (T 38 (102 + i.val)) (T 39 (102 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0572.entries OriginalRow227TriangleForward0572.checked
    ⟨i.val, by rw [size0572]; exact i.isLt⟩
  change (entry0572 i).check = true at h
  rcases fields0572 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0573 : OriginalRow227TriangleForward0573.entries.size = 32 := rfl

def entry0573 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0573.entries[i.val]'(by rw [size0573]; exact i.isLt)

theorem fields0573 (i : Fin 32) :
    (entry0573 i).IA = shift ∧ (entry0573 i).ID = S (134 + i.val + 1) ∧
      (entry0573 i).IC = S 39 ∧ (entry0573 i).Inext = T 38 (134 + i.val + 1) ∧
      (entry0573 i).Icur = T 38 (134 + i.val) ∧
      (entry0573 i).output = T 39 (134 + i.val) ∧
      (entry0573 i).charge = charge 38 (134 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0575_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0573 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (134 + i.val)) shift
      (S (134 + i.val + 1)) (S 39) (T 38 (134 + i.val + 1))
      (T 38 (134 + i.val)) (T 39 (134 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0573.entries OriginalRow227TriangleForward0573.checked
    ⟨i.val, by rw [size0573]; exact i.isLt⟩
  change (entry0573 i).check = true at h
  rcases fields0573 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0574 : OriginalRow227TriangleForward0574.entries.size = 32 := rfl

def entry0574 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0574.entries[i.val]'(by rw [size0574]; exact i.isLt)

theorem fields0574 (i : Fin 32) :
    (entry0574 i).IA = shift ∧ (entry0574 i).ID = S (166 + i.val + 1) ∧
      (entry0574 i).IC = S 39 ∧ (entry0574 i).Inext = T 38 (166 + i.val + 1) ∧
      (entry0574 i).Icur = T 38 (166 + i.val) ∧
      (entry0574 i).output = T 39 (166 + i.val) ∧
      (entry0574 i).charge = charge 38 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0576_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0574 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 39) (T 38 (166 + i.val + 1))
      (T 38 (166 + i.val)) (T 39 (166 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0574.entries OriginalRow227TriangleForward0574.checked
    ⟨i.val, by rw [size0574]; exact i.isLt⟩
  change (entry0574 i).check = true at h
  rcases fields0574 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0575 : OriginalRow227TriangleForward0575.entries.size = 32 := rfl

def entry0575 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0575.entries[i.val]'(by rw [size0575]; exact i.isLt)

theorem fields0575 (i : Fin 32) :
    (entry0575 i).IA = shift ∧ (entry0575 i).ID = S (198 + i.val + 1) ∧
      (entry0575 i).IC = S 39 ∧ (entry0575 i).Inext = T 38 (198 + i.val + 1) ∧
      (entry0575 i).Icur = T 38 (198 + i.val) ∧
      (entry0575 i).output = T 39 (198 + i.val) ∧
      (entry0575 i).charge = charge 38 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0577_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0575 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 39) (T 38 (198 + i.val + 1))
      (T 38 (198 + i.val)) (T 39 (198 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0575.entries OriginalRow227TriangleForward0575.checked
    ⟨i.val, by rw [size0575]; exact i.isLt⟩
  change (entry0575 i).check = true at h
  rcases fields0575 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0576 : OriginalRow227TriangleForward0576.entries.size = 32 := rfl

def entry0576 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0576.entries[i.val]'(by rw [size0576]; exact i.isLt)

theorem fields0576 (i : Fin 32) :
    (entry0576 i).IA = shift ∧ (entry0576 i).ID = S (230 + i.val + 1) ∧
      (entry0576 i).IC = S 39 ∧ (entry0576 i).Inext = T 38 (230 + i.val + 1) ∧
      (entry0576 i).Icur = T 38 (230 + i.val) ∧
      (entry0576 i).output = T 39 (230 + i.val) ∧
      (entry0576 i).charge = charge 38 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0578_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0576 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 39) (T 38 (230 + i.val + 1))
      (T 38 (230 + i.val)) (T 39 (230 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0576.entries OriginalRow227TriangleForward0576.checked
    ⟨i.val, by rw [size0576]; exact i.isLt⟩
  change (entry0576 i).check = true at h
  rcases fields0576 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0577 : OriginalRow227TriangleForward0577.entries.size = 32 := rfl

def entry0577 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0577.entries[i.val]'(by rw [size0577]; exact i.isLt)

theorem fields0577 (i : Fin 32) :
    (entry0577 i).IA = shift ∧ (entry0577 i).ID = S (262 + i.val + 1) ∧
      (entry0577 i).IC = S 39 ∧ (entry0577 i).Inext = T 38 (262 + i.val + 1) ∧
      (entry0577 i).Icur = T 38 (262 + i.val) ∧
      (entry0577 i).output = T 39 (262 + i.val) ∧
      (entry0577 i).charge = charge 38 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0579_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0577 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 39) (T 38 (262 + i.val + 1))
      (T 38 (262 + i.val)) (T 39 (262 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0577.entries OriginalRow227TriangleForward0577.checked
    ⟨i.val, by rw [size0577]; exact i.isLt⟩
  change (entry0577 i).check = true at h
  rcases fields0577 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0578 : OriginalRow227TriangleForward0578.entries.size = 32 := rfl

def entry0578 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0578.entries[i.val]'(by rw [size0578]; exact i.isLt)

theorem fields0578 (i : Fin 32) :
    (entry0578 i).IA = shift ∧ (entry0578 i).ID = S (294 + i.val + 1) ∧
      (entry0578 i).IC = S 39 ∧ (entry0578 i).Inext = T 38 (294 + i.val + 1) ∧
      (entry0578 i).Icur = T 38 (294 + i.val) ∧
      (entry0578 i).output = T 39 (294 + i.val) ∧
      (entry0578 i).charge = charge 38 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0580_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0578 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 39) (T 38 (294 + i.val + 1))
      (T 38 (294 + i.val)) (T 39 (294 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0578.entries OriginalRow227TriangleForward0578.checked
    ⟨i.val, by rw [size0578]; exact i.isLt⟩
  change (entry0578 i).check = true at h
  rcases fields0578 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0579 : OriginalRow227TriangleForward0579.entries.size = 32 := rfl

def entry0579 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0579.entries[i.val]'(by rw [size0579]; exact i.isLt)

theorem fields0579 (i : Fin 32) :
    (entry0579 i).IA = shift ∧ (entry0579 i).ID = S (326 + i.val + 1) ∧
      (entry0579 i).IC = S 39 ∧ (entry0579 i).Inext = T 38 (326 + i.val + 1) ∧
      (entry0579 i).Icur = T 38 (326 + i.val) ∧
      (entry0579 i).output = T 39 (326 + i.val) ∧
      (entry0579 i).charge = charge 38 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0581_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0579 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 39) (T 38 (326 + i.val + 1))
      (T 38 (326 + i.val)) (T 39 (326 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0579.entries OriginalRow227TriangleForward0579.checked
    ⟨i.val, by rw [size0579]; exact i.isLt⟩
  change (entry0579 i).check = true at h
  rcases fields0579 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0580 : OriginalRow227TriangleForward0580.entries.size = 32 := rfl

def entry0580 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0580.entries[i.val]'(by rw [size0580]; exact i.isLt)

theorem fields0580 (i : Fin 32) :
    (entry0580 i).IA = shift ∧ (entry0580 i).ID = S (358 + i.val + 1) ∧
      (entry0580 i).IC = S 39 ∧ (entry0580 i).Inext = T 38 (358 + i.val + 1) ∧
      (entry0580 i).Icur = T 38 (358 + i.val) ∧
      (entry0580 i).output = T 39 (358 + i.val) ∧
      (entry0580 i).charge = charge 38 (358 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0582_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0580 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (358 + i.val)) shift
      (S (358 + i.val + 1)) (S 39) (T 38 (358 + i.val + 1))
      (T 38 (358 + i.val)) (T 39 (358 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0580.entries OriginalRow227TriangleForward0580.checked
    ⟨i.val, by rw [size0580]; exact i.isLt⟩
  change (entry0580 i).check = true at h
  rcases fields0580 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0581 : OriginalRow227TriangleForward0581.entries.size = 32 := rfl

def entry0581 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0581.entries[i.val]'(by rw [size0581]; exact i.isLt)

theorem fields0581 (i : Fin 32) :
    (entry0581 i).IA = shift ∧ (entry0581 i).ID = S (390 + i.val + 1) ∧
      (entry0581 i).IC = S 39 ∧ (entry0581 i).Inext = T 38 (390 + i.val + 1) ∧
      (entry0581 i).Icur = T 38 (390 + i.val) ∧
      (entry0581 i).output = T 39 (390 + i.val) ∧
      (entry0581 i).charge = charge 38 (390 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0583_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0581 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (390 + i.val)) shift
      (S (390 + i.val + 1)) (S 39) (T 38 (390 + i.val + 1))
      (T 38 (390 + i.val)) (T 39 (390 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0581.entries OriginalRow227TriangleForward0581.checked
    ⟨i.val, by rw [size0581]; exact i.isLt⟩
  change (entry0581 i).check = true at h
  rcases fields0581 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0582 : OriginalRow227TriangleForward0582.entries.size = 32 := rfl

def entry0582 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0582.entries[i.val]'(by rw [size0582]; exact i.isLt)

theorem fields0582 (i : Fin 32) :
    (entry0582 i).IA = shift ∧ (entry0582 i).ID = S (422 + i.val + 1) ∧
      (entry0582 i).IC = S 39 ∧ (entry0582 i).Inext = T 38 (422 + i.val + 1) ∧
      (entry0582 i).Icur = T 38 (422 + i.val) ∧
      (entry0582 i).output = T 39 (422 + i.val) ∧
      (entry0582 i).charge = charge 38 (422 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0584_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0582 (i : Fin 32) :
    forwardStepOK (-768) (charge 38 (422 + i.val)) shift
      (S (422 + i.val + 1)) (S 39) (T 38 (422 + i.val + 1))
      (T 38 (422 + i.val)) (T 39 (422 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0582.entries OriginalRow227TriangleForward0582.checked
    ⟨i.val, by rw [size0582]; exact i.isLt⟩
  change (entry0582 i).check = true at h
  rcases fields0582 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0583 : OriginalRow227TriangleForward0583.entries.size = 9 := rfl

def entry0583 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0583.entries[i.val]'(by rw [size0583]; exact i.isLt)

theorem fields0583 (i : Fin 9) :
    (entry0583 i).IA = shift ∧ (entry0583 i).ID = S (454 + i.val + 1) ∧
      (entry0583 i).IC = S 39 ∧ (entry0583 i).Inext = T 38 (454 + i.val + 1) ∧
      (entry0583 i).Icur = T 38 (454 + i.val) ∧
      (entry0583 i).output = T 39 (454 + i.val) ∧
      (entry0583 i).charge = charge 38 (454 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root463).symm, (OriginalRow227RootBindings01.S_eq_root39).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow038.block0585_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨8, by decide⟩).symm, rfl⟩

theorem step0583 (i : Fin 9) :
    forwardStepOK (-768) (charge 38 (454 + i.val)) shift
      (S (454 + i.val + 1)) (S 39) (T 38 (454 + i.val + 1))
      (T 38 (454 + i.val)) (T 39 (454 + i.val))
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0583.entries OriginalRow227TriangleForward0583.checked
    ⟨i.val, by rw [size0583]; exact i.isLt⟩
  change (entry0583 i).check = true at h
  rcases fields0583 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 38 ≤ d) (hhi : d < 463) :
    forwardStepOK (-768) (charge 38 d) shift (S (d + 1)) (S 39)
      (T 38 (d + 1)) (T 38 d) (T 39 d)
      (OriginalRow227Roots.root_pos 39 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 38 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h134 : d < 134
    ·
      by_cases h70 : d < 70
      ·
        have hi : d - 38 < 32 := by omega
        have heq : 38 + (d - 38) = d := by omega
        simpa only [heq] using step0570 ⟨d - 38, hi⟩
      ·
        by_cases h102 : d < 102
        ·
          have hi : d - 70 < 32 := by omega
          have heq : 70 + (d - 70) = d := by omega
          simpa only [heq] using step0571 ⟨d - 70, hi⟩
        ·
          have hi : d - 102 < 32 := by omega
          have heq : 102 + (d - 102) = d := by omega
          simpa only [heq] using step0572 ⟨d - 102, hi⟩
    ·
      by_cases h198 : d < 198
      ·
        by_cases h166 : d < 166
        ·
          have hi : d - 134 < 32 := by omega
          have heq : 134 + (d - 134) = d := by omega
          simpa only [heq] using step0573 ⟨d - 134, hi⟩
        ·
          have hi : d - 166 < 32 := by omega
          have heq : 166 + (d - 166) = d := by omega
          simpa only [heq] using step0574 ⟨d - 166, hi⟩
      ·
        by_cases h230 : d < 230
        ·
          have hi : d - 198 < 32 := by omega
          have heq : 198 + (d - 198) = d := by omega
          simpa only [heq] using step0575 ⟨d - 198, hi⟩
        ·
          have hi : d - 230 < 32 := by omega
          have heq : 230 + (d - 230) = d := by omega
          simpa only [heq] using step0576 ⟨d - 230, hi⟩
  ·
    by_cases h358 : d < 358
    ·
      by_cases h294 : d < 294
      ·
        have hi : d - 262 < 32 := by omega
        have heq : 262 + (d - 262) = d := by omega
        simpa only [heq] using step0577 ⟨d - 262, hi⟩
      ·
        by_cases h326 : d < 326
        ·
          have hi : d - 294 < 32 := by omega
          have heq : 294 + (d - 294) = d := by omega
          simpa only [heq] using step0578 ⟨d - 294, hi⟩
        ·
          have hi : d - 326 < 32 := by omega
          have heq : 326 + (d - 326) = d := by omega
          simpa only [heq] using step0579 ⟨d - 326, hi⟩
    ·
      by_cases h422 : d < 422
      ·
        by_cases h390 : d < 390
        ·
          have hi : d - 358 < 32 := by omega
          have heq : 358 + (d - 358) = d := by omega
          simpa only [heq] using step0580 ⟨d - 358, hi⟩
        ·
          have hi : d - 390 < 32 := by omega
          have heq : 390 + (d - 390) = d := by omega
          simpa only [heq] using step0581 ⟨d - 390, hi⟩
      ·
        by_cases h454 : d < 454
        ·
          have hi : d - 422 < 32 := by omega
          have heq : 422 + (d - 422) = d := by omega
          simpa only [heq] using step0582 ⟨d - 422, hi⟩
        ·
          have hi : d - 454 < 9 := by omega
          have heq : 454 + (d - 454) = d := by omega
          simpa only [heq] using step0583 ⟨d - 454, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0570,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0570,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0571,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0571,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0572,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0572,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0573,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0573,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0574,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0574,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0575,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0575,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0576,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0576,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0577,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0577,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0578,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0578,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0579,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0579,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0580,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0580,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0581,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0581,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0582,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0582,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.fields0583,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.step0583,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow039
