import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow059
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow060
import Grothe.UpperChaos.OriginalRow227TriangleForward0848
import Grothe.UpperChaos.OriginalRow227TriangleForward0849
import Grothe.UpperChaos.OriginalRow227TriangleForward0850
import Grothe.UpperChaos.OriginalRow227TriangleForward0851
import Grothe.UpperChaos.OriginalRow227TriangleForward0852
import Grothe.UpperChaos.OriginalRow227TriangleForward0853
import Grothe.UpperChaos.OriginalRow227TriangleForward0854
import Grothe.UpperChaos.OriginalRow227TriangleForward0855
import Grothe.UpperChaos.OriginalRow227TriangleForward0856
import Grothe.UpperChaos.OriginalRow227TriangleForward0857
import Grothe.UpperChaos.OriginalRow227TriangleForward0858
import Grothe.UpperChaos.OriginalRow227TriangleForward0859

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0848 : OriginalRow227TriangleForward0848.entries.size = 32 := rfl

def entry0848 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0848.entries[i.val]'(by rw [size0848]; exact i.isLt)

theorem fields0848 (i : Fin 32) :
    (entry0848 i).IA = shift ∧ (entry0848 i).ID = S (59 + i.val + 1) ∧
      (entry0848 i).IC = S 60 ∧ (entry0848 i).Inext = T 59 (59 + i.val + 1) ∧
      (entry0848 i).Icur = T 59 (59 + i.val) ∧
      (entry0848 i).output = T 60 (59 + i.val) ∧
      (entry0848 i).charge = charge 59 (59 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0851_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0864_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0848 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (59 + i.val)) shift
      (S (59 + i.val + 1)) (S 60) (T 59 (59 + i.val + 1))
      (T 59 (59 + i.val)) (T 60 (59 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0848.entries OriginalRow227TriangleForward0848.checked
    ⟨i.val, by rw [size0848]; exact i.isLt⟩
  change (entry0848 i).check = true at h
  rcases fields0848 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0849 : OriginalRow227TriangleForward0849.entries.size = 32 := rfl

def entry0849 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0849.entries[i.val]'(by rw [size0849]; exact i.isLt)

theorem fields0849 (i : Fin 32) :
    (entry0849 i).IA = shift ∧ (entry0849 i).ID = S (91 + i.val + 1) ∧
      (entry0849 i).IC = S 60 ∧ (entry0849 i).Inext = T 59 (91 + i.val + 1) ∧
      (entry0849 i).Icur = T 59 (91 + i.val) ∧
      (entry0849 i).output = T 60 (91 + i.val) ∧
      (entry0849 i).charge = charge 59 (91 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0852_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0865_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0849 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (91 + i.val)) shift
      (S (91 + i.val + 1)) (S 60) (T 59 (91 + i.val + 1))
      (T 59 (91 + i.val)) (T 60 (91 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0849.entries OriginalRow227TriangleForward0849.checked
    ⟨i.val, by rw [size0849]; exact i.isLt⟩
  change (entry0849 i).check = true at h
  rcases fields0849 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0850 : OriginalRow227TriangleForward0850.entries.size = 32 := rfl

def entry0850 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0850.entries[i.val]'(by rw [size0850]; exact i.isLt)

theorem fields0850 (i : Fin 32) :
    (entry0850 i).IA = shift ∧ (entry0850 i).ID = S (123 + i.val + 1) ∧
      (entry0850 i).IC = S 60 ∧ (entry0850 i).Inext = T 59 (123 + i.val + 1) ∧
      (entry0850 i).Icur = T 59 (123 + i.val) ∧
      (entry0850 i).output = T 60 (123 + i.val) ∧
      (entry0850 i).charge = charge 59 (123 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0853_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0866_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0850 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (123 + i.val)) shift
      (S (123 + i.val + 1)) (S 60) (T 59 (123 + i.val + 1))
      (T 59 (123 + i.val)) (T 60 (123 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0850.entries OriginalRow227TriangleForward0850.checked
    ⟨i.val, by rw [size0850]; exact i.isLt⟩
  change (entry0850 i).check = true at h
  rcases fields0850 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0851 : OriginalRow227TriangleForward0851.entries.size = 32 := rfl

def entry0851 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0851.entries[i.val]'(by rw [size0851]; exact i.isLt)

theorem fields0851 (i : Fin 32) :
    (entry0851 i).IA = shift ∧ (entry0851 i).ID = S (155 + i.val + 1) ∧
      (entry0851 i).IC = S 60 ∧ (entry0851 i).Inext = T 59 (155 + i.val + 1) ∧
      (entry0851 i).Icur = T 59 (155 + i.val) ∧
      (entry0851 i).output = T 60 (155 + i.val) ∧
      (entry0851 i).charge = charge 59 (155 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0854_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0867_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0851 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (155 + i.val)) shift
      (S (155 + i.val + 1)) (S 60) (T 59 (155 + i.val + 1))
      (T 59 (155 + i.val)) (T 60 (155 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0851.entries OriginalRow227TriangleForward0851.checked
    ⟨i.val, by rw [size0851]; exact i.isLt⟩
  change (entry0851 i).check = true at h
  rcases fields0851 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0852 : OriginalRow227TriangleForward0852.entries.size = 32 := rfl

def entry0852 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0852.entries[i.val]'(by rw [size0852]; exact i.isLt)

theorem fields0852 (i : Fin 32) :
    (entry0852 i).IA = shift ∧ (entry0852 i).ID = S (187 + i.val + 1) ∧
      (entry0852 i).IC = S 60 ∧ (entry0852 i).Inext = T 59 (187 + i.val + 1) ∧
      (entry0852 i).Icur = T 59 (187 + i.val) ∧
      (entry0852 i).output = T 60 (187 + i.val) ∧
      (entry0852 i).charge = charge 59 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0855_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0868_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0852 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 60) (T 59 (187 + i.val + 1))
      (T 59 (187 + i.val)) (T 60 (187 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0852.entries OriginalRow227TriangleForward0852.checked
    ⟨i.val, by rw [size0852]; exact i.isLt⟩
  change (entry0852 i).check = true at h
  rcases fields0852 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0853 : OriginalRow227TriangleForward0853.entries.size = 32 := rfl

def entry0853 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0853.entries[i.val]'(by rw [size0853]; exact i.isLt)

theorem fields0853 (i : Fin 32) :
    (entry0853 i).IA = shift ∧ (entry0853 i).ID = S (219 + i.val + 1) ∧
      (entry0853 i).IC = S 60 ∧ (entry0853 i).Inext = T 59 (219 + i.val + 1) ∧
      (entry0853 i).Icur = T 59 (219 + i.val) ∧
      (entry0853 i).output = T 60 (219 + i.val) ∧
      (entry0853 i).charge = charge 59 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0856_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0869_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0853 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 60) (T 59 (219 + i.val + 1))
      (T 59 (219 + i.val)) (T 60 (219 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0853.entries OriginalRow227TriangleForward0853.checked
    ⟨i.val, by rw [size0853]; exact i.isLt⟩
  change (entry0853 i).check = true at h
  rcases fields0853 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0854 : OriginalRow227TriangleForward0854.entries.size = 32 := rfl

def entry0854 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0854.entries[i.val]'(by rw [size0854]; exact i.isLt)

theorem fields0854 (i : Fin 32) :
    (entry0854 i).IA = shift ∧ (entry0854 i).ID = S (251 + i.val + 1) ∧
      (entry0854 i).IC = S 60 ∧ (entry0854 i).Inext = T 59 (251 + i.val + 1) ∧
      (entry0854 i).Icur = T 59 (251 + i.val) ∧
      (entry0854 i).output = T 60 (251 + i.val) ∧
      (entry0854 i).charge = charge 59 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0857_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0870_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0854 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 60) (T 59 (251 + i.val + 1))
      (T 59 (251 + i.val)) (T 60 (251 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0854.entries OriginalRow227TriangleForward0854.checked
    ⟨i.val, by rw [size0854]; exact i.isLt⟩
  change (entry0854 i).check = true at h
  rcases fields0854 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0855 : OriginalRow227TriangleForward0855.entries.size = 32 := rfl

def entry0855 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0855.entries[i.val]'(by rw [size0855]; exact i.isLt)

theorem fields0855 (i : Fin 32) :
    (entry0855 i).IA = shift ∧ (entry0855 i).ID = S (283 + i.val + 1) ∧
      (entry0855 i).IC = S 60 ∧ (entry0855 i).Inext = T 59 (283 + i.val + 1) ∧
      (entry0855 i).Icur = T 59 (283 + i.val) ∧
      (entry0855 i).output = T 60 (283 + i.val) ∧
      (entry0855 i).charge = charge 59 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0858_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0871_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0855 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 60) (T 59 (283 + i.val + 1))
      (T 59 (283 + i.val)) (T 60 (283 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0855.entries OriginalRow227TriangleForward0855.checked
    ⟨i.val, by rw [size0855]; exact i.isLt⟩
  change (entry0855 i).check = true at h
  rcases fields0855 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0856 : OriginalRow227TriangleForward0856.entries.size = 32 := rfl

def entry0856 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0856.entries[i.val]'(by rw [size0856]; exact i.isLt)

theorem fields0856 (i : Fin 32) :
    (entry0856 i).IA = shift ∧ (entry0856 i).ID = S (315 + i.val + 1) ∧
      (entry0856 i).IC = S 60 ∧ (entry0856 i).Inext = T 59 (315 + i.val + 1) ∧
      (entry0856 i).Icur = T 59 (315 + i.val) ∧
      (entry0856 i).output = T 60 (315 + i.val) ∧
      (entry0856 i).charge = charge 59 (315 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0859_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0872_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0856 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (315 + i.val)) shift
      (S (315 + i.val + 1)) (S 60) (T 59 (315 + i.val + 1))
      (T 59 (315 + i.val)) (T 60 (315 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0856.entries OriginalRow227TriangleForward0856.checked
    ⟨i.val, by rw [size0856]; exact i.isLt⟩
  change (entry0856 i).check = true at h
  rcases fields0856 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0857 : OriginalRow227TriangleForward0857.entries.size = 32 := rfl

def entry0857 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0857.entries[i.val]'(by rw [size0857]; exact i.isLt)

theorem fields0857 (i : Fin 32) :
    (entry0857 i).IA = shift ∧ (entry0857 i).ID = S (347 + i.val + 1) ∧
      (entry0857 i).IC = S 60 ∧ (entry0857 i).Inext = T 59 (347 + i.val + 1) ∧
      (entry0857 i).Icur = T 59 (347 + i.val) ∧
      (entry0857 i).output = T 60 (347 + i.val) ∧
      (entry0857 i).charge = charge 59 (347 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0860_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0873_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0857 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (347 + i.val)) shift
      (S (347 + i.val + 1)) (S 60) (T 59 (347 + i.val + 1))
      (T 59 (347 + i.val)) (T 60 (347 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0857.entries OriginalRow227TriangleForward0857.checked
    ⟨i.val, by rw [size0857]; exact i.isLt⟩
  change (entry0857 i).check = true at h
  rcases fields0857 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0858 : OriginalRow227TriangleForward0858.entries.size = 32 := rfl

def entry0858 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0858.entries[i.val]'(by rw [size0858]; exact i.isLt)

theorem fields0858 (i : Fin 32) :
    (entry0858 i).IA = shift ∧ (entry0858 i).ID = S (379 + i.val + 1) ∧
      (entry0858 i).IC = S 60 ∧ (entry0858 i).Inext = T 59 (379 + i.val + 1) ∧
      (entry0858 i).Icur = T 59 (379 + i.val) ∧
      (entry0858 i).output = T 60 (379 + i.val) ∧
      (entry0858 i).charge = charge 59 (379 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0861_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0874_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0858 (i : Fin 32) :
    forwardStepOK (-768) (charge 59 (379 + i.val)) shift
      (S (379 + i.val + 1)) (S 60) (T 59 (379 + i.val + 1))
      (T 59 (379 + i.val)) (T 60 (379 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0858.entries OriginalRow227TriangleForward0858.checked
    ⟨i.val, by rw [size0858]; exact i.isLt⟩
  change (entry0858 i).check = true at h
  rcases fields0858 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0859 : OriginalRow227TriangleForward0859.entries.size = 31 := rfl

def entry0859 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0859.entries[i.val]'(by rw [size0859]; exact i.isLt)

theorem fields0859 (i : Fin 31) :
    (entry0859 i).IA = shift ∧ (entry0859 i).ID = S (411 + i.val + 1) ∧
      (entry0859 i).IC = S 60 ∧ (entry0859 i).Inext = T 59 (411 + i.val + 1) ∧
      (entry0859 i).Icur = T 59 (411 + i.val) ∧
      (entry0859 i).output = T 60 (411 + i.val) ∧
      (entry0859 i).charge = charge 59 (411 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root60).symm,
      (OriginalRow227TriangleBindingsRow059.block0863_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow059.block0862_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow060.block0875_value ⟨30, by decide⟩).symm, rfl⟩

theorem step0859 (i : Fin 31) :
    forwardStepOK (-768) (charge 59 (411 + i.val)) shift
      (S (411 + i.val + 1)) (S 60) (T 59 (411 + i.val + 1))
      (T 59 (411 + i.val)) (T 60 (411 + i.val))
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0859.entries OriginalRow227TriangleForward0859.checked
    ⟨i.val, by rw [size0859]; exact i.isLt⟩
  change (entry0859 i).check = true at h
  rcases fields0859 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 59 ≤ d) (hhi : d < 442) :
    forwardStepOK (-768) (charge 59 d) shift (S (d + 1)) (S 60)
      (T 59 (d + 1)) (T 59 d) (T 60 d)
      (OriginalRow227Roots.root_pos 60 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 59 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h155 : d < 155
    ·
      by_cases h91 : d < 91
      ·
        have hi : d - 59 < 32 := by omega
        have heq : 59 + (d - 59) = d := by omega
        simpa only [heq] using step0848 ⟨d - 59, hi⟩
      ·
        by_cases h123 : d < 123
        ·
          have hi : d - 91 < 32 := by omega
          have heq : 91 + (d - 91) = d := by omega
          simpa only [heq] using step0849 ⟨d - 91, hi⟩
        ·
          have hi : d - 123 < 32 := by omega
          have heq : 123 + (d - 123) = d := by omega
          simpa only [heq] using step0850 ⟨d - 123, hi⟩
    ·
      by_cases h187 : d < 187
      ·
        have hi : d - 155 < 32 := by omega
        have heq : 155 + (d - 155) = d := by omega
        simpa only [heq] using step0851 ⟨d - 155, hi⟩
      ·
        by_cases h219 : d < 219
        ·
          have hi : d - 187 < 32 := by omega
          have heq : 187 + (d - 187) = d := by omega
          simpa only [heq] using step0852 ⟨d - 187, hi⟩
        ·
          have hi : d - 219 < 32 := by omega
          have heq : 219 + (d - 219) = d := by omega
          simpa only [heq] using step0853 ⟨d - 219, hi⟩
  ·
    by_cases h347 : d < 347
    ·
      by_cases h283 : d < 283
      ·
        have hi : d - 251 < 32 := by omega
        have heq : 251 + (d - 251) = d := by omega
        simpa only [heq] using step0854 ⟨d - 251, hi⟩
      ·
        by_cases h315 : d < 315
        ·
          have hi : d - 283 < 32 := by omega
          have heq : 283 + (d - 283) = d := by omega
          simpa only [heq] using step0855 ⟨d - 283, hi⟩
        ·
          have hi : d - 315 < 32 := by omega
          have heq : 315 + (d - 315) = d := by omega
          simpa only [heq] using step0856 ⟨d - 315, hi⟩
    ·
      by_cases h379 : d < 379
      ·
        have hi : d - 347 < 32 := by omega
        have heq : 347 + (d - 347) = d := by omega
        simpa only [heq] using step0857 ⟨d - 347, hi⟩
      ·
        by_cases h411 : d < 411
        ·
          have hi : d - 379 < 32 := by omega
          have heq : 379 + (d - 379) = d := by omega
          simpa only [heq] using step0858 ⟨d - 379, hi⟩
        ·
          have hi : d - 411 < 31 := by omega
          have heq : 411 + (d - 411) = d := by omega
          simpa only [heq] using step0859 ⟨d - 411, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0848,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0848,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0849,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0849,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0850,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0850,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0851,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0851,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0852,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0852,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0853,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0853,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0854,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0854,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0855,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0855,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0856,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0856,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0857,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0857,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0858,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0858,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.fields0859,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.step0859,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow060
