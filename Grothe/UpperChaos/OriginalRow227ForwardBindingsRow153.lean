import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow152
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow153
import Grothe.UpperChaos.OriginalRow227TriangleForward1739
import Grothe.UpperChaos.OriginalRow227TriangleForward1740
import Grothe.UpperChaos.OriginalRow227TriangleForward1741
import Grothe.UpperChaos.OriginalRow227TriangleForward1742
import Grothe.UpperChaos.OriginalRow227TriangleForward1743
import Grothe.UpperChaos.OriginalRow227TriangleForward1744
import Grothe.UpperChaos.OriginalRow227TriangleForward1745

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1739 : OriginalRow227TriangleForward1739.entries.size = 32 := rfl

def entry1739 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1739.entries[i.val]'(by rw [size1739]; exact i.isLt)

theorem fields1739 (i : Fin 32) :
    (entry1739 i).IA = shift ∧ (entry1739 i).ID = S (152 + i.val + 1) ∧
      (entry1739 i).IC = S 153 ∧ (entry1739 i).Inext = T 152 (152 + i.val + 1) ∧
      (entry1739 i).Icur = T 152 (152 + i.val) ∧
      (entry1739 i).output = T 153 (152 + i.val) ∧
      (entry1739 i).charge = charge 152 (152 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1748_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1755_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1739 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (152 + i.val)) shift
      (S (152 + i.val + 1)) (S 153) (T 152 (152 + i.val + 1))
      (T 152 (152 + i.val)) (T 153 (152 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1739.entries OriginalRow227TriangleForward1739.checked
    ⟨i.val, by rw [size1739]; exact i.isLt⟩
  change (entry1739 i).check = true at h
  rcases fields1739 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1740 : OriginalRow227TriangleForward1740.entries.size = 32 := rfl

def entry1740 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1740.entries[i.val]'(by rw [size1740]; exact i.isLt)

theorem fields1740 (i : Fin 32) :
    (entry1740 i).IA = shift ∧ (entry1740 i).ID = S (184 + i.val + 1) ∧
      (entry1740 i).IC = S 153 ∧ (entry1740 i).Inext = T 152 (184 + i.val + 1) ∧
      (entry1740 i).Icur = T 152 (184 + i.val) ∧
      (entry1740 i).output = T 153 (184 + i.val) ∧
      (entry1740 i).charge = charge 152 (184 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1749_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1756_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1740 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (184 + i.val)) shift
      (S (184 + i.val + 1)) (S 153) (T 152 (184 + i.val + 1))
      (T 152 (184 + i.val)) (T 153 (184 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1740.entries OriginalRow227TriangleForward1740.checked
    ⟨i.val, by rw [size1740]; exact i.isLt⟩
  change (entry1740 i).check = true at h
  rcases fields1740 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1741 : OriginalRow227TriangleForward1741.entries.size = 32 := rfl

def entry1741 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1741.entries[i.val]'(by rw [size1741]; exact i.isLt)

theorem fields1741 (i : Fin 32) :
    (entry1741 i).IA = shift ∧ (entry1741 i).ID = S (216 + i.val + 1) ∧
      (entry1741 i).IC = S 153 ∧ (entry1741 i).Inext = T 152 (216 + i.val + 1) ∧
      (entry1741 i).Icur = T 152 (216 + i.val) ∧
      (entry1741 i).output = T 153 (216 + i.val) ∧
      (entry1741 i).charge = charge 152 (216 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1750_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1757_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1741 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (216 + i.val)) shift
      (S (216 + i.val + 1)) (S 153) (T 152 (216 + i.val + 1))
      (T 152 (216 + i.val)) (T 153 (216 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1741.entries OriginalRow227TriangleForward1741.checked
    ⟨i.val, by rw [size1741]; exact i.isLt⟩
  change (entry1741 i).check = true at h
  rcases fields1741 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1742 : OriginalRow227TriangleForward1742.entries.size = 32 := rfl

def entry1742 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1742.entries[i.val]'(by rw [size1742]; exact i.isLt)

theorem fields1742 (i : Fin 32) :
    (entry1742 i).IA = shift ∧ (entry1742 i).ID = S (248 + i.val + 1) ∧
      (entry1742 i).IC = S 153 ∧ (entry1742 i).Inext = T 152 (248 + i.val + 1) ∧
      (entry1742 i).Icur = T 152 (248 + i.val) ∧
      (entry1742 i).output = T 153 (248 + i.val) ∧
      (entry1742 i).charge = charge 152 (248 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1751_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1758_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1742 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (248 + i.val)) shift
      (S (248 + i.val + 1)) (S 153) (T 152 (248 + i.val + 1))
      (T 152 (248 + i.val)) (T 153 (248 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1742.entries OriginalRow227TriangleForward1742.checked
    ⟨i.val, by rw [size1742]; exact i.isLt⟩
  change (entry1742 i).check = true at h
  rcases fields1742 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1743 : OriginalRow227TriangleForward1743.entries.size = 32 := rfl

def entry1743 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1743.entries[i.val]'(by rw [size1743]; exact i.isLt)

theorem fields1743 (i : Fin 32) :
    (entry1743 i).IA = shift ∧ (entry1743 i).ID = S (280 + i.val + 1) ∧
      (entry1743 i).IC = S 153 ∧ (entry1743 i).Inext = T 152 (280 + i.val + 1) ∧
      (entry1743 i).Icur = T 152 (280 + i.val) ∧
      (entry1743 i).output = T 153 (280 + i.val) ∧
      (entry1743 i).charge = charge 152 (280 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1752_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1759_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1743 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (280 + i.val)) shift
      (S (280 + i.val + 1)) (S 153) (T 152 (280 + i.val + 1))
      (T 152 (280 + i.val)) (T 153 (280 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1743.entries OriginalRow227TriangleForward1743.checked
    ⟨i.val, by rw [size1743]; exact i.isLt⟩
  change (entry1743 i).check = true at h
  rcases fields1743 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1744 : OriginalRow227TriangleForward1744.entries.size = 32 := rfl

def entry1744 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1744.entries[i.val]'(by rw [size1744]; exact i.isLt)

theorem fields1744 (i : Fin 32) :
    (entry1744 i).IA = shift ∧ (entry1744 i).ID = S (312 + i.val + 1) ∧
      (entry1744 i).IC = S 153 ∧ (entry1744 i).Inext = T 152 (312 + i.val + 1) ∧
      (entry1744 i).Icur = T 152 (312 + i.val) ∧
      (entry1744 i).output = T 153 (312 + i.val) ∧
      (entry1744 i).charge = charge 152 (312 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1753_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1760_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1744 (i : Fin 32) :
    forwardStepOK (-768) (charge 152 (312 + i.val)) shift
      (S (312 + i.val + 1)) (S 153) (T 152 (312 + i.val + 1))
      (T 152 (312 + i.val)) (T 153 (312 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1744.entries OriginalRow227TriangleForward1744.checked
    ⟨i.val, by rw [size1744]; exact i.isLt⟩
  change (entry1744 i).check = true at h
  rcases fields1744 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1745 : OriginalRow227TriangleForward1745.entries.size = 5 := rfl

def entry1745 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1745.entries[i.val]'(by rw [size1745]; exact i.isLt)

theorem fields1745 (i : Fin 5) :
    (entry1745 i).IA = shift ∧ (entry1745 i).ID = S (344 + i.val + 1) ∧
      (entry1745 i).IC = S 153 ∧ (entry1745 i).Inext = T 152 (344 + i.val + 1) ∧
      (entry1745 i).Icur = T 152 (344 + i.val) ∧
      (entry1745 i).output = T 153 (344 + i.val) ∧
      (entry1745 i).charge = charge 152 (344 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root153).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow152.block1754_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow153.block1761_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1745 (i : Fin 5) :
    forwardStepOK (-768) (charge 152 (344 + i.val)) shift
      (S (344 + i.val + 1)) (S 153) (T 152 (344 + i.val + 1))
      (T 152 (344 + i.val)) (T 153 (344 + i.val))
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1745.entries OriginalRow227TriangleForward1745.checked
    ⟨i.val, by rw [size1745]; exact i.isLt⟩
  change (entry1745 i).check = true at h
  rcases fields1745 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 152 ≤ d) (hhi : d < 349) :
    forwardStepOK (-768) (charge 152 d) shift (S (d + 1)) (S 153)
      (T 152 (d + 1)) (T 152 d) (T 153 d)
      (OriginalRow227Roots.root_pos 153 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 152 (by decide)) = true := by
  by_cases h248 : d < 248
  ·
    by_cases h184 : d < 184
    ·
      have hi : d - 152 < 32 := by omega
      have heq : 152 + (d - 152) = d := by omega
      simpa only [heq] using step1739 ⟨d - 152, hi⟩
    ·
      by_cases h216 : d < 216
      ·
        have hi : d - 184 < 32 := by omega
        have heq : 184 + (d - 184) = d := by omega
        simpa only [heq] using step1740 ⟨d - 184, hi⟩
      ·
        have hi : d - 216 < 32 := by omega
        have heq : 216 + (d - 216) = d := by omega
        simpa only [heq] using step1741 ⟨d - 216, hi⟩
  ·
    by_cases h312 : d < 312
    ·
      by_cases h280 : d < 280
      ·
        have hi : d - 248 < 32 := by omega
        have heq : 248 + (d - 248) = d := by omega
        simpa only [heq] using step1742 ⟨d - 248, hi⟩
      ·
        have hi : d - 280 < 32 := by omega
        have heq : 280 + (d - 280) = d := by omega
        simpa only [heq] using step1743 ⟨d - 280, hi⟩
    ·
      by_cases h344 : d < 344
      ·
        have hi : d - 312 < 32 := by omega
        have heq : 312 + (d - 312) = d := by omega
        simpa only [heq] using step1744 ⟨d - 312, hi⟩
      ·
        have hi : d - 344 < 5 := by omega
        have heq : 344 + (d - 344) = d := by omega
        simpa only [heq] using step1745 ⟨d - 344, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1739,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1739,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1740,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1740,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1741,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1741,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1742,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1742,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1743,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1743,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1744,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1744,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.fields1745,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.step1745,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow153
