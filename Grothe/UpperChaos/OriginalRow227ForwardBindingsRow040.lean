import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow039
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040
import Grothe.UpperChaos.OriginalRow227TriangleForward0584
import Grothe.UpperChaos.OriginalRow227TriangleForward0585
import Grothe.UpperChaos.OriginalRow227TriangleForward0586
import Grothe.UpperChaos.OriginalRow227TriangleForward0587
import Grothe.UpperChaos.OriginalRow227TriangleForward0588
import Grothe.UpperChaos.OriginalRow227TriangleForward0589
import Grothe.UpperChaos.OriginalRow227TriangleForward0590
import Grothe.UpperChaos.OriginalRow227TriangleForward0591
import Grothe.UpperChaos.OriginalRow227TriangleForward0592
import Grothe.UpperChaos.OriginalRow227TriangleForward0593
import Grothe.UpperChaos.OriginalRow227TriangleForward0594
import Grothe.UpperChaos.OriginalRow227TriangleForward0595
import Grothe.UpperChaos.OriginalRow227TriangleForward0596
import Grothe.UpperChaos.OriginalRow227TriangleForward0597

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0584 : OriginalRow227TriangleForward0584.entries.size = 32 := rfl

def entry0584 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0584.entries[i.val]'(by rw [size0584]; exact i.isLt)

theorem fields0584 (i : Fin 32) :
    (entry0584 i).IA = shift ∧ (entry0584 i).ID = S (39 + i.val + 1) ∧
      (entry0584 i).IC = S 40 ∧ (entry0584 i).Inext = T 39 (39 + i.val + 1) ∧
      (entry0584 i).Icur = T 39 (39 + i.val) ∧
      (entry0584 i).output = T 40 (39 + i.val) ∧
      (entry0584 i).charge = charge 39 (39 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root40).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0586_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0584 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (39 + i.val)) shift
      (S (39 + i.val + 1)) (S 40) (T 39 (39 + i.val + 1))
      (T 39 (39 + i.val)) (T 40 (39 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0584.entries OriginalRow227TriangleForward0584.checked
    ⟨i.val, by rw [size0584]; exact i.isLt⟩
  change (entry0584 i).check = true at h
  rcases fields0584 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0585 : OriginalRow227TriangleForward0585.entries.size = 32 := rfl

def entry0585 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0585.entries[i.val]'(by rw [size0585]; exact i.isLt)

theorem fields0585 (i : Fin 32) :
    (entry0585 i).IA = shift ∧ (entry0585 i).ID = S (71 + i.val + 1) ∧
      (entry0585 i).IC = S 40 ∧ (entry0585 i).Inext = T 39 (71 + i.val + 1) ∧
      (entry0585 i).Icur = T 39 (71 + i.val) ∧
      (entry0585 i).output = T 40 (71 + i.val) ∧
      (entry0585 i).charge = charge 39 (71 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0587_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0585 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (71 + i.val)) shift
      (S (71 + i.val + 1)) (S 40) (T 39 (71 + i.val + 1))
      (T 39 (71 + i.val)) (T 40 (71 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0585.entries OriginalRow227TriangleForward0585.checked
    ⟨i.val, by rw [size0585]; exact i.isLt⟩
  change (entry0585 i).check = true at h
  rcases fields0585 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0586 : OriginalRow227TriangleForward0586.entries.size = 32 := rfl

def entry0586 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0586.entries[i.val]'(by rw [size0586]; exact i.isLt)

theorem fields0586 (i : Fin 32) :
    (entry0586 i).IA = shift ∧ (entry0586 i).ID = S (103 + i.val + 1) ∧
      (entry0586 i).IC = S 40 ∧ (entry0586 i).Inext = T 39 (103 + i.val + 1) ∧
      (entry0586 i).Icur = T 39 (103 + i.val) ∧
      (entry0586 i).output = T 40 (103 + i.val) ∧
      (entry0586 i).charge = charge 39 (103 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0588_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0586 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (103 + i.val)) shift
      (S (103 + i.val + 1)) (S 40) (T 39 (103 + i.val + 1))
      (T 39 (103 + i.val)) (T 40 (103 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0586.entries OriginalRow227TriangleForward0586.checked
    ⟨i.val, by rw [size0586]; exact i.isLt⟩
  change (entry0586 i).check = true at h
  rcases fields0586 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0587 : OriginalRow227TriangleForward0587.entries.size = 32 := rfl

def entry0587 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0587.entries[i.val]'(by rw [size0587]; exact i.isLt)

theorem fields0587 (i : Fin 32) :
    (entry0587 i).IA = shift ∧ (entry0587 i).ID = S (135 + i.val + 1) ∧
      (entry0587 i).IC = S 40 ∧ (entry0587 i).Inext = T 39 (135 + i.val + 1) ∧
      (entry0587 i).Icur = T 39 (135 + i.val) ∧
      (entry0587 i).output = T 40 (135 + i.val) ∧
      (entry0587 i).charge = charge 39 (135 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0589_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0587 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (135 + i.val)) shift
      (S (135 + i.val + 1)) (S 40) (T 39 (135 + i.val + 1))
      (T 39 (135 + i.val)) (T 40 (135 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0587.entries OriginalRow227TriangleForward0587.checked
    ⟨i.val, by rw [size0587]; exact i.isLt⟩
  change (entry0587 i).check = true at h
  rcases fields0587 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0588 : OriginalRow227TriangleForward0588.entries.size = 32 := rfl

def entry0588 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0588.entries[i.val]'(by rw [size0588]; exact i.isLt)

theorem fields0588 (i : Fin 32) :
    (entry0588 i).IA = shift ∧ (entry0588 i).ID = S (167 + i.val + 1) ∧
      (entry0588 i).IC = S 40 ∧ (entry0588 i).Inext = T 39 (167 + i.val + 1) ∧
      (entry0588 i).Icur = T 39 (167 + i.val) ∧
      (entry0588 i).output = T 40 (167 + i.val) ∧
      (entry0588 i).charge = charge 39 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0590_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0588 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 40) (T 39 (167 + i.val + 1))
      (T 39 (167 + i.val)) (T 40 (167 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0588.entries OriginalRow227TriangleForward0588.checked
    ⟨i.val, by rw [size0588]; exact i.isLt⟩
  change (entry0588 i).check = true at h
  rcases fields0588 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0589 : OriginalRow227TriangleForward0589.entries.size = 32 := rfl

def entry0589 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0589.entries[i.val]'(by rw [size0589]; exact i.isLt)

theorem fields0589 (i : Fin 32) :
    (entry0589 i).IA = shift ∧ (entry0589 i).ID = S (199 + i.val + 1) ∧
      (entry0589 i).IC = S 40 ∧ (entry0589 i).Inext = T 39 (199 + i.val + 1) ∧
      (entry0589 i).Icur = T 39 (199 + i.val) ∧
      (entry0589 i).output = T 40 (199 + i.val) ∧
      (entry0589 i).charge = charge 39 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0591_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0589 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 40) (T 39 (199 + i.val + 1))
      (T 39 (199 + i.val)) (T 40 (199 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0589.entries OriginalRow227TriangleForward0589.checked
    ⟨i.val, by rw [size0589]; exact i.isLt⟩
  change (entry0589 i).check = true at h
  rcases fields0589 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0590 : OriginalRow227TriangleForward0590.entries.size = 32 := rfl

def entry0590 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0590.entries[i.val]'(by rw [size0590]; exact i.isLt)

theorem fields0590 (i : Fin 32) :
    (entry0590 i).IA = shift ∧ (entry0590 i).ID = S (231 + i.val + 1) ∧
      (entry0590 i).IC = S 40 ∧ (entry0590 i).Inext = T 39 (231 + i.val + 1) ∧
      (entry0590 i).Icur = T 39 (231 + i.val) ∧
      (entry0590 i).output = T 40 (231 + i.val) ∧
      (entry0590 i).charge = charge 39 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0592_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0590 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 40) (T 39 (231 + i.val + 1))
      (T 39 (231 + i.val)) (T 40 (231 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0590.entries OriginalRow227TriangleForward0590.checked
    ⟨i.val, by rw [size0590]; exact i.isLt⟩
  change (entry0590 i).check = true at h
  rcases fields0590 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0591 : OriginalRow227TriangleForward0591.entries.size = 32 := rfl

def entry0591 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0591.entries[i.val]'(by rw [size0591]; exact i.isLt)

theorem fields0591 (i : Fin 32) :
    (entry0591 i).IA = shift ∧ (entry0591 i).ID = S (263 + i.val + 1) ∧
      (entry0591 i).IC = S 40 ∧ (entry0591 i).Inext = T 39 (263 + i.val + 1) ∧
      (entry0591 i).Icur = T 39 (263 + i.val) ∧
      (entry0591 i).output = T 40 (263 + i.val) ∧
      (entry0591 i).charge = charge 39 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0593_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0591 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 40) (T 39 (263 + i.val + 1))
      (T 39 (263 + i.val)) (T 40 (263 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0591.entries OriginalRow227TriangleForward0591.checked
    ⟨i.val, by rw [size0591]; exact i.isLt⟩
  change (entry0591 i).check = true at h
  rcases fields0591 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0592 : OriginalRow227TriangleForward0592.entries.size = 32 := rfl

def entry0592 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0592.entries[i.val]'(by rw [size0592]; exact i.isLt)

theorem fields0592 (i : Fin 32) :
    (entry0592 i).IA = shift ∧ (entry0592 i).ID = S (295 + i.val + 1) ∧
      (entry0592 i).IC = S 40 ∧ (entry0592 i).Inext = T 39 (295 + i.val + 1) ∧
      (entry0592 i).Icur = T 39 (295 + i.val) ∧
      (entry0592 i).output = T 40 (295 + i.val) ∧
      (entry0592 i).charge = charge 39 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0594_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0592 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 40) (T 39 (295 + i.val + 1))
      (T 39 (295 + i.val)) (T 40 (295 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0592.entries OriginalRow227TriangleForward0592.checked
    ⟨i.val, by rw [size0592]; exact i.isLt⟩
  change (entry0592 i).check = true at h
  rcases fields0592 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0593 : OriginalRow227TriangleForward0593.entries.size = 32 := rfl

def entry0593 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0593.entries[i.val]'(by rw [size0593]; exact i.isLt)

theorem fields0593 (i : Fin 32) :
    (entry0593 i).IA = shift ∧ (entry0593 i).ID = S (327 + i.val + 1) ∧
      (entry0593 i).IC = S 40 ∧ (entry0593 i).Inext = T 39 (327 + i.val + 1) ∧
      (entry0593 i).Icur = T 39 (327 + i.val) ∧
      (entry0593 i).output = T 40 (327 + i.val) ∧
      (entry0593 i).charge = charge 39 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0595_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0593 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 40) (T 39 (327 + i.val + 1))
      (T 39 (327 + i.val)) (T 40 (327 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0593.entries OriginalRow227TriangleForward0593.checked
    ⟨i.val, by rw [size0593]; exact i.isLt⟩
  change (entry0593 i).check = true at h
  rcases fields0593 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0594 : OriginalRow227TriangleForward0594.entries.size = 32 := rfl

def entry0594 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0594.entries[i.val]'(by rw [size0594]; exact i.isLt)

theorem fields0594 (i : Fin 32) :
    (entry0594 i).IA = shift ∧ (entry0594 i).ID = S (359 + i.val + 1) ∧
      (entry0594 i).IC = S 40 ∧ (entry0594 i).Inext = T 39 (359 + i.val + 1) ∧
      (entry0594 i).Icur = T 39 (359 + i.val) ∧
      (entry0594 i).output = T 40 (359 + i.val) ∧
      (entry0594 i).charge = charge 39 (359 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0596_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0594 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (359 + i.val)) shift
      (S (359 + i.val + 1)) (S 40) (T 39 (359 + i.val + 1))
      (T 39 (359 + i.val)) (T 40 (359 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0594.entries OriginalRow227TriangleForward0594.checked
    ⟨i.val, by rw [size0594]; exact i.isLt⟩
  change (entry0594 i).check = true at h
  rcases fields0594 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0595 : OriginalRow227TriangleForward0595.entries.size = 32 := rfl

def entry0595 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0595.entries[i.val]'(by rw [size0595]; exact i.isLt)

theorem fields0595 (i : Fin 32) :
    (entry0595 i).IA = shift ∧ (entry0595 i).ID = S (391 + i.val + 1) ∧
      (entry0595 i).IC = S 40 ∧ (entry0595 i).Inext = T 39 (391 + i.val + 1) ∧
      (entry0595 i).Icur = T 39 (391 + i.val) ∧
      (entry0595 i).output = T 40 (391 + i.val) ∧
      (entry0595 i).charge = charge 39 (391 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0597_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0595 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (391 + i.val)) shift
      (S (391 + i.val + 1)) (S 40) (T 39 (391 + i.val + 1))
      (T 39 (391 + i.val)) (T 40 (391 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0595.entries OriginalRow227TriangleForward0595.checked
    ⟨i.val, by rw [size0595]; exact i.isLt⟩
  change (entry0595 i).check = true at h
  rcases fields0595 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0596 : OriginalRow227TriangleForward0596.entries.size = 32 := rfl

def entry0596 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0596.entries[i.val]'(by rw [size0596]; exact i.isLt)

theorem fields0596 (i : Fin 32) :
    (entry0596 i).IA = shift ∧ (entry0596 i).ID = S (423 + i.val + 1) ∧
      (entry0596 i).IC = S 40 ∧ (entry0596 i).Inext = T 39 (423 + i.val + 1) ∧
      (entry0596 i).Icur = T 39 (423 + i.val) ∧
      (entry0596 i).output = T 40 (423 + i.val) ∧
      (entry0596 i).charge = charge 39 (423 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0598_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0596 (i : Fin 32) :
    forwardStepOK (-768) (charge 39 (423 + i.val)) shift
      (S (423 + i.val + 1)) (S 40) (T 39 (423 + i.val + 1))
      (T 39 (423 + i.val)) (T 40 (423 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0596.entries OriginalRow227TriangleForward0596.checked
    ⟨i.val, by rw [size0596]; exact i.isLt⟩
  change (entry0596 i).check = true at h
  rcases fields0596 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0597 : OriginalRow227TriangleForward0597.entries.size = 7 := rfl

def entry0597 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0597.entries[i.val]'(by rw [size0597]; exact i.isLt)

theorem fields0597 (i : Fin 7) :
    (entry0597 i).IA = shift ∧ (entry0597 i).ID = S (455 + i.val + 1) ∧
      (entry0597 i).IC = S 40 ∧ (entry0597 i).Inext = T 39 (455 + i.val + 1) ∧
      (entry0597 i).Icur = T 39 (455 + i.val) ∧
      (entry0597 i).output = T 40 (455 + i.val) ∧
      (entry0597 i).charge = charge 39 (455 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root462).symm, (OriginalRow227RootBindings01.S_eq_root40).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow039.block0599_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨6, by decide⟩).symm, rfl⟩

theorem step0597 (i : Fin 7) :
    forwardStepOK (-768) (charge 39 (455 + i.val)) shift
      (S (455 + i.val + 1)) (S 40) (T 39 (455 + i.val + 1))
      (T 39 (455 + i.val)) (T 40 (455 + i.val))
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0597.entries OriginalRow227TriangleForward0597.checked
    ⟨i.val, by rw [size0597]; exact i.isLt⟩
  change (entry0597 i).check = true at h
  rcases fields0597 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 39 ≤ d) (hhi : d < 462) :
    forwardStepOK (-768) (charge 39 d) shift (S (d + 1)) (S 40)
      (T 39 (d + 1)) (T 39 d) (T 40 d)
      (OriginalRow227Roots.root_pos 40 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 39 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h135 : d < 135
    ·
      by_cases h71 : d < 71
      ·
        have hi : d - 39 < 32 := by omega
        have heq : 39 + (d - 39) = d := by omega
        simpa only [heq] using step0584 ⟨d - 39, hi⟩
      ·
        by_cases h103 : d < 103
        ·
          have hi : d - 71 < 32 := by omega
          have heq : 71 + (d - 71) = d := by omega
          simpa only [heq] using step0585 ⟨d - 71, hi⟩
        ·
          have hi : d - 103 < 32 := by omega
          have heq : 103 + (d - 103) = d := by omega
          simpa only [heq] using step0586 ⟨d - 103, hi⟩
    ·
      by_cases h199 : d < 199
      ·
        by_cases h167 : d < 167
        ·
          have hi : d - 135 < 32 := by omega
          have heq : 135 + (d - 135) = d := by omega
          simpa only [heq] using step0587 ⟨d - 135, hi⟩
        ·
          have hi : d - 167 < 32 := by omega
          have heq : 167 + (d - 167) = d := by omega
          simpa only [heq] using step0588 ⟨d - 167, hi⟩
      ·
        by_cases h231 : d < 231
        ·
          have hi : d - 199 < 32 := by omega
          have heq : 199 + (d - 199) = d := by omega
          simpa only [heq] using step0589 ⟨d - 199, hi⟩
        ·
          have hi : d - 231 < 32 := by omega
          have heq : 231 + (d - 231) = d := by omega
          simpa only [heq] using step0590 ⟨d - 231, hi⟩
  ·
    by_cases h359 : d < 359
    ·
      by_cases h295 : d < 295
      ·
        have hi : d - 263 < 32 := by omega
        have heq : 263 + (d - 263) = d := by omega
        simpa only [heq] using step0591 ⟨d - 263, hi⟩
      ·
        by_cases h327 : d < 327
        ·
          have hi : d - 295 < 32 := by omega
          have heq : 295 + (d - 295) = d := by omega
          simpa only [heq] using step0592 ⟨d - 295, hi⟩
        ·
          have hi : d - 327 < 32 := by omega
          have heq : 327 + (d - 327) = d := by omega
          simpa only [heq] using step0593 ⟨d - 327, hi⟩
    ·
      by_cases h423 : d < 423
      ·
        by_cases h391 : d < 391
        ·
          have hi : d - 359 < 32 := by omega
          have heq : 359 + (d - 359) = d := by omega
          simpa only [heq] using step0594 ⟨d - 359, hi⟩
        ·
          have hi : d - 391 < 32 := by omega
          have heq : 391 + (d - 391) = d := by omega
          simpa only [heq] using step0595 ⟨d - 391, hi⟩
      ·
        by_cases h455 : d < 455
        ·
          have hi : d - 423 < 32 := by omega
          have heq : 423 + (d - 423) = d := by omega
          simpa only [heq] using step0596 ⟨d - 423, hi⟩
        ·
          have hi : d - 455 < 7 := by omega
          have heq : 455 + (d - 455) = d := by omega
          simpa only [heq] using step0597 ⟨d - 455, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0584,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0584,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0585,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0585,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0586,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0586,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0587,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0587,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0588,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0588,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0589,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0589,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0590,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0590,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0591,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0591,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0592,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0592,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0593,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0593,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0594,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0594,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0595,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0595,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0596,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0596,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.fields0597,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.step0597,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow040
