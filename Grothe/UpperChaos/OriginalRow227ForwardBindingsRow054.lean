import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow053
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow054
import Grothe.UpperChaos.OriginalRow227TriangleForward0770
import Grothe.UpperChaos.OriginalRow227TriangleForward0771
import Grothe.UpperChaos.OriginalRow227TriangleForward0772
import Grothe.UpperChaos.OriginalRow227TriangleForward0773
import Grothe.UpperChaos.OriginalRow227TriangleForward0774
import Grothe.UpperChaos.OriginalRow227TriangleForward0775
import Grothe.UpperChaos.OriginalRow227TriangleForward0776
import Grothe.UpperChaos.OriginalRow227TriangleForward0777
import Grothe.UpperChaos.OriginalRow227TriangleForward0778
import Grothe.UpperChaos.OriginalRow227TriangleForward0779
import Grothe.UpperChaos.OriginalRow227TriangleForward0780
import Grothe.UpperChaos.OriginalRow227TriangleForward0781
import Grothe.UpperChaos.OriginalRow227TriangleForward0782

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0770 : OriginalRow227TriangleForward0770.entries.size = 32 := rfl

def entry0770 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0770.entries[i.val]'(by rw [size0770]; exact i.isLt)

theorem fields0770 (i : Fin 32) :
    (entry0770 i).IA = shift ∧ (entry0770 i).ID = S (53 + i.val + 1) ∧
      (entry0770 i).IC = S 54 ∧ (entry0770 i).Inext = T 53 (53 + i.val + 1) ∧
      (entry0770 i).Icur = T 53 (53 + i.val) ∧
      (entry0770 i).output = T 54 (53 + i.val) ∧
      (entry0770 i).charge = charge 53 (53 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root54).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0773_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0770 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (53 + i.val)) shift
      (S (53 + i.val + 1)) (S 54) (T 53 (53 + i.val + 1))
      (T 53 (53 + i.val)) (T 54 (53 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0770.entries OriginalRow227TriangleForward0770.checked
    ⟨i.val, by rw [size0770]; exact i.isLt⟩
  change (entry0770 i).check = true at h
  rcases fields0770 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0771 : OriginalRow227TriangleForward0771.entries.size = 32 := rfl

def entry0771 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0771.entries[i.val]'(by rw [size0771]; exact i.isLt)

theorem fields0771 (i : Fin 32) :
    (entry0771 i).IA = shift ∧ (entry0771 i).ID = S (85 + i.val + 1) ∧
      (entry0771 i).IC = S 54 ∧ (entry0771 i).Inext = T 53 (85 + i.val + 1) ∧
      (entry0771 i).Icur = T 53 (85 + i.val) ∧
      (entry0771 i).output = T 54 (85 + i.val) ∧
      (entry0771 i).charge = charge 53 (85 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0774_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0771 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (85 + i.val)) shift
      (S (85 + i.val + 1)) (S 54) (T 53 (85 + i.val + 1))
      (T 53 (85 + i.val)) (T 54 (85 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0771.entries OriginalRow227TriangleForward0771.checked
    ⟨i.val, by rw [size0771]; exact i.isLt⟩
  change (entry0771 i).check = true at h
  rcases fields0771 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0772 : OriginalRow227TriangleForward0772.entries.size = 32 := rfl

def entry0772 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0772.entries[i.val]'(by rw [size0772]; exact i.isLt)

theorem fields0772 (i : Fin 32) :
    (entry0772 i).IA = shift ∧ (entry0772 i).ID = S (117 + i.val + 1) ∧
      (entry0772 i).IC = S 54 ∧ (entry0772 i).Inext = T 53 (117 + i.val + 1) ∧
      (entry0772 i).Icur = T 53 (117 + i.val) ∧
      (entry0772 i).output = T 54 (117 + i.val) ∧
      (entry0772 i).charge = charge 53 (117 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0775_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0772 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (117 + i.val)) shift
      (S (117 + i.val + 1)) (S 54) (T 53 (117 + i.val + 1))
      (T 53 (117 + i.val)) (T 54 (117 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0772.entries OriginalRow227TriangleForward0772.checked
    ⟨i.val, by rw [size0772]; exact i.isLt⟩
  change (entry0772 i).check = true at h
  rcases fields0772 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0773 : OriginalRow227TriangleForward0773.entries.size = 32 := rfl

def entry0773 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0773.entries[i.val]'(by rw [size0773]; exact i.isLt)

theorem fields0773 (i : Fin 32) :
    (entry0773 i).IA = shift ∧ (entry0773 i).ID = S (149 + i.val + 1) ∧
      (entry0773 i).IC = S 54 ∧ (entry0773 i).Inext = T 53 (149 + i.val + 1) ∧
      (entry0773 i).Icur = T 53 (149 + i.val) ∧
      (entry0773 i).output = T 54 (149 + i.val) ∧
      (entry0773 i).charge = charge 53 (149 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0776_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0773 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (149 + i.val)) shift
      (S (149 + i.val + 1)) (S 54) (T 53 (149 + i.val + 1))
      (T 53 (149 + i.val)) (T 54 (149 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0773.entries OriginalRow227TriangleForward0773.checked
    ⟨i.val, by rw [size0773]; exact i.isLt⟩
  change (entry0773 i).check = true at h
  rcases fields0773 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0774 : OriginalRow227TriangleForward0774.entries.size = 32 := rfl

def entry0774 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0774.entries[i.val]'(by rw [size0774]; exact i.isLt)

theorem fields0774 (i : Fin 32) :
    (entry0774 i).IA = shift ∧ (entry0774 i).ID = S (181 + i.val + 1) ∧
      (entry0774 i).IC = S 54 ∧ (entry0774 i).Inext = T 53 (181 + i.val + 1) ∧
      (entry0774 i).Icur = T 53 (181 + i.val) ∧
      (entry0774 i).output = T 54 (181 + i.val) ∧
      (entry0774 i).charge = charge 53 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0777_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0774 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 54) (T 53 (181 + i.val + 1))
      (T 53 (181 + i.val)) (T 54 (181 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0774.entries OriginalRow227TriangleForward0774.checked
    ⟨i.val, by rw [size0774]; exact i.isLt⟩
  change (entry0774 i).check = true at h
  rcases fields0774 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0775 : OriginalRow227TriangleForward0775.entries.size = 32 := rfl

def entry0775 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0775.entries[i.val]'(by rw [size0775]; exact i.isLt)

theorem fields0775 (i : Fin 32) :
    (entry0775 i).IA = shift ∧ (entry0775 i).ID = S (213 + i.val + 1) ∧
      (entry0775 i).IC = S 54 ∧ (entry0775 i).Inext = T 53 (213 + i.val + 1) ∧
      (entry0775 i).Icur = T 53 (213 + i.val) ∧
      (entry0775 i).output = T 54 (213 + i.val) ∧
      (entry0775 i).charge = charge 53 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0778_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0775 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 54) (T 53 (213 + i.val + 1))
      (T 53 (213 + i.val)) (T 54 (213 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0775.entries OriginalRow227TriangleForward0775.checked
    ⟨i.val, by rw [size0775]; exact i.isLt⟩
  change (entry0775 i).check = true at h
  rcases fields0775 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0776 : OriginalRow227TriangleForward0776.entries.size = 32 := rfl

def entry0776 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0776.entries[i.val]'(by rw [size0776]; exact i.isLt)

theorem fields0776 (i : Fin 32) :
    (entry0776 i).IA = shift ∧ (entry0776 i).ID = S (245 + i.val + 1) ∧
      (entry0776 i).IC = S 54 ∧ (entry0776 i).Inext = T 53 (245 + i.val + 1) ∧
      (entry0776 i).Icur = T 53 (245 + i.val) ∧
      (entry0776 i).output = T 54 (245 + i.val) ∧
      (entry0776 i).charge = charge 53 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0779_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0776 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 54) (T 53 (245 + i.val + 1))
      (T 53 (245 + i.val)) (T 54 (245 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0776.entries OriginalRow227TriangleForward0776.checked
    ⟨i.val, by rw [size0776]; exact i.isLt⟩
  change (entry0776 i).check = true at h
  rcases fields0776 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0777 : OriginalRow227TriangleForward0777.entries.size = 32 := rfl

def entry0777 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0777.entries[i.val]'(by rw [size0777]; exact i.isLt)

theorem fields0777 (i : Fin 32) :
    (entry0777 i).IA = shift ∧ (entry0777 i).ID = S (277 + i.val + 1) ∧
      (entry0777 i).IC = S 54 ∧ (entry0777 i).Inext = T 53 (277 + i.val + 1) ∧
      (entry0777 i).Icur = T 53 (277 + i.val) ∧
      (entry0777 i).output = T 54 (277 + i.val) ∧
      (entry0777 i).charge = charge 53 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0780_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0777 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 54) (T 53 (277 + i.val + 1))
      (T 53 (277 + i.val)) (T 54 (277 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0777.entries OriginalRow227TriangleForward0777.checked
    ⟨i.val, by rw [size0777]; exact i.isLt⟩
  change (entry0777 i).check = true at h
  rcases fields0777 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0778 : OriginalRow227TriangleForward0778.entries.size = 32 := rfl

def entry0778 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0778.entries[i.val]'(by rw [size0778]; exact i.isLt)

theorem fields0778 (i : Fin 32) :
    (entry0778 i).IA = shift ∧ (entry0778 i).ID = S (309 + i.val + 1) ∧
      (entry0778 i).IC = S 54 ∧ (entry0778 i).Inext = T 53 (309 + i.val + 1) ∧
      (entry0778 i).Icur = T 53 (309 + i.val) ∧
      (entry0778 i).output = T 54 (309 + i.val) ∧
      (entry0778 i).charge = charge 53 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0781_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0778 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 54) (T 53 (309 + i.val + 1))
      (T 53 (309 + i.val)) (T 54 (309 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0778.entries OriginalRow227TriangleForward0778.checked
    ⟨i.val, by rw [size0778]; exact i.isLt⟩
  change (entry0778 i).check = true at h
  rcases fields0778 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0779 : OriginalRow227TriangleForward0779.entries.size = 32 := rfl

def entry0779 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0779.entries[i.val]'(by rw [size0779]; exact i.isLt)

theorem fields0779 (i : Fin 32) :
    (entry0779 i).IA = shift ∧ (entry0779 i).ID = S (341 + i.val + 1) ∧
      (entry0779 i).IC = S 54 ∧ (entry0779 i).Inext = T 53 (341 + i.val + 1) ∧
      (entry0779 i).Icur = T 53 (341 + i.val) ∧
      (entry0779 i).output = T 54 (341 + i.val) ∧
      (entry0779 i).charge = charge 53 (341 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0782_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0779 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (341 + i.val)) shift
      (S (341 + i.val + 1)) (S 54) (T 53 (341 + i.val + 1))
      (T 53 (341 + i.val)) (T 54 (341 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0779.entries OriginalRow227TriangleForward0779.checked
    ⟨i.val, by rw [size0779]; exact i.isLt⟩
  change (entry0779 i).check = true at h
  rcases fields0779 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0780 : OriginalRow227TriangleForward0780.entries.size = 32 := rfl

def entry0780 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0780.entries[i.val]'(by rw [size0780]; exact i.isLt)

theorem fields0780 (i : Fin 32) :
    (entry0780 i).IA = shift ∧ (entry0780 i).ID = S (373 + i.val + 1) ∧
      (entry0780 i).IC = S 54 ∧ (entry0780 i).Inext = T 53 (373 + i.val + 1) ∧
      (entry0780 i).Icur = T 53 (373 + i.val) ∧
      (entry0780 i).output = T 54 (373 + i.val) ∧
      (entry0780 i).charge = charge 53 (373 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0783_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0780 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (373 + i.val)) shift
      (S (373 + i.val + 1)) (S 54) (T 53 (373 + i.val + 1))
      (T 53 (373 + i.val)) (T 54 (373 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0780.entries OriginalRow227TriangleForward0780.checked
    ⟨i.val, by rw [size0780]; exact i.isLt⟩
  change (entry0780 i).check = true at h
  rcases fields0780 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0781 : OriginalRow227TriangleForward0781.entries.size = 32 := rfl

def entry0781 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0781.entries[i.val]'(by rw [size0781]; exact i.isLt)

theorem fields0781 (i : Fin 32) :
    (entry0781 i).IA = shift ∧ (entry0781 i).ID = S (405 + i.val + 1) ∧
      (entry0781 i).IC = S 54 ∧ (entry0781 i).Inext = T 53 (405 + i.val + 1) ∧
      (entry0781 i).Icur = T 53 (405 + i.val) ∧
      (entry0781 i).output = T 54 (405 + i.val) ∧
      (entry0781 i).charge = charge 53 (405 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0784_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0781 (i : Fin 32) :
    forwardStepOK (-768) (charge 53 (405 + i.val)) shift
      (S (405 + i.val + 1)) (S 54) (T 53 (405 + i.val + 1))
      (T 53 (405 + i.val)) (T 54 (405 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0781.entries OriginalRow227TriangleForward0781.checked
    ⟨i.val, by rw [size0781]; exact i.isLt⟩
  change (entry0781 i).check = true at h
  rcases fields0781 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0782 : OriginalRow227TriangleForward0782.entries.size = 11 := rfl

def entry0782 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0782.entries[i.val]'(by rw [size0782]; exact i.isLt)

theorem fields0782 (i : Fin 11) :
    (entry0782 i).IA = shift ∧ (entry0782 i).ID = S (437 + i.val + 1) ∧
      (entry0782 i).IC = S 54 ∧ (entry0782 i).Inext = T 53 (437 + i.val + 1) ∧
      (entry0782 i).Icur = T 53 (437 + i.val) ∧
      (entry0782 i).output = T 54 (437 + i.val) ∧
      (entry0782 i).charge = charge 53 (437 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root448).symm, (OriginalRow227RootBindings01.S_eq_root54).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow053.block0785_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨10, by decide⟩).symm, rfl⟩

theorem step0782 (i : Fin 11) :
    forwardStepOK (-768) (charge 53 (437 + i.val)) shift
      (S (437 + i.val + 1)) (S 54) (T 53 (437 + i.val + 1))
      (T 53 (437 + i.val)) (T 54 (437 + i.val))
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0782.entries OriginalRow227TriangleForward0782.checked
    ⟨i.val, by rw [size0782]; exact i.isLt⟩
  change (entry0782 i).check = true at h
  rcases fields0782 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 53 ≤ d) (hhi : d < 448) :
    forwardStepOK (-768) (charge 53 d) shift (S (d + 1)) (S 54)
      (T 53 (d + 1)) (T 53 d) (T 54 d)
      (OriginalRow227Roots.root_pos 54 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 53 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h149 : d < 149
    ·
      by_cases h85 : d < 85
      ·
        have hi : d - 53 < 32 := by omega
        have heq : 53 + (d - 53) = d := by omega
        simpa only [heq] using step0770 ⟨d - 53, hi⟩
      ·
        by_cases h117 : d < 117
        ·
          have hi : d - 85 < 32 := by omega
          have heq : 85 + (d - 85) = d := by omega
          simpa only [heq] using step0771 ⟨d - 85, hi⟩
        ·
          have hi : d - 117 < 32 := by omega
          have heq : 117 + (d - 117) = d := by omega
          simpa only [heq] using step0772 ⟨d - 117, hi⟩
    ·
      by_cases h181 : d < 181
      ·
        have hi : d - 149 < 32 := by omega
        have heq : 149 + (d - 149) = d := by omega
        simpa only [heq] using step0773 ⟨d - 149, hi⟩
      ·
        by_cases h213 : d < 213
        ·
          have hi : d - 181 < 32 := by omega
          have heq : 181 + (d - 181) = d := by omega
          simpa only [heq] using step0774 ⟨d - 181, hi⟩
        ·
          have hi : d - 213 < 32 := by omega
          have heq : 213 + (d - 213) = d := by omega
          simpa only [heq] using step0775 ⟨d - 213, hi⟩
  ·
    by_cases h341 : d < 341
    ·
      by_cases h277 : d < 277
      ·
        have hi : d - 245 < 32 := by omega
        have heq : 245 + (d - 245) = d := by omega
        simpa only [heq] using step0776 ⟨d - 245, hi⟩
      ·
        by_cases h309 : d < 309
        ·
          have hi : d - 277 < 32 := by omega
          have heq : 277 + (d - 277) = d := by omega
          simpa only [heq] using step0777 ⟨d - 277, hi⟩
        ·
          have hi : d - 309 < 32 := by omega
          have heq : 309 + (d - 309) = d := by omega
          simpa only [heq] using step0778 ⟨d - 309, hi⟩
    ·
      by_cases h405 : d < 405
      ·
        by_cases h373 : d < 373
        ·
          have hi : d - 341 < 32 := by omega
          have heq : 341 + (d - 341) = d := by omega
          simpa only [heq] using step0779 ⟨d - 341, hi⟩
        ·
          have hi : d - 373 < 32 := by omega
          have heq : 373 + (d - 373) = d := by omega
          simpa only [heq] using step0780 ⟨d - 373, hi⟩
      ·
        by_cases h437 : d < 437
        ·
          have hi : d - 405 < 32 := by omega
          have heq : 405 + (d - 405) = d := by omega
          simpa only [heq] using step0781 ⟨d - 405, hi⟩
        ·
          have hi : d - 437 < 11 := by omega
          have heq : 437 + (d - 437) = d := by omega
          simpa only [heq] using step0782 ⟨d - 437, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0770,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0770,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0771,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0771,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0772,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0772,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0773,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0773,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0774,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0774,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0775,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0775,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0776,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0776,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0777,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0777,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0778,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0778,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0779,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0779,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0780,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0780,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0781,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0781,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.fields0782,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.step0782,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow054
