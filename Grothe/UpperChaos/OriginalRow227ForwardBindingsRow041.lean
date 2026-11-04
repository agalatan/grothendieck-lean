import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow040
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow041
import Grothe.UpperChaos.OriginalRow227TriangleForward0598
import Grothe.UpperChaos.OriginalRow227TriangleForward0599
import Grothe.UpperChaos.OriginalRow227TriangleForward0600
import Grothe.UpperChaos.OriginalRow227TriangleForward0601
import Grothe.UpperChaos.OriginalRow227TriangleForward0602
import Grothe.UpperChaos.OriginalRow227TriangleForward0603
import Grothe.UpperChaos.OriginalRow227TriangleForward0604
import Grothe.UpperChaos.OriginalRow227TriangleForward0605
import Grothe.UpperChaos.OriginalRow227TriangleForward0606
import Grothe.UpperChaos.OriginalRow227TriangleForward0607
import Grothe.UpperChaos.OriginalRow227TriangleForward0608
import Grothe.UpperChaos.OriginalRow227TriangleForward0609
import Grothe.UpperChaos.OriginalRow227TriangleForward0610
import Grothe.UpperChaos.OriginalRow227TriangleForward0611

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0598 : OriginalRow227TriangleForward0598.entries.size = 32 := rfl

def entry0598 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0598.entries[i.val]'(by rw [size0598]; exact i.isLt)

theorem fields0598 (i : Fin 32) :
    (entry0598 i).IA = shift ∧ (entry0598 i).ID = S (40 + i.val + 1) ∧
      (entry0598 i).IC = S 41 ∧ (entry0598 i).Inext = T 40 (40 + i.val + 1) ∧
      (entry0598 i).Icur = T 40 (40 + i.val) ∧
      (entry0598 i).output = T 41 (40 + i.val) ∧
      (entry0598 i).charge = charge 40 (40 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root41).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root42).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root43).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root44).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root45).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root46).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root47).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root48).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root49).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root50).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root51).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root52).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root53).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0600_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0614_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0598 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (40 + i.val)) shift
      (S (40 + i.val + 1)) (S 41) (T 40 (40 + i.val + 1))
      (T 40 (40 + i.val)) (T 41 (40 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0598.entries OriginalRow227TriangleForward0598.checked
    ⟨i.val, by rw [size0598]; exact i.isLt⟩
  change (entry0598 i).check = true at h
  rcases fields0598 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0599 : OriginalRow227TriangleForward0599.entries.size = 32 := rfl

def entry0599 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0599.entries[i.val]'(by rw [size0599]; exact i.isLt)

theorem fields0599 (i : Fin 32) :
    (entry0599 i).IA = shift ∧ (entry0599 i).ID = S (72 + i.val + 1) ∧
      (entry0599 i).IC = S 41 ∧ (entry0599 i).Inext = T 40 (72 + i.val + 1) ∧
      (entry0599 i).Icur = T 40 (72 + i.val) ∧
      (entry0599 i).output = T 41 (72 + i.val) ∧
      (entry0599 i).charge = charge 40 (72 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0601_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0615_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0599 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (72 + i.val)) shift
      (S (72 + i.val + 1)) (S 41) (T 40 (72 + i.val + 1))
      (T 40 (72 + i.val)) (T 41 (72 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0599.entries OriginalRow227TriangleForward0599.checked
    ⟨i.val, by rw [size0599]; exact i.isLt⟩
  change (entry0599 i).check = true at h
  rcases fields0599 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0600 : OriginalRow227TriangleForward0600.entries.size = 32 := rfl

def entry0600 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0600.entries[i.val]'(by rw [size0600]; exact i.isLt)

theorem fields0600 (i : Fin 32) :
    (entry0600 i).IA = shift ∧ (entry0600 i).ID = S (104 + i.val + 1) ∧
      (entry0600 i).IC = S 41 ∧ (entry0600 i).Inext = T 40 (104 + i.val + 1) ∧
      (entry0600 i).Icur = T 40 (104 + i.val) ∧
      (entry0600 i).output = T 41 (104 + i.val) ∧
      (entry0600 i).charge = charge 40 (104 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0602_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0616_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0600 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (104 + i.val)) shift
      (S (104 + i.val + 1)) (S 41) (T 40 (104 + i.val + 1))
      (T 40 (104 + i.val)) (T 41 (104 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0600.entries OriginalRow227TriangleForward0600.checked
    ⟨i.val, by rw [size0600]; exact i.isLt⟩
  change (entry0600 i).check = true at h
  rcases fields0600 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0601 : OriginalRow227TriangleForward0601.entries.size = 32 := rfl

def entry0601 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0601.entries[i.val]'(by rw [size0601]; exact i.isLt)

theorem fields0601 (i : Fin 32) :
    (entry0601 i).IA = shift ∧ (entry0601 i).ID = S (136 + i.val + 1) ∧
      (entry0601 i).IC = S 41 ∧ (entry0601 i).Inext = T 40 (136 + i.val + 1) ∧
      (entry0601 i).Icur = T 40 (136 + i.val) ∧
      (entry0601 i).output = T 41 (136 + i.val) ∧
      (entry0601 i).charge = charge 40 (136 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0603_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0617_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0601 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (136 + i.val)) shift
      (S (136 + i.val + 1)) (S 41) (T 40 (136 + i.val + 1))
      (T 40 (136 + i.val)) (T 41 (136 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0601.entries OriginalRow227TriangleForward0601.checked
    ⟨i.val, by rw [size0601]; exact i.isLt⟩
  change (entry0601 i).check = true at h
  rcases fields0601 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0602 : OriginalRow227TriangleForward0602.entries.size = 32 := rfl

def entry0602 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0602.entries[i.val]'(by rw [size0602]; exact i.isLt)

theorem fields0602 (i : Fin 32) :
    (entry0602 i).IA = shift ∧ (entry0602 i).ID = S (168 + i.val + 1) ∧
      (entry0602 i).IC = S 41 ∧ (entry0602 i).Inext = T 40 (168 + i.val + 1) ∧
      (entry0602 i).Icur = T 40 (168 + i.val) ∧
      (entry0602 i).output = T 41 (168 + i.val) ∧
      (entry0602 i).charge = charge 40 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0604_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0618_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0602 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 41) (T 40 (168 + i.val + 1))
      (T 40 (168 + i.val)) (T 41 (168 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0602.entries OriginalRow227TriangleForward0602.checked
    ⟨i.val, by rw [size0602]; exact i.isLt⟩
  change (entry0602 i).check = true at h
  rcases fields0602 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0603 : OriginalRow227TriangleForward0603.entries.size = 32 := rfl

def entry0603 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0603.entries[i.val]'(by rw [size0603]; exact i.isLt)

theorem fields0603 (i : Fin 32) :
    (entry0603 i).IA = shift ∧ (entry0603 i).ID = S (200 + i.val + 1) ∧
      (entry0603 i).IC = S 41 ∧ (entry0603 i).Inext = T 40 (200 + i.val + 1) ∧
      (entry0603 i).Icur = T 40 (200 + i.val) ∧
      (entry0603 i).output = T 41 (200 + i.val) ∧
      (entry0603 i).charge = charge 40 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0605_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0619_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0603 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 41) (T 40 (200 + i.val + 1))
      (T 40 (200 + i.val)) (T 41 (200 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0603.entries OriginalRow227TriangleForward0603.checked
    ⟨i.val, by rw [size0603]; exact i.isLt⟩
  change (entry0603 i).check = true at h
  rcases fields0603 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0604 : OriginalRow227TriangleForward0604.entries.size = 32 := rfl

def entry0604 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0604.entries[i.val]'(by rw [size0604]; exact i.isLt)

theorem fields0604 (i : Fin 32) :
    (entry0604 i).IA = shift ∧ (entry0604 i).ID = S (232 + i.val + 1) ∧
      (entry0604 i).IC = S 41 ∧ (entry0604 i).Inext = T 40 (232 + i.val + 1) ∧
      (entry0604 i).Icur = T 40 (232 + i.val) ∧
      (entry0604 i).output = T 41 (232 + i.val) ∧
      (entry0604 i).charge = charge 40 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0606_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0620_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0604 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 41) (T 40 (232 + i.val + 1))
      (T 40 (232 + i.val)) (T 41 (232 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0604.entries OriginalRow227TriangleForward0604.checked
    ⟨i.val, by rw [size0604]; exact i.isLt⟩
  change (entry0604 i).check = true at h
  rcases fields0604 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0605 : OriginalRow227TriangleForward0605.entries.size = 32 := rfl

def entry0605 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0605.entries[i.val]'(by rw [size0605]; exact i.isLt)

theorem fields0605 (i : Fin 32) :
    (entry0605 i).IA = shift ∧ (entry0605 i).ID = S (264 + i.val + 1) ∧
      (entry0605 i).IC = S 41 ∧ (entry0605 i).Inext = T 40 (264 + i.val + 1) ∧
      (entry0605 i).Icur = T 40 (264 + i.val) ∧
      (entry0605 i).output = T 41 (264 + i.val) ∧
      (entry0605 i).charge = charge 40 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0607_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0621_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0605 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 41) (T 40 (264 + i.val + 1))
      (T 40 (264 + i.val)) (T 41 (264 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0605.entries OriginalRow227TriangleForward0605.checked
    ⟨i.val, by rw [size0605]; exact i.isLt⟩
  change (entry0605 i).check = true at h
  rcases fields0605 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0606 : OriginalRow227TriangleForward0606.entries.size = 32 := rfl

def entry0606 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0606.entries[i.val]'(by rw [size0606]; exact i.isLt)

theorem fields0606 (i : Fin 32) :
    (entry0606 i).IA = shift ∧ (entry0606 i).ID = S (296 + i.val + 1) ∧
      (entry0606 i).IC = S 41 ∧ (entry0606 i).Inext = T 40 (296 + i.val + 1) ∧
      (entry0606 i).Icur = T 40 (296 + i.val) ∧
      (entry0606 i).output = T 41 (296 + i.val) ∧
      (entry0606 i).charge = charge 40 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0608_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0622_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0606 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 41) (T 40 (296 + i.val + 1))
      (T 40 (296 + i.val)) (T 41 (296 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0606.entries OriginalRow227TriangleForward0606.checked
    ⟨i.val, by rw [size0606]; exact i.isLt⟩
  change (entry0606 i).check = true at h
  rcases fields0606 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0607 : OriginalRow227TriangleForward0607.entries.size = 32 := rfl

def entry0607 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0607.entries[i.val]'(by rw [size0607]; exact i.isLt)

theorem fields0607 (i : Fin 32) :
    (entry0607 i).IA = shift ∧ (entry0607 i).ID = S (328 + i.val + 1) ∧
      (entry0607 i).IC = S 41 ∧ (entry0607 i).Inext = T 40 (328 + i.val + 1) ∧
      (entry0607 i).Icur = T 40 (328 + i.val) ∧
      (entry0607 i).output = T 41 (328 + i.val) ∧
      (entry0607 i).charge = charge 40 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0609_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0623_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0607 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 41) (T 40 (328 + i.val + 1))
      (T 40 (328 + i.val)) (T 41 (328 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0607.entries OriginalRow227TriangleForward0607.checked
    ⟨i.val, by rw [size0607]; exact i.isLt⟩
  change (entry0607 i).check = true at h
  rcases fields0607 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0608 : OriginalRow227TriangleForward0608.entries.size = 32 := rfl

def entry0608 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0608.entries[i.val]'(by rw [size0608]; exact i.isLt)

theorem fields0608 (i : Fin 32) :
    (entry0608 i).IA = shift ∧ (entry0608 i).ID = S (360 + i.val + 1) ∧
      (entry0608 i).IC = S 41 ∧ (entry0608 i).Inext = T 40 (360 + i.val + 1) ∧
      (entry0608 i).Icur = T 40 (360 + i.val) ∧
      (entry0608 i).output = T 41 (360 + i.val) ∧
      (entry0608 i).charge = charge 40 (360 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0610_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0624_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0608 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (360 + i.val)) shift
      (S (360 + i.val + 1)) (S 41) (T 40 (360 + i.val + 1))
      (T 40 (360 + i.val)) (T 41 (360 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0608.entries OriginalRow227TriangleForward0608.checked
    ⟨i.val, by rw [size0608]; exact i.isLt⟩
  change (entry0608 i).check = true at h
  rcases fields0608 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0609 : OriginalRow227TriangleForward0609.entries.size = 32 := rfl

def entry0609 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0609.entries[i.val]'(by rw [size0609]; exact i.isLt)

theorem fields0609 (i : Fin 32) :
    (entry0609 i).IA = shift ∧ (entry0609 i).ID = S (392 + i.val + 1) ∧
      (entry0609 i).IC = S 41 ∧ (entry0609 i).Inext = T 40 (392 + i.val + 1) ∧
      (entry0609 i).Icur = T 40 (392 + i.val) ∧
      (entry0609 i).output = T 41 (392 + i.val) ∧
      (entry0609 i).charge = charge 40 (392 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0611_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0625_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0609 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (392 + i.val)) shift
      (S (392 + i.val + 1)) (S 41) (T 40 (392 + i.val + 1))
      (T 40 (392 + i.val)) (T 41 (392 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0609.entries OriginalRow227TriangleForward0609.checked
    ⟨i.val, by rw [size0609]; exact i.isLt⟩
  change (entry0609 i).check = true at h
  rcases fields0609 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0610 : OriginalRow227TriangleForward0610.entries.size = 32 := rfl

def entry0610 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0610.entries[i.val]'(by rw [size0610]; exact i.isLt)

theorem fields0610 (i : Fin 32) :
    (entry0610 i).IA = shift ∧ (entry0610 i).ID = S (424 + i.val + 1) ∧
      (entry0610 i).IC = S 41 ∧ (entry0610 i).Inext = T 40 (424 + i.val + 1) ∧
      (entry0610 i).Icur = T 40 (424 + i.val) ∧
      (entry0610 i).output = T 41 (424 + i.val) ∧
      (entry0610 i).charge = charge 40 (424 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root449).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root450).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root451).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root452).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root453).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root454).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root455).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0612_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root456).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0626_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0610 (i : Fin 32) :
    forwardStepOK (-768) (charge 40 (424 + i.val)) shift
      (S (424 + i.val + 1)) (S 41) (T 40 (424 + i.val + 1))
      (T 40 (424 + i.val)) (T 41 (424 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0610.entries OriginalRow227TriangleForward0610.checked
    ⟨i.val, by rw [size0610]; exact i.isLt⟩
  change (entry0610 i).check = true at h
  rcases fields0610 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0611 : OriginalRow227TriangleForward0611.entries.size = 5 := rfl

def entry0611 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0611.entries[i.val]'(by rw [size0611]; exact i.isLt)

theorem fields0611 (i : Fin 5) :
    (entry0611 i).IA = shift ∧ (entry0611 i).ID = S (456 + i.val + 1) ∧
      (entry0611 i).IC = S 41 ∧ (entry0611 i).Inext = T 40 (456 + i.val + 1) ∧
      (entry0611 i).Icur = T 40 (456 + i.val) ∧
      (entry0611 i).output = T 41 (456 + i.val) ∧
      (entry0611 i).charge = charge 40 (456 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root457).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root458).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root459).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root460).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings14.S_eq_root461).symm, (OriginalRow227RootBindings01.S_eq_root41).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow040.block0613_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow041.block0627_value ⟨4, by decide⟩).symm, rfl⟩

theorem step0611 (i : Fin 5) :
    forwardStepOK (-768) (charge 40 (456 + i.val)) shift
      (S (456 + i.val + 1)) (S 41) (T 40 (456 + i.val + 1))
      (T 40 (456 + i.val)) (T 41 (456 + i.val))
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0611.entries OriginalRow227TriangleForward0611.checked
    ⟨i.val, by rw [size0611]; exact i.isLt⟩
  change (entry0611 i).check = true at h
  rcases fields0611 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 40 ≤ d) (hhi : d < 461) :
    forwardStepOK (-768) (charge 40 d) shift (S (d + 1)) (S 41)
      (T 40 (d + 1)) (T 40 d) (T 41 d)
      (OriginalRow227Roots.root_pos 41 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 40 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h136 : d < 136
    ·
      by_cases h72 : d < 72
      ·
        have hi : d - 40 < 32 := by omega
        have heq : 40 + (d - 40) = d := by omega
        simpa only [heq] using step0598 ⟨d - 40, hi⟩
      ·
        by_cases h104 : d < 104
        ·
          have hi : d - 72 < 32 := by omega
          have heq : 72 + (d - 72) = d := by omega
          simpa only [heq] using step0599 ⟨d - 72, hi⟩
        ·
          have hi : d - 104 < 32 := by omega
          have heq : 104 + (d - 104) = d := by omega
          simpa only [heq] using step0600 ⟨d - 104, hi⟩
    ·
      by_cases h200 : d < 200
      ·
        by_cases h168 : d < 168
        ·
          have hi : d - 136 < 32 := by omega
          have heq : 136 + (d - 136) = d := by omega
          simpa only [heq] using step0601 ⟨d - 136, hi⟩
        ·
          have hi : d - 168 < 32 := by omega
          have heq : 168 + (d - 168) = d := by omega
          simpa only [heq] using step0602 ⟨d - 168, hi⟩
      ·
        by_cases h232 : d < 232
        ·
          have hi : d - 200 < 32 := by omega
          have heq : 200 + (d - 200) = d := by omega
          simpa only [heq] using step0603 ⟨d - 200, hi⟩
        ·
          have hi : d - 232 < 32 := by omega
          have heq : 232 + (d - 232) = d := by omega
          simpa only [heq] using step0604 ⟨d - 232, hi⟩
  ·
    by_cases h360 : d < 360
    ·
      by_cases h296 : d < 296
      ·
        have hi : d - 264 < 32 := by omega
        have heq : 264 + (d - 264) = d := by omega
        simpa only [heq] using step0605 ⟨d - 264, hi⟩
      ·
        by_cases h328 : d < 328
        ·
          have hi : d - 296 < 32 := by omega
          have heq : 296 + (d - 296) = d := by omega
          simpa only [heq] using step0606 ⟨d - 296, hi⟩
        ·
          have hi : d - 328 < 32 := by omega
          have heq : 328 + (d - 328) = d := by omega
          simpa only [heq] using step0607 ⟨d - 328, hi⟩
    ·
      by_cases h424 : d < 424
      ·
        by_cases h392 : d < 392
        ·
          have hi : d - 360 < 32 := by omega
          have heq : 360 + (d - 360) = d := by omega
          simpa only [heq] using step0608 ⟨d - 360, hi⟩
        ·
          have hi : d - 392 < 32 := by omega
          have heq : 392 + (d - 392) = d := by omega
          simpa only [heq] using step0609 ⟨d - 392, hi⟩
      ·
        by_cases h456 : d < 456
        ·
          have hi : d - 424 < 32 := by omega
          have heq : 424 + (d - 424) = d := by omega
          simpa only [heq] using step0610 ⟨d - 424, hi⟩
        ·
          have hi : d - 456 < 5 := by omega
          have heq : 456 + (d - 456) = d := by omega
          simpa only [heq] using step0611 ⟨d - 456, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0598,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0598,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0599,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0599,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0600,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0600,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0601,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0601,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0602,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0602,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0603,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0603,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0604,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0604,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0605,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0605,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0606,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0606,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0607,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0607,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0608,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0608,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0609,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0609,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0610,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0610,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.fields0611,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.step0611,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow041
