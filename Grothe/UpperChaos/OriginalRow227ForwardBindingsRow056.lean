import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow055
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow056
import Grothe.UpperChaos.OriginalRow227TriangleForward0796
import Grothe.UpperChaos.OriginalRow227TriangleForward0797
import Grothe.UpperChaos.OriginalRow227TriangleForward0798
import Grothe.UpperChaos.OriginalRow227TriangleForward0799
import Grothe.UpperChaos.OriginalRow227TriangleForward0800
import Grothe.UpperChaos.OriginalRow227TriangleForward0801
import Grothe.UpperChaos.OriginalRow227TriangleForward0802
import Grothe.UpperChaos.OriginalRow227TriangleForward0803
import Grothe.UpperChaos.OriginalRow227TriangleForward0804
import Grothe.UpperChaos.OriginalRow227TriangleForward0805
import Grothe.UpperChaos.OriginalRow227TriangleForward0806
import Grothe.UpperChaos.OriginalRow227TriangleForward0807
import Grothe.UpperChaos.OriginalRow227TriangleForward0808

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0796 : OriginalRow227TriangleForward0796.entries.size = 32 := rfl

def entry0796 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0796.entries[i.val]'(by rw [size0796]; exact i.isLt)

theorem fields0796 (i : Fin 32) :
    (entry0796 i).IA = shift ∧ (entry0796 i).ID = S (55 + i.val + 1) ∧
      (entry0796 i).IC = S 56 ∧ (entry0796 i).Inext = T 55 (55 + i.val + 1) ∧
      (entry0796 i).Icur = T 55 (55 + i.val) ∧
      (entry0796 i).output = T 56 (55 + i.val) ∧
      (entry0796 i).charge = charge 55 (55 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root56).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root57).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root58).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root59).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root60).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root61).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root62).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root63).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings01.S_eq_root64).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root65).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root66).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root67).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root68).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root69).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root70).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0799_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0812_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0796 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (55 + i.val)) shift
      (S (55 + i.val + 1)) (S 56) (T 55 (55 + i.val + 1))
      (T 55 (55 + i.val)) (T 56 (55 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0796.entries OriginalRow227TriangleForward0796.checked
    ⟨i.val, by rw [size0796]; exact i.isLt⟩
  change (entry0796 i).check = true at h
  rcases fields0796 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0797 : OriginalRow227TriangleForward0797.entries.size = 32 := rfl

def entry0797 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0797.entries[i.val]'(by rw [size0797]; exact i.isLt)

theorem fields0797 (i : Fin 32) :
    (entry0797 i).IA = shift ∧ (entry0797 i).ID = S (87 + i.val + 1) ∧
      (entry0797 i).IC = S 56 ∧ (entry0797 i).Inext = T 55 (87 + i.val + 1) ∧
      (entry0797 i).Icur = T 55 (87 + i.val) ∧
      (entry0797 i).output = T 56 (87 + i.val) ∧
      (entry0797 i).charge = charge 55 (87 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0800_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0813_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0797 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (87 + i.val)) shift
      (S (87 + i.val + 1)) (S 56) (T 55 (87 + i.val + 1))
      (T 55 (87 + i.val)) (T 56 (87 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0797.entries OriginalRow227TriangleForward0797.checked
    ⟨i.val, by rw [size0797]; exact i.isLt⟩
  change (entry0797 i).check = true at h
  rcases fields0797 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0798 : OriginalRow227TriangleForward0798.entries.size = 32 := rfl

def entry0798 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0798.entries[i.val]'(by rw [size0798]; exact i.isLt)

theorem fields0798 (i : Fin 32) :
    (entry0798 i).IA = shift ∧ (entry0798 i).ID = S (119 + i.val + 1) ∧
      (entry0798 i).IC = S 56 ∧ (entry0798 i).Inext = T 55 (119 + i.val + 1) ∧
      (entry0798 i).Icur = T 55 (119 + i.val) ∧
      (entry0798 i).output = T 56 (119 + i.val) ∧
      (entry0798 i).charge = charge 55 (119 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0801_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0814_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0798 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (119 + i.val)) shift
      (S (119 + i.val + 1)) (S 56) (T 55 (119 + i.val + 1))
      (T 55 (119 + i.val)) (T 56 (119 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0798.entries OriginalRow227TriangleForward0798.checked
    ⟨i.val, by rw [size0798]; exact i.isLt⟩
  change (entry0798 i).check = true at h
  rcases fields0798 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0799 : OriginalRow227TriangleForward0799.entries.size = 32 := rfl

def entry0799 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0799.entries[i.val]'(by rw [size0799]; exact i.isLt)

theorem fields0799 (i : Fin 32) :
    (entry0799 i).IA = shift ∧ (entry0799 i).ID = S (151 + i.val + 1) ∧
      (entry0799 i).IC = S 56 ∧ (entry0799 i).Inext = T 55 (151 + i.val + 1) ∧
      (entry0799 i).Icur = T 55 (151 + i.val) ∧
      (entry0799 i).output = T 56 (151 + i.val) ∧
      (entry0799 i).charge = charge 55 (151 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0802_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0815_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0799 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (151 + i.val)) shift
      (S (151 + i.val + 1)) (S 56) (T 55 (151 + i.val + 1))
      (T 55 (151 + i.val)) (T 56 (151 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0799.entries OriginalRow227TriangleForward0799.checked
    ⟨i.val, by rw [size0799]; exact i.isLt⟩
  change (entry0799 i).check = true at h
  rcases fields0799 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0800 : OriginalRow227TriangleForward0800.entries.size = 32 := rfl

def entry0800 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0800.entries[i.val]'(by rw [size0800]; exact i.isLt)

theorem fields0800 (i : Fin 32) :
    (entry0800 i).IA = shift ∧ (entry0800 i).ID = S (183 + i.val + 1) ∧
      (entry0800 i).IC = S 56 ∧ (entry0800 i).Inext = T 55 (183 + i.val + 1) ∧
      (entry0800 i).Icur = T 55 (183 + i.val) ∧
      (entry0800 i).output = T 56 (183 + i.val) ∧
      (entry0800 i).charge = charge 55 (183 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0803_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0816_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0800 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (183 + i.val)) shift
      (S (183 + i.val + 1)) (S 56) (T 55 (183 + i.val + 1))
      (T 55 (183 + i.val)) (T 56 (183 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0800.entries OriginalRow227TriangleForward0800.checked
    ⟨i.val, by rw [size0800]; exact i.isLt⟩
  change (entry0800 i).check = true at h
  rcases fields0800 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0801 : OriginalRow227TriangleForward0801.entries.size = 32 := rfl

def entry0801 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0801.entries[i.val]'(by rw [size0801]; exact i.isLt)

theorem fields0801 (i : Fin 32) :
    (entry0801 i).IA = shift ∧ (entry0801 i).ID = S (215 + i.val + 1) ∧
      (entry0801 i).IC = S 56 ∧ (entry0801 i).Inext = T 55 (215 + i.val + 1) ∧
      (entry0801 i).Icur = T 55 (215 + i.val) ∧
      (entry0801 i).output = T 56 (215 + i.val) ∧
      (entry0801 i).charge = charge 55 (215 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0804_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0817_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0801 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (215 + i.val)) shift
      (S (215 + i.val + 1)) (S 56) (T 55 (215 + i.val + 1))
      (T 55 (215 + i.val)) (T 56 (215 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0801.entries OriginalRow227TriangleForward0801.checked
    ⟨i.val, by rw [size0801]; exact i.isLt⟩
  change (entry0801 i).check = true at h
  rcases fields0801 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0802 : OriginalRow227TriangleForward0802.entries.size = 32 := rfl

def entry0802 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0802.entries[i.val]'(by rw [size0802]; exact i.isLt)

theorem fields0802 (i : Fin 32) :
    (entry0802 i).IA = shift ∧ (entry0802 i).ID = S (247 + i.val + 1) ∧
      (entry0802 i).IC = S 56 ∧ (entry0802 i).Inext = T 55 (247 + i.val + 1) ∧
      (entry0802 i).Icur = T 55 (247 + i.val) ∧
      (entry0802 i).output = T 56 (247 + i.val) ∧
      (entry0802 i).charge = charge 55 (247 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0805_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0818_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0802 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (247 + i.val)) shift
      (S (247 + i.val + 1)) (S 56) (T 55 (247 + i.val + 1))
      (T 55 (247 + i.val)) (T 56 (247 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0802.entries OriginalRow227TriangleForward0802.checked
    ⟨i.val, by rw [size0802]; exact i.isLt⟩
  change (entry0802 i).check = true at h
  rcases fields0802 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0803 : OriginalRow227TriangleForward0803.entries.size = 32 := rfl

def entry0803 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0803.entries[i.val]'(by rw [size0803]; exact i.isLt)

theorem fields0803 (i : Fin 32) :
    (entry0803 i).IA = shift ∧ (entry0803 i).ID = S (279 + i.val + 1) ∧
      (entry0803 i).IC = S 56 ∧ (entry0803 i).Inext = T 55 (279 + i.val + 1) ∧
      (entry0803 i).Icur = T 55 (279 + i.val) ∧
      (entry0803 i).output = T 56 (279 + i.val) ∧
      (entry0803 i).charge = charge 55 (279 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0806_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0819_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0803 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (279 + i.val)) shift
      (S (279 + i.val + 1)) (S 56) (T 55 (279 + i.val + 1))
      (T 55 (279 + i.val)) (T 56 (279 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0803.entries OriginalRow227TriangleForward0803.checked
    ⟨i.val, by rw [size0803]; exact i.isLt⟩
  change (entry0803 i).check = true at h
  rcases fields0803 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0804 : OriginalRow227TriangleForward0804.entries.size = 32 := rfl

def entry0804 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0804.entries[i.val]'(by rw [size0804]; exact i.isLt)

theorem fields0804 (i : Fin 32) :
    (entry0804 i).IA = shift ∧ (entry0804 i).ID = S (311 + i.val + 1) ∧
      (entry0804 i).IC = S 56 ∧ (entry0804 i).Inext = T 55 (311 + i.val + 1) ∧
      (entry0804 i).Icur = T 55 (311 + i.val) ∧
      (entry0804 i).output = T 56 (311 + i.val) ∧
      (entry0804 i).charge = charge 55 (311 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0807_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0820_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0804 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (311 + i.val)) shift
      (S (311 + i.val + 1)) (S 56) (T 55 (311 + i.val + 1))
      (T 55 (311 + i.val)) (T 56 (311 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0804.entries OriginalRow227TriangleForward0804.checked
    ⟨i.val, by rw [size0804]; exact i.isLt⟩
  change (entry0804 i).check = true at h
  rcases fields0804 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0805 : OriginalRow227TriangleForward0805.entries.size = 32 := rfl

def entry0805 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0805.entries[i.val]'(by rw [size0805]; exact i.isLt)

theorem fields0805 (i : Fin 32) :
    (entry0805 i).IA = shift ∧ (entry0805 i).ID = S (343 + i.val + 1) ∧
      (entry0805 i).IC = S 56 ∧ (entry0805 i).Inext = T 55 (343 + i.val + 1) ∧
      (entry0805 i).Icur = T 55 (343 + i.val) ∧
      (entry0805 i).output = T 56 (343 + i.val) ∧
      (entry0805 i).charge = charge 55 (343 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0808_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0821_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0805 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (343 + i.val)) shift
      (S (343 + i.val + 1)) (S 56) (T 55 (343 + i.val + 1))
      (T 55 (343 + i.val)) (T 56 (343 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0805.entries OriginalRow227TriangleForward0805.checked
    ⟨i.val, by rw [size0805]; exact i.isLt⟩
  change (entry0805 i).check = true at h
  rcases fields0805 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0806 : OriginalRow227TriangleForward0806.entries.size = 32 := rfl

def entry0806 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0806.entries[i.val]'(by rw [size0806]; exact i.isLt)

theorem fields0806 (i : Fin 32) :
    (entry0806 i).IA = shift ∧ (entry0806 i).ID = S (375 + i.val + 1) ∧
      (entry0806 i).IC = S 56 ∧ (entry0806 i).Inext = T 55 (375 + i.val + 1) ∧
      (entry0806 i).Icur = T 55 (375 + i.val) ∧
      (entry0806 i).output = T 56 (375 + i.val) ∧
      (entry0806 i).charge = charge 55 (375 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0809_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0822_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0806 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (375 + i.val)) shift
      (S (375 + i.val + 1)) (S 56) (T 55 (375 + i.val + 1))
      (T 55 (375 + i.val)) (T 56 (375 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0806.entries OriginalRow227TriangleForward0806.checked
    ⟨i.val, by rw [size0806]; exact i.isLt⟩
  change (entry0806 i).check = true at h
  rcases fields0806 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0807 : OriginalRow227TriangleForward0807.entries.size = 32 := rfl

def entry0807 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0807.entries[i.val]'(by rw [size0807]; exact i.isLt)

theorem fields0807 (i : Fin 32) :
    (entry0807 i).IA = shift ∧ (entry0807 i).ID = S (407 + i.val + 1) ∧
      (entry0807 i).IC = S 56 ∧ (entry0807 i).Inext = T 55 (407 + i.val + 1) ∧
      (entry0807 i).Icur = T 55 (407 + i.val) ∧
      (entry0807 i).output = T 56 (407 + i.val) ∧
      (entry0807 i).charge = charge 55 (407 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root432).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root433).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root434).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root435).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root436).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root437).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root438).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0810_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root439).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0823_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0807 (i : Fin 32) :
    forwardStepOK (-768) (charge 55 (407 + i.val)) shift
      (S (407 + i.val + 1)) (S 56) (T 55 (407 + i.val + 1))
      (T 55 (407 + i.val)) (T 56 (407 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0807.entries OriginalRow227TriangleForward0807.checked
    ⟨i.val, by rw [size0807]; exact i.isLt⟩
  change (entry0807 i).check = true at h
  rcases fields0807 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0808 : OriginalRow227TriangleForward0808.entries.size = 7 := rfl

def entry0808 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0808.entries[i.val]'(by rw [size0808]; exact i.isLt)

theorem fields0808 (i : Fin 7) :
    (entry0808 i).IA = shift ∧ (entry0808 i).ID = S (439 + i.val + 1) ∧
      (entry0808 i).IC = S 56 ∧ (entry0808 i).Inext = T 55 (439 + i.val + 1) ∧
      (entry0808 i).Icur = T 55 (439 + i.val) ∧
      (entry0808 i).output = T 56 (439 + i.val) ∧
      (entry0808 i).charge = charge 55 (439 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root440).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root441).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root442).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root443).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root444).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root445).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root446).symm, (OriginalRow227RootBindings01.S_eq_root56).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow055.block0811_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow056.block0824_value ⟨6, by decide⟩).symm, rfl⟩

theorem step0808 (i : Fin 7) :
    forwardStepOK (-768) (charge 55 (439 + i.val)) shift
      (S (439 + i.val + 1)) (S 56) (T 55 (439 + i.val + 1))
      (T 55 (439 + i.val)) (T 56 (439 + i.val))
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0808.entries OriginalRow227TriangleForward0808.checked
    ⟨i.val, by rw [size0808]; exact i.isLt⟩
  change (entry0808 i).check = true at h
  rcases fields0808 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 55 ≤ d) (hhi : d < 446) :
    forwardStepOK (-768) (charge 55 d) shift (S (d + 1)) (S 56)
      (T 55 (d + 1)) (T 55 d) (T 56 d)
      (OriginalRow227Roots.root_pos 56 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 55 (by decide)) = true := by
  by_cases h247 : d < 247
  ·
    by_cases h151 : d < 151
    ·
      by_cases h87 : d < 87
      ·
        have hi : d - 55 < 32 := by omega
        have heq : 55 + (d - 55) = d := by omega
        simpa only [heq] using step0796 ⟨d - 55, hi⟩
      ·
        by_cases h119 : d < 119
        ·
          have hi : d - 87 < 32 := by omega
          have heq : 87 + (d - 87) = d := by omega
          simpa only [heq] using step0797 ⟨d - 87, hi⟩
        ·
          have hi : d - 119 < 32 := by omega
          have heq : 119 + (d - 119) = d := by omega
          simpa only [heq] using step0798 ⟨d - 119, hi⟩
    ·
      by_cases h183 : d < 183
      ·
        have hi : d - 151 < 32 := by omega
        have heq : 151 + (d - 151) = d := by omega
        simpa only [heq] using step0799 ⟨d - 151, hi⟩
      ·
        by_cases h215 : d < 215
        ·
          have hi : d - 183 < 32 := by omega
          have heq : 183 + (d - 183) = d := by omega
          simpa only [heq] using step0800 ⟨d - 183, hi⟩
        ·
          have hi : d - 215 < 32 := by omega
          have heq : 215 + (d - 215) = d := by omega
          simpa only [heq] using step0801 ⟨d - 215, hi⟩
  ·
    by_cases h343 : d < 343
    ·
      by_cases h279 : d < 279
      ·
        have hi : d - 247 < 32 := by omega
        have heq : 247 + (d - 247) = d := by omega
        simpa only [heq] using step0802 ⟨d - 247, hi⟩
      ·
        by_cases h311 : d < 311
        ·
          have hi : d - 279 < 32 := by omega
          have heq : 279 + (d - 279) = d := by omega
          simpa only [heq] using step0803 ⟨d - 279, hi⟩
        ·
          have hi : d - 311 < 32 := by omega
          have heq : 311 + (d - 311) = d := by omega
          simpa only [heq] using step0804 ⟨d - 311, hi⟩
    ·
      by_cases h407 : d < 407
      ·
        by_cases h375 : d < 375
        ·
          have hi : d - 343 < 32 := by omega
          have heq : 343 + (d - 343) = d := by omega
          simpa only [heq] using step0805 ⟨d - 343, hi⟩
        ·
          have hi : d - 375 < 32 := by omega
          have heq : 375 + (d - 375) = d := by omega
          simpa only [heq] using step0806 ⟨d - 375, hi⟩
      ·
        by_cases h439 : d < 439
        ·
          have hi : d - 407 < 32 := by omega
          have heq : 407 + (d - 407) = d := by omega
          simpa only [heq] using step0807 ⟨d - 407, hi⟩
        ·
          have hi : d - 439 < 7 := by omega
          have heq : 439 + (d - 439) = d := by omega
          simpa only [heq] using step0808 ⟨d - 439, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0796,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0796,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0797,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0797,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0798,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0798,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0799,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0799,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0800,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0800,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0801,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0801,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0802,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0802,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0803,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0803,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0804,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0804,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0805,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0805,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0806,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0806,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0807,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0807,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.fields0808,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.step0808,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow056
