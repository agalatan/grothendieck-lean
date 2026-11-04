import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow054
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055
import Grothe.UpperChaos.OriginalRow227TriangleForward0783
import Grothe.UpperChaos.OriginalRow227TriangleForward0784
import Grothe.UpperChaos.OriginalRow227TriangleForward0785
import Grothe.UpperChaos.OriginalRow227TriangleForward0786
import Grothe.UpperChaos.OriginalRow227TriangleForward0787
import Grothe.UpperChaos.OriginalRow227TriangleForward0788
import Grothe.UpperChaos.OriginalRow227TriangleForward0789
import Grothe.UpperChaos.OriginalRow227TriangleForward0790
import Grothe.UpperChaos.OriginalRow227TriangleForward0791
import Grothe.UpperChaos.OriginalRow227TriangleForward0792
import Grothe.UpperChaos.OriginalRow227TriangleForward0793
import Grothe.UpperChaos.OriginalRow227TriangleForward0794
import Grothe.UpperChaos.OriginalRow227TriangleForward0795

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0783 : OriginalRow227TriangleForward0783.entries.size = 32 := rfl

def entry0783 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0783.entries[i.val]'(by rw [size0783]; exact i.isLt)

theorem fields0783 (i : Fin 32) :
    (entry0783 i).IA = shift ∧ (entry0783 i).ID = S (54 + i.val + 1) ∧
      (entry0783 i).IC = S 55 ∧ (entry0783 i).Inext = T 54 (54 + i.val + 1) ∧
      (entry0783 i).Icur = T 54 (54 + i.val) ∧
      (entry0783 i).output = T 55 (54 + i.val) ∧
      (entry0783 i).charge = charge 54 (54 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root55).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0786_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0783 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (54 + i.val)) shift
      (S (54 + i.val + 1)) (S 55) (T 54 (54 + i.val + 1))
      (T 54 (54 + i.val)) (T 55 (54 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0783.entries OriginalRow227TriangleForward0783.checked
    ⟨i.val, by rw [size0783]; exact i.isLt⟩
  change (entry0783 i).check = true at h
  rcases fields0783 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0784 : OriginalRow227TriangleForward0784.entries.size = 32 := rfl

def entry0784 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0784.entries[i.val]'(by rw [size0784]; exact i.isLt)

theorem fields0784 (i : Fin 32) :
    (entry0784 i).IA = shift ∧ (entry0784 i).ID = S (86 + i.val + 1) ∧
      (entry0784 i).IC = S 55 ∧ (entry0784 i).Inext = T 54 (86 + i.val + 1) ∧
      (entry0784 i).Icur = T 54 (86 + i.val) ∧
      (entry0784 i).output = T 55 (86 + i.val) ∧
      (entry0784 i).charge = charge 54 (86 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0787_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0784 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (86 + i.val)) shift
      (S (86 + i.val + 1)) (S 55) (T 54 (86 + i.val + 1))
      (T 54 (86 + i.val)) (T 55 (86 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0784.entries OriginalRow227TriangleForward0784.checked
    ⟨i.val, by rw [size0784]; exact i.isLt⟩
  change (entry0784 i).check = true at h
  rcases fields0784 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0785 : OriginalRow227TriangleForward0785.entries.size = 32 := rfl

def entry0785 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0785.entries[i.val]'(by rw [size0785]; exact i.isLt)

theorem fields0785 (i : Fin 32) :
    (entry0785 i).IA = shift ∧ (entry0785 i).ID = S (118 + i.val + 1) ∧
      (entry0785 i).IC = S 55 ∧ (entry0785 i).Inext = T 54 (118 + i.val + 1) ∧
      (entry0785 i).Icur = T 54 (118 + i.val) ∧
      (entry0785 i).output = T 55 (118 + i.val) ∧
      (entry0785 i).charge = charge 54 (118 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0788_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0785 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (118 + i.val)) shift
      (S (118 + i.val + 1)) (S 55) (T 54 (118 + i.val + 1))
      (T 54 (118 + i.val)) (T 55 (118 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0785.entries OriginalRow227TriangleForward0785.checked
    ⟨i.val, by rw [size0785]; exact i.isLt⟩
  change (entry0785 i).check = true at h
  rcases fields0785 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0786 : OriginalRow227TriangleForward0786.entries.size = 32 := rfl

def entry0786 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0786.entries[i.val]'(by rw [size0786]; exact i.isLt)

theorem fields0786 (i : Fin 32) :
    (entry0786 i).IA = shift ∧ (entry0786 i).ID = S (150 + i.val + 1) ∧
      (entry0786 i).IC = S 55 ∧ (entry0786 i).Inext = T 54 (150 + i.val + 1) ∧
      (entry0786 i).Icur = T 54 (150 + i.val) ∧
      (entry0786 i).output = T 55 (150 + i.val) ∧
      (entry0786 i).charge = charge 54 (150 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0789_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0786 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (150 + i.val)) shift
      (S (150 + i.val + 1)) (S 55) (T 54 (150 + i.val + 1))
      (T 54 (150 + i.val)) (T 55 (150 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0786.entries OriginalRow227TriangleForward0786.checked
    ⟨i.val, by rw [size0786]; exact i.isLt⟩
  change (entry0786 i).check = true at h
  rcases fields0786 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0787 : OriginalRow227TriangleForward0787.entries.size = 32 := rfl

def entry0787 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0787.entries[i.val]'(by rw [size0787]; exact i.isLt)

theorem fields0787 (i : Fin 32) :
    (entry0787 i).IA = shift ∧ (entry0787 i).ID = S (182 + i.val + 1) ∧
      (entry0787 i).IC = S 55 ∧ (entry0787 i).Inext = T 54 (182 + i.val + 1) ∧
      (entry0787 i).Icur = T 54 (182 + i.val) ∧
      (entry0787 i).output = T 55 (182 + i.val) ∧
      (entry0787 i).charge = charge 54 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0790_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0787 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 55) (T 54 (182 + i.val + 1))
      (T 54 (182 + i.val)) (T 55 (182 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0787.entries OriginalRow227TriangleForward0787.checked
    ⟨i.val, by rw [size0787]; exact i.isLt⟩
  change (entry0787 i).check = true at h
  rcases fields0787 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0788 : OriginalRow227TriangleForward0788.entries.size = 32 := rfl

def entry0788 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0788.entries[i.val]'(by rw [size0788]; exact i.isLt)

theorem fields0788 (i : Fin 32) :
    (entry0788 i).IA = shift ∧ (entry0788 i).ID = S (214 + i.val + 1) ∧
      (entry0788 i).IC = S 55 ∧ (entry0788 i).Inext = T 54 (214 + i.val + 1) ∧
      (entry0788 i).Icur = T 54 (214 + i.val) ∧
      (entry0788 i).output = T 55 (214 + i.val) ∧
      (entry0788 i).charge = charge 54 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0791_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0788 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 55) (T 54 (214 + i.val + 1))
      (T 54 (214 + i.val)) (T 55 (214 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0788.entries OriginalRow227TriangleForward0788.checked
    ⟨i.val, by rw [size0788]; exact i.isLt⟩
  change (entry0788 i).check = true at h
  rcases fields0788 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0789 : OriginalRow227TriangleForward0789.entries.size = 32 := rfl

def entry0789 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0789.entries[i.val]'(by rw [size0789]; exact i.isLt)

theorem fields0789 (i : Fin 32) :
    (entry0789 i).IA = shift ∧ (entry0789 i).ID = S (246 + i.val + 1) ∧
      (entry0789 i).IC = S 55 ∧ (entry0789 i).Inext = T 54 (246 + i.val + 1) ∧
      (entry0789 i).Icur = T 54 (246 + i.val) ∧
      (entry0789 i).output = T 55 (246 + i.val) ∧
      (entry0789 i).charge = charge 54 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0792_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0789 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 55) (T 54 (246 + i.val + 1))
      (T 54 (246 + i.val)) (T 55 (246 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0789.entries OriginalRow227TriangleForward0789.checked
    ⟨i.val, by rw [size0789]; exact i.isLt⟩
  change (entry0789 i).check = true at h
  rcases fields0789 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0790 : OriginalRow227TriangleForward0790.entries.size = 32 := rfl

def entry0790 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0790.entries[i.val]'(by rw [size0790]; exact i.isLt)

theorem fields0790 (i : Fin 32) :
    (entry0790 i).IA = shift ∧ (entry0790 i).ID = S (278 + i.val + 1) ∧
      (entry0790 i).IC = S 55 ∧ (entry0790 i).Inext = T 54 (278 + i.val + 1) ∧
      (entry0790 i).Icur = T 54 (278 + i.val) ∧
      (entry0790 i).output = T 55 (278 + i.val) ∧
      (entry0790 i).charge = charge 54 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0793_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0790 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 55) (T 54 (278 + i.val + 1))
      (T 54 (278 + i.val)) (T 55 (278 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0790.entries OriginalRow227TriangleForward0790.checked
    ⟨i.val, by rw [size0790]; exact i.isLt⟩
  change (entry0790 i).check = true at h
  rcases fields0790 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0791 : OriginalRow227TriangleForward0791.entries.size = 32 := rfl

def entry0791 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0791.entries[i.val]'(by rw [size0791]; exact i.isLt)

theorem fields0791 (i : Fin 32) :
    (entry0791 i).IA = shift ∧ (entry0791 i).ID = S (310 + i.val + 1) ∧
      (entry0791 i).IC = S 55 ∧ (entry0791 i).Inext = T 54 (310 + i.val + 1) ∧
      (entry0791 i).Icur = T 54 (310 + i.val) ∧
      (entry0791 i).output = T 55 (310 + i.val) ∧
      (entry0791 i).charge = charge 54 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0794_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0791 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 55) (T 54 (310 + i.val + 1))
      (T 54 (310 + i.val)) (T 55 (310 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0791.entries OriginalRow227TriangleForward0791.checked
    ⟨i.val, by rw [size0791]; exact i.isLt⟩
  change (entry0791 i).check = true at h
  rcases fields0791 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0792 : OriginalRow227TriangleForward0792.entries.size = 32 := rfl

def entry0792 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0792.entries[i.val]'(by rw [size0792]; exact i.isLt)

theorem fields0792 (i : Fin 32) :
    (entry0792 i).IA = shift ∧ (entry0792 i).ID = S (342 + i.val + 1) ∧
      (entry0792 i).IC = S 55 ∧ (entry0792 i).Inext = T 54 (342 + i.val + 1) ∧
      (entry0792 i).Icur = T 54 (342 + i.val) ∧
      (entry0792 i).output = T 55 (342 + i.val) ∧
      (entry0792 i).charge = charge 54 (342 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0795_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0792 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (342 + i.val)) shift
      (S (342 + i.val + 1)) (S 55) (T 54 (342 + i.val + 1))
      (T 54 (342 + i.val)) (T 55 (342 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0792.entries OriginalRow227TriangleForward0792.checked
    ⟨i.val, by rw [size0792]; exact i.isLt⟩
  change (entry0792 i).check = true at h
  rcases fields0792 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0793 : OriginalRow227TriangleForward0793.entries.size = 32 := rfl

def entry0793 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0793.entries[i.val]'(by rw [size0793]; exact i.isLt)

theorem fields0793 (i : Fin 32) :
    (entry0793 i).IA = shift ∧ (entry0793 i).ID = S (374 + i.val + 1) ∧
      (entry0793 i).IC = S 55 ∧ (entry0793 i).Inext = T 54 (374 + i.val + 1) ∧
      (entry0793 i).Icur = T 54 (374 + i.val) ∧
      (entry0793 i).output = T 55 (374 + i.val) ∧
      (entry0793 i).charge = charge 54 (374 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0796_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0793 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (374 + i.val)) shift
      (S (374 + i.val + 1)) (S 55) (T 54 (374 + i.val + 1))
      (T 54 (374 + i.val)) (T 55 (374 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0793.entries OriginalRow227TriangleForward0793.checked
    ⟨i.val, by rw [size0793]; exact i.isLt⟩
  change (entry0793 i).check = true at h
  rcases fields0793 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0794 : OriginalRow227TriangleForward0794.entries.size = 32 := rfl

def entry0794 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0794.entries[i.val]'(by rw [size0794]; exact i.isLt)

theorem fields0794 (i : Fin 32) :
    (entry0794 i).IA = shift ∧ (entry0794 i).ID = S (406 + i.val + 1) ∧
      (entry0794 i).IC = S 55 ∧ (entry0794 i).Inext = T 54 (406 + i.val + 1) ∧
      (entry0794 i).Icur = T 54 (406 + i.val) ∧
      (entry0794 i).output = T 55 (406 + i.val) ∧
      (entry0794 i).charge = charge 54 (406 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0797_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0794 (i : Fin 32) :
    forwardStepOK (-768) (charge 54 (406 + i.val)) shift
      (S (406 + i.val + 1)) (S 55) (T 54 (406 + i.val + 1))
      (T 54 (406 + i.val)) (T 55 (406 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0794.entries OriginalRow227TriangleForward0794.checked
    ⟨i.val, by rw [size0794]; exact i.isLt⟩
  change (entry0794 i).check = true at h
  rcases fields0794 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0795 : OriginalRow227TriangleForward0795.entries.size = 9 := rfl

def entry0795 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0795.entries[i.val]'(by rw [size0795]; exact i.isLt)

theorem fields0795 (i : Fin 9) :
    (entry0795 i).IA = shift ∧ (entry0795 i).ID = S (438 + i.val + 1) ∧
      (entry0795 i).IC = S 55 ∧ (entry0795 i).Inext = T 54 (438 + i.val + 1) ∧
      (entry0795 i).Icur = T 54 (438 + i.val) ∧
      (entry0795 i).output = T 55 (438 + i.val) ∧
      (entry0795 i).charge = charge 54 (438 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root447).symm, (OriginalRow227RootBindings01.S_eq_root55).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow054.block0798_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨8, by decide⟩).symm, rfl⟩

theorem step0795 (i : Fin 9) :
    forwardStepOK (-768) (charge 54 (438 + i.val)) shift
      (S (438 + i.val + 1)) (S 55) (T 54 (438 + i.val + 1))
      (T 54 (438 + i.val)) (T 55 (438 + i.val))
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0795.entries OriginalRow227TriangleForward0795.checked
    ⟨i.val, by rw [size0795]; exact i.isLt⟩
  change (entry0795 i).check = true at h
  rcases fields0795 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 54 ≤ d) (hhi : d < 447) :
    forwardStepOK (-768) (charge 54 d) shift (S (d + 1)) (S 55)
      (T 54 (d + 1)) (T 54 d) (T 55 d)
      (OriginalRow227Roots.root_pos 55 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 54 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h150 : d < 150
    ·
      by_cases h86 : d < 86
      ·
        have hi : d - 54 < 32 := by omega
        have heq : 54 + (d - 54) = d := by omega
        simpa only [heq] using step0783 ⟨d - 54, hi⟩
      ·
        by_cases h118 : d < 118
        ·
          have hi : d - 86 < 32 := by omega
          have heq : 86 + (d - 86) = d := by omega
          simpa only [heq] using step0784 ⟨d - 86, hi⟩
        ·
          have hi : d - 118 < 32 := by omega
          have heq : 118 + (d - 118) = d := by omega
          simpa only [heq] using step0785 ⟨d - 118, hi⟩
    ·
      by_cases h182 : d < 182
      ·
        have hi : d - 150 < 32 := by omega
        have heq : 150 + (d - 150) = d := by omega
        simpa only [heq] using step0786 ⟨d - 150, hi⟩
      ·
        by_cases h214 : d < 214
        ·
          have hi : d - 182 < 32 := by omega
          have heq : 182 + (d - 182) = d := by omega
          simpa only [heq] using step0787 ⟨d - 182, hi⟩
        ·
          have hi : d - 214 < 32 := by omega
          have heq : 214 + (d - 214) = d := by omega
          simpa only [heq] using step0788 ⟨d - 214, hi⟩
  ·
    by_cases h342 : d < 342
    ·
      by_cases h278 : d < 278
      ·
        have hi : d - 246 < 32 := by omega
        have heq : 246 + (d - 246) = d := by omega
        simpa only [heq] using step0789 ⟨d - 246, hi⟩
      ·
        by_cases h310 : d < 310
        ·
          have hi : d - 278 < 32 := by omega
          have heq : 278 + (d - 278) = d := by omega
          simpa only [heq] using step0790 ⟨d - 278, hi⟩
        ·
          have hi : d - 310 < 32 := by omega
          have heq : 310 + (d - 310) = d := by omega
          simpa only [heq] using step0791 ⟨d - 310, hi⟩
    ·
      by_cases h406 : d < 406
      ·
        by_cases h374 : d < 374
        ·
          have hi : d - 342 < 32 := by omega
          have heq : 342 + (d - 342) = d := by omega
          simpa only [heq] using step0792 ⟨d - 342, hi⟩
        ·
          have hi : d - 374 < 32 := by omega
          have heq : 374 + (d - 374) = d := by omega
          simpa only [heq] using step0793 ⟨d - 374, hi⟩
      ·
        by_cases h438 : d < 438
        ·
          have hi : d - 406 < 32 := by omega
          have heq : 406 + (d - 406) = d := by omega
          simpa only [heq] using step0794 ⟨d - 406, hi⟩
        ·
          have hi : d - 438 < 9 := by omega
          have heq : 438 + (d - 438) = d := by omega
          simpa only [heq] using step0795 ⟨d - 438, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0783,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0783,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0784,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0784,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0785,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0785,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0786,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0786,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0787,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0787,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0788,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0788,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0789,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0789,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0790,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0790,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0791,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0791,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0792,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0792,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0793,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0793,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0794,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0794,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.fields0795,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.step0795,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow055
