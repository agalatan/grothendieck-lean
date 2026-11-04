import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow070
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow071
import Grothe.UpperChaos.OriginalRow227TriangleForward0980
import Grothe.UpperChaos.OriginalRow227TriangleForward0981
import Grothe.UpperChaos.OriginalRow227TriangleForward0982
import Grothe.UpperChaos.OriginalRow227TriangleForward0983
import Grothe.UpperChaos.OriginalRow227TriangleForward0984
import Grothe.UpperChaos.OriginalRow227TriangleForward0985
import Grothe.UpperChaos.OriginalRow227TriangleForward0986
import Grothe.UpperChaos.OriginalRow227TriangleForward0987
import Grothe.UpperChaos.OriginalRow227TriangleForward0988
import Grothe.UpperChaos.OriginalRow227TriangleForward0989
import Grothe.UpperChaos.OriginalRow227TriangleForward0990
import Grothe.UpperChaos.OriginalRow227TriangleForward0991

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size0980 : OriginalRow227TriangleForward0980.entries.size = 32 := rfl

def entry0980 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0980.entries[i.val]'(by rw [size0980]; exact i.isLt)

theorem fields0980 (i : Fin 32) :
    (entry0980 i).IA = shift ∧ (entry0980 i).ID = S (70 + i.val + 1) ∧
      (entry0980 i).IC = S 71 ∧ (entry0980 i).Inext = T 70 (70 + i.val + 1) ∧
      (entry0980 i).Icur = T 70 (70 + i.val) ∧
      (entry0980 i).output = T 71 (70 + i.val) ∧
      (entry0980 i).charge = charge 70 (70 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root71).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root72).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root73).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root74).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root75).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root76).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root77).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root78).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root79).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root80).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root81).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root82).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root83).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root84).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root85).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root86).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root87).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root88).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root89).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root90).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root91).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root92).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root93).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root94).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root95).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings02.S_eq_root96).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root97).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root98).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root99).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root100).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root101).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0984_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root102).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0996_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0980 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (70 + i.val)) shift
      (S (70 + i.val + 1)) (S 71) (T 70 (70 + i.val + 1))
      (T 70 (70 + i.val)) (T 71 (70 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0980.entries OriginalRow227TriangleForward0980.checked
    ⟨i.val, by rw [size0980]; exact i.isLt⟩
  change (entry0980 i).check = true at h
  rcases fields0980 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0981 : OriginalRow227TriangleForward0981.entries.size = 32 := rfl

def entry0981 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0981.entries[i.val]'(by rw [size0981]; exact i.isLt)

theorem fields0981 (i : Fin 32) :
    (entry0981 i).IA = shift ∧ (entry0981 i).ID = S (102 + i.val + 1) ∧
      (entry0981 i).IC = S 71 ∧ (entry0981 i).Inext = T 70 (102 + i.val + 1) ∧
      (entry0981 i).Icur = T 70 (102 + i.val) ∧
      (entry0981 i).output = T 71 (102 + i.val) ∧
      (entry0981 i).charge = charge 70 (102 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root103).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root104).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root105).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root106).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root107).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root108).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root109).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root110).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root111).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root112).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root113).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root114).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root115).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root116).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root117).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root118).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root119).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root120).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root121).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root122).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root123).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root124).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root125).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root126).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root127).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings03.S_eq_root128).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root129).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0985_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0997_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0981 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (102 + i.val)) shift
      (S (102 + i.val + 1)) (S 71) (T 70 (102 + i.val + 1))
      (T 70 (102 + i.val)) (T 71 (102 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0981.entries OriginalRow227TriangleForward0981.checked
    ⟨i.val, by rw [size0981]; exact i.isLt⟩
  change (entry0981 i).check = true at h
  rcases fields0981 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0982 : OriginalRow227TriangleForward0982.entries.size = 32 := rfl

def entry0982 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0982.entries[i.val]'(by rw [size0982]; exact i.isLt)

theorem fields0982 (i : Fin 32) :
    (entry0982 i).IA = shift ∧ (entry0982 i).ID = S (134 + i.val + 1) ∧
      (entry0982 i).IC = S 71 ∧ (entry0982 i).Inext = T 70 (134 + i.val + 1) ∧
      (entry0982 i).Icur = T 70 (134 + i.val) ∧
      (entry0982 i).output = T 71 (134 + i.val) ∧
      (entry0982 i).charge = charge 70 (134 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0986_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0998_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0982 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (134 + i.val)) shift
      (S (134 + i.val + 1)) (S 71) (T 70 (134 + i.val + 1))
      (T 70 (134 + i.val)) (T 71 (134 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0982.entries OriginalRow227TriangleForward0982.checked
    ⟨i.val, by rw [size0982]; exact i.isLt⟩
  change (entry0982 i).check = true at h
  rcases fields0982 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0983 : OriginalRow227TriangleForward0983.entries.size = 32 := rfl

def entry0983 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0983.entries[i.val]'(by rw [size0983]; exact i.isLt)

theorem fields0983 (i : Fin 32) :
    (entry0983 i).IA = shift ∧ (entry0983 i).ID = S (166 + i.val + 1) ∧
      (entry0983 i).IC = S 71 ∧ (entry0983 i).Inext = T 70 (166 + i.val + 1) ∧
      (entry0983 i).Icur = T 70 (166 + i.val) ∧
      (entry0983 i).output = T 71 (166 + i.val) ∧
      (entry0983 i).charge = charge 70 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0987_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block0999_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0983 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 71) (T 70 (166 + i.val + 1))
      (T 70 (166 + i.val)) (T 71 (166 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0983.entries OriginalRow227TriangleForward0983.checked
    ⟨i.val, by rw [size0983]; exact i.isLt⟩
  change (entry0983 i).check = true at h
  rcases fields0983 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0984 : OriginalRow227TriangleForward0984.entries.size = 32 := rfl

def entry0984 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0984.entries[i.val]'(by rw [size0984]; exact i.isLt)

theorem fields0984 (i : Fin 32) :
    (entry0984 i).IA = shift ∧ (entry0984 i).ID = S (198 + i.val + 1) ∧
      (entry0984 i).IC = S 71 ∧ (entry0984 i).Inext = T 70 (198 + i.val + 1) ∧
      (entry0984 i).Icur = T 70 (198 + i.val) ∧
      (entry0984 i).output = T 71 (198 + i.val) ∧
      (entry0984 i).charge = charge 70 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0988_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1000_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0984 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 71) (T 70 (198 + i.val + 1))
      (T 70 (198 + i.val)) (T 71 (198 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0984.entries OriginalRow227TriangleForward0984.checked
    ⟨i.val, by rw [size0984]; exact i.isLt⟩
  change (entry0984 i).check = true at h
  rcases fields0984 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0985 : OriginalRow227TriangleForward0985.entries.size = 32 := rfl

def entry0985 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0985.entries[i.val]'(by rw [size0985]; exact i.isLt)

theorem fields0985 (i : Fin 32) :
    (entry0985 i).IA = shift ∧ (entry0985 i).ID = S (230 + i.val + 1) ∧
      (entry0985 i).IC = S 71 ∧ (entry0985 i).Inext = T 70 (230 + i.val + 1) ∧
      (entry0985 i).Icur = T 70 (230 + i.val) ∧
      (entry0985 i).output = T 71 (230 + i.val) ∧
      (entry0985 i).charge = charge 70 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0989_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1001_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0985 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 71) (T 70 (230 + i.val + 1))
      (T 70 (230 + i.val)) (T 71 (230 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0985.entries OriginalRow227TriangleForward0985.checked
    ⟨i.val, by rw [size0985]; exact i.isLt⟩
  change (entry0985 i).check = true at h
  rcases fields0985 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0986 : OriginalRow227TriangleForward0986.entries.size = 32 := rfl

def entry0986 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0986.entries[i.val]'(by rw [size0986]; exact i.isLt)

theorem fields0986 (i : Fin 32) :
    (entry0986 i).IA = shift ∧ (entry0986 i).ID = S (262 + i.val + 1) ∧
      (entry0986 i).IC = S 71 ∧ (entry0986 i).Inext = T 70 (262 + i.val + 1) ∧
      (entry0986 i).Icur = T 70 (262 + i.val) ∧
      (entry0986 i).output = T 71 (262 + i.val) ∧
      (entry0986 i).charge = charge 70 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0990_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1002_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0986 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 71) (T 70 (262 + i.val + 1))
      (T 70 (262 + i.val)) (T 71 (262 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0986.entries OriginalRow227TriangleForward0986.checked
    ⟨i.val, by rw [size0986]; exact i.isLt⟩
  change (entry0986 i).check = true at h
  rcases fields0986 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0987 : OriginalRow227TriangleForward0987.entries.size = 32 := rfl

def entry0987 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0987.entries[i.val]'(by rw [size0987]; exact i.isLt)

theorem fields0987 (i : Fin 32) :
    (entry0987 i).IA = shift ∧ (entry0987 i).ID = S (294 + i.val + 1) ∧
      (entry0987 i).IC = S 71 ∧ (entry0987 i).Inext = T 70 (294 + i.val + 1) ∧
      (entry0987 i).Icur = T 70 (294 + i.val) ∧
      (entry0987 i).output = T 71 (294 + i.val) ∧
      (entry0987 i).charge = charge 70 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0991_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1003_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0987 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 71) (T 70 (294 + i.val + 1))
      (T 70 (294 + i.val)) (T 71 (294 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0987.entries OriginalRow227TriangleForward0987.checked
    ⟨i.val, by rw [size0987]; exact i.isLt⟩
  change (entry0987 i).check = true at h
  rcases fields0987 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0988 : OriginalRow227TriangleForward0988.entries.size = 32 := rfl

def entry0988 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0988.entries[i.val]'(by rw [size0988]; exact i.isLt)

theorem fields0988 (i : Fin 32) :
    (entry0988 i).IA = shift ∧ (entry0988 i).ID = S (326 + i.val + 1) ∧
      (entry0988 i).IC = S 71 ∧ (entry0988 i).Inext = T 70 (326 + i.val + 1) ∧
      (entry0988 i).Icur = T 70 (326 + i.val) ∧
      (entry0988 i).output = T 71 (326 + i.val) ∧
      (entry0988 i).charge = charge 70 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0992_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1004_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0988 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 71) (T 70 (326 + i.val + 1))
      (T 70 (326 + i.val)) (T 71 (326 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0988.entries OriginalRow227TriangleForward0988.checked
    ⟨i.val, by rw [size0988]; exact i.isLt⟩
  change (entry0988 i).check = true at h
  rcases fields0988 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0989 : OriginalRow227TriangleForward0989.entries.size = 32 := rfl

def entry0989 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0989.entries[i.val]'(by rw [size0989]; exact i.isLt)

theorem fields0989 (i : Fin 32) :
    (entry0989 i).IA = shift ∧ (entry0989 i).ID = S (358 + i.val + 1) ∧
      (entry0989 i).IC = S 71 ∧ (entry0989 i).Inext = T 70 (358 + i.val + 1) ∧
      (entry0989 i).Icur = T 70 (358 + i.val) ∧
      (entry0989 i).output = T 71 (358 + i.val) ∧
      (entry0989 i).charge = charge 70 (358 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root373).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root374).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root375).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root376).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root377).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root378).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root379).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root380).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root381).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root382).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root383).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root384).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root385).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root386).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root387).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root388).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root389).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0993_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root390).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1005_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0989 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (358 + i.val)) shift
      (S (358 + i.val + 1)) (S 71) (T 70 (358 + i.val + 1))
      (T 70 (358 + i.val)) (T 71 (358 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0989.entries OriginalRow227TriangleForward0989.checked
    ⟨i.val, by rw [size0989]; exact i.isLt⟩
  change (entry0989 i).check = true at h
  rcases fields0989 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0990 : OriginalRow227TriangleForward0990.entries.size = 32 := rfl

def entry0990 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0990.entries[i.val]'(by rw [size0990]; exact i.isLt)

theorem fields0990 (i : Fin 32) :
    (entry0990 i).IA = shift ∧ (entry0990 i).ID = S (390 + i.val + 1) ∧
      (entry0990 i).IC = S 71 ∧ (entry0990 i).Inext = T 70 (390 + i.val + 1) ∧
      (entry0990 i).Icur = T 70 (390 + i.val) ∧
      (entry0990 i).output = T 71 (390 + i.val) ∧
      (entry0990 i).charge = charge 70 (390 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root391).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root392).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root393).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root394).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root395).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root396).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root397).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root398).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root399).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root400).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root401).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root402).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root403).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root404).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root405).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root406).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root407).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root408).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root409).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root410).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root411).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root412).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root413).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root414).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root415).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings12.S_eq_root416).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root417).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root418).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root419).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root420).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root421).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0994_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root422).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1006_value ⟨31, by decide⟩).symm, rfl⟩

theorem step0990 (i : Fin 32) :
    forwardStepOK (-768) (charge 70 (390 + i.val)) shift
      (S (390 + i.val + 1)) (S 71) (T 70 (390 + i.val + 1))
      (T 70 (390 + i.val)) (T 71 (390 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0990.entries OriginalRow227TriangleForward0990.checked
    ⟨i.val, by rw [size0990]; exact i.isLt⟩
  change (entry0990 i).check = true at h
  rcases fields0990 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size0991 : OriginalRow227TriangleForward0991.entries.size = 9 := rfl

def entry0991 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward0991.entries[i.val]'(by rw [size0991]; exact i.isLt)

theorem fields0991 (i : Fin 9) :
    (entry0991 i).IA = shift ∧ (entry0991 i).ID = S (422 + i.val + 1) ∧
      (entry0991 i).IC = S 71 ∧ (entry0991 i).Inext = T 70 (422 + i.val + 1) ∧
      (entry0991 i).Icur = T 70 (422 + i.val) ∧
      (entry0991 i).output = T 71 (422 + i.val) ∧
      (entry0991 i).charge = charge 70 (422 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root423).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root424).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root425).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root426).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root427).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root428).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root429).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root430).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings13.S_eq_root431).symm, (OriginalRow227RootBindings02.S_eq_root71).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow070.block0995_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow071.block1007_value ⟨8, by decide⟩).symm, rfl⟩

theorem step0991 (i : Fin 9) :
    forwardStepOK (-768) (charge 70 (422 + i.val)) shift
      (S (422 + i.val + 1)) (S 71) (T 70 (422 + i.val + 1))
      (T 70 (422 + i.val)) (T 71 (422 + i.val))
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward0991.entries OriginalRow227TriangleForward0991.checked
    ⟨i.val, by rw [size0991]; exact i.isLt⟩
  change (entry0991 i).check = true at h
  rcases fields0991 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 70 ≤ d) (hhi : d < 431) :
    forwardStepOK (-768) (charge 70 d) shift (S (d + 1)) (S 71)
      (T 70 (d + 1)) (T 70 d) (T 71 d)
      (OriginalRow227Roots.root_pos 71 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 70 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h166 : d < 166
    ·
      by_cases h102 : d < 102
      ·
        have hi : d - 70 < 32 := by omega
        have heq : 70 + (d - 70) = d := by omega
        simpa only [heq] using step0980 ⟨d - 70, hi⟩
      ·
        by_cases h134 : d < 134
        ·
          have hi : d - 102 < 32 := by omega
          have heq : 102 + (d - 102) = d := by omega
          simpa only [heq] using step0981 ⟨d - 102, hi⟩
        ·
          have hi : d - 134 < 32 := by omega
          have heq : 134 + (d - 134) = d := by omega
          simpa only [heq] using step0982 ⟨d - 134, hi⟩
    ·
      by_cases h198 : d < 198
      ·
        have hi : d - 166 < 32 := by omega
        have heq : 166 + (d - 166) = d := by omega
        simpa only [heq] using step0983 ⟨d - 166, hi⟩
      ·
        by_cases h230 : d < 230
        ·
          have hi : d - 198 < 32 := by omega
          have heq : 198 + (d - 198) = d := by omega
          simpa only [heq] using step0984 ⟨d - 198, hi⟩
        ·
          have hi : d - 230 < 32 := by omega
          have heq : 230 + (d - 230) = d := by omega
          simpa only [heq] using step0985 ⟨d - 230, hi⟩
  ·
    by_cases h358 : d < 358
    ·
      by_cases h294 : d < 294
      ·
        have hi : d - 262 < 32 := by omega
        have heq : 262 + (d - 262) = d := by omega
        simpa only [heq] using step0986 ⟨d - 262, hi⟩
      ·
        by_cases h326 : d < 326
        ·
          have hi : d - 294 < 32 := by omega
          have heq : 294 + (d - 294) = d := by omega
          simpa only [heq] using step0987 ⟨d - 294, hi⟩
        ·
          have hi : d - 326 < 32 := by omega
          have heq : 326 + (d - 326) = d := by omega
          simpa only [heq] using step0988 ⟨d - 326, hi⟩
    ·
      by_cases h390 : d < 390
      ·
        have hi : d - 358 < 32 := by omega
        have heq : 358 + (d - 358) = d := by omega
        simpa only [heq] using step0989 ⟨d - 358, hi⟩
      ·
        by_cases h422 : d < 422
        ·
          have hi : d - 390 < 32 := by omega
          have heq : 390 + (d - 390) = d := by omega
          simpa only [heq] using step0990 ⟨d - 390, hi⟩
        ·
          have hi : d - 422 < 9 := by omega
          have heq : 422 + (d - 422) = d := by omega
          simpa only [heq] using step0991 ⟨d - 422, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0980,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0980,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0981,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0981,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0982,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0982,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0983,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0983,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0984,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0984,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0985,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0985,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0986,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0986,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0987,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0987,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0988,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0988,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0989,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0989,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0990,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0990,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.fields0991,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.step0991,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow071
