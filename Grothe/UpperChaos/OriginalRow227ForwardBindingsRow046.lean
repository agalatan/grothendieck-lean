import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow045
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow046
import Grothe.UpperChaos.OriginalRow227TriangleForward0666
import Grothe.UpperChaos.OriginalRow227TriangleForward0667
import Grothe.UpperChaos.OriginalRow227TriangleForward0668
import Grothe.UpperChaos.OriginalRow227TriangleForward0669
import Grothe.UpperChaos.OriginalRow227TriangleForward0670
import Grothe.UpperChaos.OriginalRow227TriangleForward0671
import Grothe.UpperChaos.OriginalRow227TriangleForward0672
import Grothe.UpperChaos.OriginalRow227TriangleForward0673
import Grothe.UpperChaos.OriginalRow227TriangleForward0674
import Grothe.UpperChaos.OriginalRow227TriangleForward0675
import Grothe.UpperChaos.OriginalRow227TriangleForward0676
import Grothe.UpperChaos.OriginalRow227TriangleForward0677
import Grothe.UpperChaos.OriginalRow227TriangleForward0678

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0666 : OriginalRow227TriangleForward0666.entries.size = 32 := rfl

def entry0666 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0666.entries[i.val]'(by rw [size0666]; exact i.isLt)

theorem fields0666 (i : Fin 32) :
    (entry0666 i).IA = shift ∧ (entry0666 i).ID = S (45 + i.val + 1) ∧
      (entry0666 i).IC = S 46 ∧ (entry0666 i).Inext = T 45 (45 + i.val + 1) ∧
      (entry0666 i).Icur = T 45 (45 + i.val) ∧
      (entry0666 i).output = T 46 (45 + i.val) ∧
      (entry0666 i).charge = charge 45 (45 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0669_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0682_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0666 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (45 + i.val)) shift
      (S (45 + i.val + 1)) (S 46) (T 45 (45 + i.val + 1))
      (T 45 (45 + i.val)) (T 46 (45 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0666.entries OriginalRow227TriangleForward0666.checked
    ⟨i.val, by rw [size0666]; exact i.isLt⟩
  change (entry0666 i).check = true at h
  rcases fields0666 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0667 : OriginalRow227TriangleForward0667.entries.size = 32 := rfl

def entry0667 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0667.entries[i.val]'(by rw [size0667]; exact i.isLt)

theorem fields0667 (i : Fin 32) :
    (entry0667 i).IA = shift ∧ (entry0667 i).ID = S (77 + i.val + 1) ∧
      (entry0667 i).IC = S 46 ∧ (entry0667 i).Inext = T 45 (77 + i.val + 1) ∧
      (entry0667 i).Icur = T 45 (77 + i.val) ∧
      (entry0667 i).output = T 46 (77 + i.val) ∧
      (entry0667 i).charge = charge 45 (77 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0670_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0683_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0667 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (77 + i.val)) shift
      (S (77 + i.val + 1)) (S 46) (T 45 (77 + i.val + 1))
      (T 45 (77 + i.val)) (T 46 (77 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0667.entries OriginalRow227TriangleForward0667.checked
    ⟨i.val, by rw [size0667]; exact i.isLt⟩
  change (entry0667 i).check = true at h
  rcases fields0667 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0668 : OriginalRow227TriangleForward0668.entries.size = 32 := rfl

def entry0668 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0668.entries[i.val]'(by rw [size0668]; exact i.isLt)

theorem fields0668 (i : Fin 32) :
    (entry0668 i).IA = shift ∧ (entry0668 i).ID = S (109 + i.val + 1) ∧
      (entry0668 i).IC = S 46 ∧ (entry0668 i).Inext = T 45 (109 + i.val + 1) ∧
      (entry0668 i).Icur = T 45 (109 + i.val) ∧
      (entry0668 i).output = T 46 (109 + i.val) ∧
      (entry0668 i).charge = charge 45 (109 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0671_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0684_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0668 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (109 + i.val)) shift
      (S (109 + i.val + 1)) (S 46) (T 45 (109 + i.val + 1))
      (T 45 (109 + i.val)) (T 46 (109 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0668.entries OriginalRow227TriangleForward0668.checked
    ⟨i.val, by rw [size0668]; exact i.isLt⟩
  change (entry0668 i).check = true at h
  rcases fields0668 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0669 : OriginalRow227TriangleForward0669.entries.size = 32 := rfl

def entry0669 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0669.entries[i.val]'(by rw [size0669]; exact i.isLt)

theorem fields0669 (i : Fin 32) :
    (entry0669 i).IA = shift ∧ (entry0669 i).ID = S (141 + i.val + 1) ∧
      (entry0669 i).IC = S 46 ∧ (entry0669 i).Inext = T 45 (141 + i.val + 1) ∧
      (entry0669 i).Icur = T 45 (141 + i.val) ∧
      (entry0669 i).output = T 46 (141 + i.val) ∧
      (entry0669 i).charge = charge 45 (141 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0672_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0685_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0669 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (141 + i.val)) shift
      (S (141 + i.val + 1)) (S 46) (T 45 (141 + i.val + 1))
      (T 45 (141 + i.val)) (T 46 (141 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0669.entries OriginalRow227TriangleForward0669.checked
    ⟨i.val, by rw [size0669]; exact i.isLt⟩
  change (entry0669 i).check = true at h
  rcases fields0669 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0670 : OriginalRow227TriangleForward0670.entries.size = 32 := rfl

def entry0670 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0670.entries[i.val]'(by rw [size0670]; exact i.isLt)

theorem fields0670 (i : Fin 32) :
    (entry0670 i).IA = shift ∧ (entry0670 i).ID = S (173 + i.val + 1) ∧
      (entry0670 i).IC = S 46 ∧ (entry0670 i).Inext = T 45 (173 + i.val + 1) ∧
      (entry0670 i).Icur = T 45 (173 + i.val) ∧
      (entry0670 i).output = T 46 (173 + i.val) ∧
      (entry0670 i).charge = charge 45 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0673_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0686_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0670 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 46) (T 45 (173 + i.val + 1))
      (T 45 (173 + i.val)) (T 46 (173 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0670.entries OriginalRow227TriangleForward0670.checked
    ⟨i.val, by rw [size0670]; exact i.isLt⟩
  change (entry0670 i).check = true at h
  rcases fields0670 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0671 : OriginalRow227TriangleForward0671.entries.size = 32 := rfl

def entry0671 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0671.entries[i.val]'(by rw [size0671]; exact i.isLt)

theorem fields0671 (i : Fin 32) :
    (entry0671 i).IA = shift ∧ (entry0671 i).ID = S (205 + i.val + 1) ∧
      (entry0671 i).IC = S 46 ∧ (entry0671 i).Inext = T 45 (205 + i.val + 1) ∧
      (entry0671 i).Icur = T 45 (205 + i.val) ∧
      (entry0671 i).output = T 46 (205 + i.val) ∧
      (entry0671 i).charge = charge 45 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0674_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0687_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0671 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 46) (T 45 (205 + i.val + 1))
      (T 45 (205 + i.val)) (T 46 (205 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0671.entries OriginalRow227TriangleForward0671.checked
    ⟨i.val, by rw [size0671]; exact i.isLt⟩
  change (entry0671 i).check = true at h
  rcases fields0671 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0672 : OriginalRow227TriangleForward0672.entries.size = 32 := rfl

def entry0672 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0672.entries[i.val]'(by rw [size0672]; exact i.isLt)

theorem fields0672 (i : Fin 32) :
    (entry0672 i).IA = shift ∧ (entry0672 i).ID = S (237 + i.val + 1) ∧
      (entry0672 i).IC = S 46 ∧ (entry0672 i).Inext = T 45 (237 + i.val + 1) ∧
      (entry0672 i).Icur = T 45 (237 + i.val) ∧
      (entry0672 i).output = T 46 (237 + i.val) ∧
      (entry0672 i).charge = charge 45 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0675_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0688_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0672 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 46) (T 45 (237 + i.val + 1))
      (T 45 (237 + i.val)) (T 46 (237 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0672.entries OriginalRow227TriangleForward0672.checked
    ⟨i.val, by rw [size0672]; exact i.isLt⟩
  change (entry0672 i).check = true at h
  rcases fields0672 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0673 : OriginalRow227TriangleForward0673.entries.size = 32 := rfl

def entry0673 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0673.entries[i.val]'(by rw [size0673]; exact i.isLt)

theorem fields0673 (i : Fin 32) :
    (entry0673 i).IA = shift ∧ (entry0673 i).ID = S (269 + i.val + 1) ∧
      (entry0673 i).IC = S 46 ∧ (entry0673 i).Inext = T 45 (269 + i.val + 1) ∧
      (entry0673 i).Icur = T 45 (269 + i.val) ∧
      (entry0673 i).output = T 46 (269 + i.val) ∧
      (entry0673 i).charge = charge 45 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0676_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0689_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0673 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 46) (T 45 (269 + i.val + 1))
      (T 45 (269 + i.val)) (T 46 (269 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0673.entries OriginalRow227TriangleForward0673.checked
    ⟨i.val, by rw [size0673]; exact i.isLt⟩
  change (entry0673 i).check = true at h
  rcases fields0673 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0674 : OriginalRow227TriangleForward0674.entries.size = 32 := rfl

def entry0674 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0674.entries[i.val]'(by rw [size0674]; exact i.isLt)

theorem fields0674 (i : Fin 32) :
    (entry0674 i).IA = shift ∧ (entry0674 i).ID = S (301 + i.val + 1) ∧
      (entry0674 i).IC = S 46 ∧ (entry0674 i).Inext = T 45 (301 + i.val + 1) ∧
      (entry0674 i).Icur = T 45 (301 + i.val) ∧
      (entry0674 i).output = T 46 (301 + i.val) ∧
      (entry0674 i).charge = charge 45 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0677_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0690_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0674 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 46) (T 45 (301 + i.val + 1))
      (T 45 (301 + i.val)) (T 46 (301 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0674.entries OriginalRow227TriangleForward0674.checked
    ⟨i.val, by rw [size0674]; exact i.isLt⟩
  change (entry0674 i).check = true at h
  rcases fields0674 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0675 : OriginalRow227TriangleForward0675.entries.size = 32 := rfl

def entry0675 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0675.entries[i.val]'(by rw [size0675]; exact i.isLt)

theorem fields0675 (i : Fin 32) :
    (entry0675 i).IA = shift ∧ (entry0675 i).ID = S (333 + i.val + 1) ∧
      (entry0675 i).IC = S 46 ∧ (entry0675 i).Inext = T 45 (333 + i.val + 1) ∧
      (entry0675 i).Icur = T 45 (333 + i.val) ∧
      (entry0675 i).output = T 46 (333 + i.val) ∧
      (entry0675 i).charge = charge 45 (333 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0678_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0691_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0675 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (333 + i.val)) shift
      (S (333 + i.val + 1)) (S 46) (T 45 (333 + i.val + 1))
      (T 45 (333 + i.val)) (T 46 (333 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0675.entries OriginalRow227TriangleForward0675.checked
    ⟨i.val, by rw [size0675]; exact i.isLt⟩
  change (entry0675 i).check = true at h
  rcases fields0675 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0676 : OriginalRow227TriangleForward0676.entries.size = 32 := rfl

def entry0676 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0676.entries[i.val]'(by rw [size0676]; exact i.isLt)

theorem fields0676 (i : Fin 32) :
    (entry0676 i).IA = shift ∧ (entry0676 i).ID = S (365 + i.val + 1) ∧
      (entry0676 i).IC = S 46 ∧ (entry0676 i).Inext = T 45 (365 + i.val + 1) ∧
      (entry0676 i).Icur = T 45 (365 + i.val) ∧
      (entry0676 i).output = T 46 (365 + i.val) ∧
      (entry0676 i).charge = charge 45 (365 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0679_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0692_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0676 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (365 + i.val)) shift
      (S (365 + i.val + 1)) (S 46) (T 45 (365 + i.val + 1))
      (T 45 (365 + i.val)) (T 46 (365 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0676.entries OriginalRow227TriangleForward0676.checked
    ⟨i.val, by rw [size0676]; exact i.isLt⟩
  change (entry0676 i).check = true at h
  rcases fields0676 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0677 : OriginalRow227TriangleForward0677.entries.size = 32 := rfl

def entry0677 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0677.entries[i.val]'(by rw [size0677]; exact i.isLt)

theorem fields0677 (i : Fin 32) :
    (entry0677 i).IA = shift ∧ (entry0677 i).ID = S (397 + i.val + 1) ∧
      (entry0677 i).IC = S 46 ∧ (entry0677 i).Inext = T 45 (397 + i.val + 1) ∧
      (entry0677 i).Icur = T 45 (397 + i.val) ∧
      (entry0677 i).output = T 46 (397 + i.val) ∧
      (entry0677 i).charge = charge 45 (397 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0680_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0693_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0677 (i : Fin 32) :
    forwardStepOK (-768) (charge 45 (397 + i.val)) shift
      (S (397 + i.val + 1)) (S 46) (T 45 (397 + i.val + 1))
      (T 45 (397 + i.val)) (T 46 (397 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0677.entries OriginalRow227TriangleForward0677.checked
    ⟨i.val, by rw [size0677]; exact i.isLt⟩
  change (entry0677 i).check = true at h
  rcases fields0677 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0678 : OriginalRow227TriangleForward0678.entries.size = 27 := rfl

def entry0678 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0678.entries[i.val]'(by rw [size0678]; exact i.isLt)

theorem fields0678 (i : Fin 27) :
    (entry0678 i).IA = shift ∧ (entry0678 i).ID = S (429 + i.val + 1) ∧
      (entry0678 i).IC = S 46 ∧ (entry0678 i).Inext = T 45 (429 + i.val + 1) ∧
      (entry0678 i).Icur = T 45 (429 + i.val) ∧
      (entry0678 i).output = T 46 (429 + i.val) ∧
      (entry0678 i).charge = charge 45 (429 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root46).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow045.block0681_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow046.block0694_value ⟨26, by decide⟩).symm, rfl⟩

theorem step0678 (i : Fin 27) :
    forwardStepOK (-768) (charge 45 (429 + i.val)) shift
      (S (429 + i.val + 1)) (S 46) (T 45 (429 + i.val + 1))
      (T 45 (429 + i.val)) (T 46 (429 + i.val))
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0678.entries OriginalRow227TriangleForward0678.checked
    ⟨i.val, by rw [size0678]; exact i.isLt⟩
  change (entry0678 i).check = true at h
  rcases fields0678 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 45 ≤ d) (hhi : d < 456) :
    forwardStepOK (-768) (charge 45 d) shift (S (d + 1)) (S 46)
      (T 45 (d + 1)) (T 45 d) (T 46 d)
      (OriginalRow227Roots.root_pos 46 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 45 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h141 : d < 141
    ·
      by_cases h77 : d < 77
      ·
        have hi : d - 45 < 32 := by omega
        have heq : 45 + (d - 45) = d := by omega
        simpa only [heq] using step0666 ⟨d - 45, hi⟩
      ·
        by_cases h109 : d < 109
        ·
          have hi : d - 77 < 32 := by omega
          have heq : 77 + (d - 77) = d := by omega
          simpa only [heq] using step0667 ⟨d - 77, hi⟩
        ·
          have hi : d - 109 < 32 := by omega
          have heq : 109 + (d - 109) = d := by omega
          simpa only [heq] using step0668 ⟨d - 109, hi⟩
    ·
      by_cases h173 : d < 173
      ·
        have hi : d - 141 < 32 := by omega
        have heq : 141 + (d - 141) = d := by omega
        simpa only [heq] using step0669 ⟨d - 141, hi⟩
      ·
        by_cases h205 : d < 205
        ·
          have hi : d - 173 < 32 := by omega
          have heq : 173 + (d - 173) = d := by omega
          simpa only [heq] using step0670 ⟨d - 173, hi⟩
        ·
          have hi : d - 205 < 32 := by omega
          have heq : 205 + (d - 205) = d := by omega
          simpa only [heq] using step0671 ⟨d - 205, hi⟩
  ·
    by_cases h333 : d < 333
    ·
      by_cases h269 : d < 269
      ·
        have hi : d - 237 < 32 := by omega
        have heq : 237 + (d - 237) = d := by omega
        simpa only [heq] using step0672 ⟨d - 237, hi⟩
      ·
        by_cases h301 : d < 301
        ·
          have hi : d - 269 < 32 := by omega
          have heq : 269 + (d - 269) = d := by omega
          simpa only [heq] using step0673 ⟨d - 269, hi⟩
        ·
          have hi : d - 301 < 32 := by omega
          have heq : 301 + (d - 301) = d := by omega
          simpa only [heq] using step0674 ⟨d - 301, hi⟩
    ·
      by_cases h397 : d < 397
      ·
        by_cases h365 : d < 365
        ·
          have hi : d - 333 < 32 := by omega
          have heq : 333 + (d - 333) = d := by omega
          simpa only [heq] using step0675 ⟨d - 333, hi⟩
        ·
          have hi : d - 365 < 32 := by omega
          have heq : 365 + (d - 365) = d := by omega
          simpa only [heq] using step0676 ⟨d - 365, hi⟩
      ·
        by_cases h429 : d < 429
        ·
          have hi : d - 397 < 32 := by omega
          have heq : 397 + (d - 397) = d := by omega
          simpa only [heq] using step0677 ⟨d - 397, hi⟩
        ·
          have hi : d - 429 < 27 := by omega
          have heq : 429 + (d - 429) = d := by omega
          simpa only [heq] using step0678 ⟨d - 429, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0666,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0666,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0667,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0667,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0668,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0668,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0669,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0669,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0670,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0670,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0671,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0671,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0672,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0672,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0673,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0673,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0674,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0674,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0675,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0675,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0676,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0676,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0677,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0677,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.fields0678,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.step0678,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow046
