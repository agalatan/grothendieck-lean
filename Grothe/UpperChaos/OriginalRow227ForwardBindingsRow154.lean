import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow154
import Grothe.UpperChaos.OriginalRow227TriangleForward1746
import Grothe.UpperChaos.OriginalRow227TriangleForward1747
import Grothe.UpperChaos.OriginalRow227TriangleForward1748
import Grothe.UpperChaos.OriginalRow227TriangleForward1749
import Grothe.UpperChaos.OriginalRow227TriangleForward1750
import Grothe.UpperChaos.OriginalRow227TriangleForward1751
import Grothe.UpperChaos.OriginalRow227TriangleForward1752

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1746 : OriginalRow227TriangleForward1746.entries.size = 32 := rfl

def entry1746 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1746.entries[i.val]'(by rw [size1746]; exact i.isLt)

theorem fields1746 (i : Fin 32) :
    (entry1746 i).IA = shift ∧ (entry1746 i).ID = S (153 + i.val + 1) ∧
      (entry1746 i).IC = S 154 ∧ (entry1746 i).Inext = T 153 (153 + i.val + 1) ∧
      (entry1746 i).Icur = T 153 (153 + i.val) ∧
      (entry1746 i).output = T 154 (153 + i.val) ∧
      (entry1746 i).charge = charge 153 (153 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1762_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1746 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (153 + i.val)) shift
      (S (153 + i.val + 1)) (S 154) (T 153 (153 + i.val + 1))
      (T 153 (153 + i.val)) (T 154 (153 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1746.entries OriginalRow227TriangleForward1746.checked
    ⟨i.val, by rw [size1746]; exact i.isLt⟩
  change (entry1746 i).check = true at h
  rcases fields1746 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1747 : OriginalRow227TriangleForward1747.entries.size = 32 := rfl

def entry1747 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1747.entries[i.val]'(by rw [size1747]; exact i.isLt)

theorem fields1747 (i : Fin 32) :
    (entry1747 i).IA = shift ∧ (entry1747 i).ID = S (185 + i.val + 1) ∧
      (entry1747 i).IC = S 154 ∧ (entry1747 i).Inext = T 153 (185 + i.val + 1) ∧
      (entry1747 i).Icur = T 153 (185 + i.val) ∧
      (entry1747 i).output = T 154 (185 + i.val) ∧
      (entry1747 i).charge = charge 153 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1763_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1747 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 154) (T 153 (185 + i.val + 1))
      (T 153 (185 + i.val)) (T 154 (185 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1747.entries OriginalRow227TriangleForward1747.checked
    ⟨i.val, by rw [size1747]; exact i.isLt⟩
  change (entry1747 i).check = true at h
  rcases fields1747 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1748 : OriginalRow227TriangleForward1748.entries.size = 32 := rfl

def entry1748 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1748.entries[i.val]'(by rw [size1748]; exact i.isLt)

theorem fields1748 (i : Fin 32) :
    (entry1748 i).IA = shift ∧ (entry1748 i).ID = S (217 + i.val + 1) ∧
      (entry1748 i).IC = S 154 ∧ (entry1748 i).Inext = T 153 (217 + i.val + 1) ∧
      (entry1748 i).Icur = T 153 (217 + i.val) ∧
      (entry1748 i).output = T 154 (217 + i.val) ∧
      (entry1748 i).charge = charge 153 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1764_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1748 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 154) (T 153 (217 + i.val + 1))
      (T 153 (217 + i.val)) (T 154 (217 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1748.entries OriginalRow227TriangleForward1748.checked
    ⟨i.val, by rw [size1748]; exact i.isLt⟩
  change (entry1748 i).check = true at h
  rcases fields1748 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1749 : OriginalRow227TriangleForward1749.entries.size = 32 := rfl

def entry1749 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1749.entries[i.val]'(by rw [size1749]; exact i.isLt)

theorem fields1749 (i : Fin 32) :
    (entry1749 i).IA = shift ∧ (entry1749 i).ID = S (249 + i.val + 1) ∧
      (entry1749 i).IC = S 154 ∧ (entry1749 i).Inext = T 153 (249 + i.val + 1) ∧
      (entry1749 i).Icur = T 153 (249 + i.val) ∧
      (entry1749 i).output = T 154 (249 + i.val) ∧
      (entry1749 i).charge = charge 153 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1765_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1749 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 154) (T 153 (249 + i.val + 1))
      (T 153 (249 + i.val)) (T 154 (249 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1749.entries OriginalRow227TriangleForward1749.checked
    ⟨i.val, by rw [size1749]; exact i.isLt⟩
  change (entry1749 i).check = true at h
  rcases fields1749 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1750 : OriginalRow227TriangleForward1750.entries.size = 32 := rfl

def entry1750 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1750.entries[i.val]'(by rw [size1750]; exact i.isLt)

theorem fields1750 (i : Fin 32) :
    (entry1750 i).IA = shift ∧ (entry1750 i).ID = S (281 + i.val + 1) ∧
      (entry1750 i).IC = S 154 ∧ (entry1750 i).Inext = T 153 (281 + i.val + 1) ∧
      (entry1750 i).Icur = T 153 (281 + i.val) ∧
      (entry1750 i).output = T 154 (281 + i.val) ∧
      (entry1750 i).charge = charge 153 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1766_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1750 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 154) (T 153 (281 + i.val + 1))
      (T 153 (281 + i.val)) (T 154 (281 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1750.entries OriginalRow227TriangleForward1750.checked
    ⟨i.val, by rw [size1750]; exact i.isLt⟩
  change (entry1750 i).check = true at h
  rcases fields1750 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1751 : OriginalRow227TriangleForward1751.entries.size = 32 := rfl

def entry1751 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1751.entries[i.val]'(by rw [size1751]; exact i.isLt)

theorem fields1751 (i : Fin 32) :
    (entry1751 i).IA = shift ∧ (entry1751 i).ID = S (313 + i.val + 1) ∧
      (entry1751 i).IC = S 154 ∧ (entry1751 i).Inext = T 153 (313 + i.val + 1) ∧
      (entry1751 i).Icur = T 153 (313 + i.val) ∧
      (entry1751 i).output = T 154 (313 + i.val) ∧
      (entry1751 i).charge = charge 153 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1767_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1751 (i : Fin 32) :
    forwardStepOK (-768) (charge 153 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 154) (T 153 (313 + i.val + 1))
      (T 153 (313 + i.val)) (T 154 (313 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1751.entries OriginalRow227TriangleForward1751.checked
    ⟨i.val, by rw [size1751]; exact i.isLt⟩
  change (entry1751 i).check = true at h
  rcases fields1751 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1752 : OriginalRow227TriangleForward1752.entries.size = 3 := rfl

def entry1752 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1752.entries[i.val]'(by rw [size1752]; exact i.isLt)

theorem fields1752 (i : Fin 3) :
    (entry1752 i).IA = shift ∧ (entry1752 i).ID = S (345 + i.val + 1) ∧
      (entry1752 i).IC = S 154 ∧ (entry1752 i).Inext = T 153 (345 + i.val + 1) ∧
      (entry1752 i).Icur = T 153 (345 + i.val) ∧
      (entry1752 i).output = T 154 (345 + i.val) ∧
      (entry1752 i).charge = charge 153 (345 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root154).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow154.block1768_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1752 (i : Fin 3) :
    forwardStepOK (-768) (charge 153 (345 + i.val)) shift
      (S (345 + i.val + 1)) (S 154) (T 153 (345 + i.val + 1))
      (T 153 (345 + i.val)) (T 154 (345 + i.val))
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1752.entries OriginalRow227TriangleForward1752.checked
    ⟨i.val, by rw [size1752]; exact i.isLt⟩
  change (entry1752 i).check = true at h
  rcases fields1752 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 153 ≤ d) (hhi : d < 348) :
    forwardStepOK (-768) (charge 153 d) shift (S (d + 1)) (S 154)
      (T 153 (d + 1)) (T 153 d) (T 154 d)
      (OriginalRow227Roots.root_pos 154 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 153 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h185 : d < 185
    ·
      have hi : d - 153 < 32 := by omega
      have heq : 153 + (d - 153) = d := by omega
      simpa only [heq] using step1746 ⟨d - 153, hi⟩
    ·
      by_cases h217 : d < 217
      ·
        have hi : d - 185 < 32 := by omega
        have heq : 185 + (d - 185) = d := by omega
        simpa only [heq] using step1747 ⟨d - 185, hi⟩
      ·
        have hi : d - 217 < 32 := by omega
        have heq : 217 + (d - 217) = d := by omega
        simpa only [heq] using step1748 ⟨d - 217, hi⟩
  ·
    by_cases h313 : d < 313
    ·
      by_cases h281 : d < 281
      ·
        have hi : d - 249 < 32 := by omega
        have heq : 249 + (d - 249) = d := by omega
        simpa only [heq] using step1749 ⟨d - 249, hi⟩
      ·
        have hi : d - 281 < 32 := by omega
        have heq : 281 + (d - 281) = d := by omega
        simpa only [heq] using step1750 ⟨d - 281, hi⟩
    ·
      by_cases h345 : d < 345
      ·
        have hi : d - 313 < 32 := by omega
        have heq : 313 + (d - 313) = d := by omega
        simpa only [heq] using step1751 ⟨d - 313, hi⟩
      ·
        have hi : d - 345 < 3 := by omega
        have heq : 345 + (d - 345) = d := by omega
        simpa only [heq] using step1752 ⟨d - 345, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1746,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1746,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1747,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1747,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1748,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1748,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1749,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1749,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1750,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1750,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1751,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1751,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.fields1752,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.step1752,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow154
