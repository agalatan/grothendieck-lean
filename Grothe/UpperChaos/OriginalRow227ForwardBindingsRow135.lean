import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135
import Grothe.UpperChaos.OriginalRow227TriangleForward1608
import Grothe.UpperChaos.OriginalRow227TriangleForward1609
import Grothe.UpperChaos.OriginalRow227TriangleForward1610
import Grothe.UpperChaos.OriginalRow227TriangleForward1611
import Grothe.UpperChaos.OriginalRow227TriangleForward1612
import Grothe.UpperChaos.OriginalRow227TriangleForward1613
import Grothe.UpperChaos.OriginalRow227TriangleForward1614
import Grothe.UpperChaos.OriginalRow227TriangleForward1615

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1608 : OriginalRow227TriangleForward1608.entries.size = 32 := rfl

def entry1608 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1608.entries[i.val]'(by rw [size1608]; exact i.isLt)

theorem fields1608 (i : Fin 32) :
    (entry1608 i).IA = shift ∧ (entry1608 i).ID = S (134 + i.val + 1) ∧
      (entry1608 i).IC = S 135 ∧ (entry1608 i).Inext = T 134 (134 + i.val + 1) ∧
      (entry1608 i).Icur = T 134 (134 + i.val) ∧
      (entry1608 i).output = T 135 (134 + i.val) ∧
      (entry1608 i).charge = charge 134 (134 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1608 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (134 + i.val)) shift
      (S (134 + i.val + 1)) (S 135) (T 134 (134 + i.val + 1))
      (T 134 (134 + i.val)) (T 135 (134 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1608.entries OriginalRow227TriangleForward1608.checked
    ⟨i.val, by rw [size1608]; exact i.isLt⟩
  change (entry1608 i).check = true at h
  rcases fields1608 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1609 : OriginalRow227TriangleForward1609.entries.size = 32 := rfl

def entry1609 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1609.entries[i.val]'(by rw [size1609]; exact i.isLt)

theorem fields1609 (i : Fin 32) :
    (entry1609 i).IA = shift ∧ (entry1609 i).ID = S (166 + i.val + 1) ∧
      (entry1609 i).IC = S 135 ∧ (entry1609 i).Inext = T 134 (166 + i.val + 1) ∧
      (entry1609 i).Icur = T 134 (166 + i.val) ∧
      (entry1609 i).output = T 135 (166 + i.val) ∧
      (entry1609 i).charge = charge 134 (166 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1609 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (166 + i.val)) shift
      (S (166 + i.val + 1)) (S 135) (T 134 (166 + i.val + 1))
      (T 134 (166 + i.val)) (T 135 (166 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1609.entries OriginalRow227TriangleForward1609.checked
    ⟨i.val, by rw [size1609]; exact i.isLt⟩
  change (entry1609 i).check = true at h
  rcases fields1609 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1610 : OriginalRow227TriangleForward1610.entries.size = 32 := rfl

def entry1610 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1610.entries[i.val]'(by rw [size1610]; exact i.isLt)

theorem fields1610 (i : Fin 32) :
    (entry1610 i).IA = shift ∧ (entry1610 i).ID = S (198 + i.val + 1) ∧
      (entry1610 i).IC = S 135 ∧ (entry1610 i).Inext = T 134 (198 + i.val + 1) ∧
      (entry1610 i).Icur = T 134 (198 + i.val) ∧
      (entry1610 i).output = T 135 (198 + i.val) ∧
      (entry1610 i).charge = charge 134 (198 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1610 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (198 + i.val)) shift
      (S (198 + i.val + 1)) (S 135) (T 134 (198 + i.val + 1))
      (T 134 (198 + i.val)) (T 135 (198 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1610.entries OriginalRow227TriangleForward1610.checked
    ⟨i.val, by rw [size1610]; exact i.isLt⟩
  change (entry1610 i).check = true at h
  rcases fields1610 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1611 : OriginalRow227TriangleForward1611.entries.size = 32 := rfl

def entry1611 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1611.entries[i.val]'(by rw [size1611]; exact i.isLt)

theorem fields1611 (i : Fin 32) :
    (entry1611 i).IA = shift ∧ (entry1611 i).ID = S (230 + i.val + 1) ∧
      (entry1611 i).IC = S 135 ∧ (entry1611 i).Inext = T 134 (230 + i.val + 1) ∧
      (entry1611 i).Icur = T 134 (230 + i.val) ∧
      (entry1611 i).output = T 135 (230 + i.val) ∧
      (entry1611 i).charge = charge 134 (230 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1611 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (230 + i.val)) shift
      (S (230 + i.val + 1)) (S 135) (T 134 (230 + i.val + 1))
      (T 134 (230 + i.val)) (T 135 (230 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1611.entries OriginalRow227TriangleForward1611.checked
    ⟨i.val, by rw [size1611]; exact i.isLt⟩
  change (entry1611 i).check = true at h
  rcases fields1611 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1612 : OriginalRow227TriangleForward1612.entries.size = 32 := rfl

def entry1612 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1612.entries[i.val]'(by rw [size1612]; exact i.isLt)

theorem fields1612 (i : Fin 32) :
    (entry1612 i).IA = shift ∧ (entry1612 i).ID = S (262 + i.val + 1) ∧
      (entry1612 i).IC = S 135 ∧ (entry1612 i).Inext = T 134 (262 + i.val + 1) ∧
      (entry1612 i).Icur = T 134 (262 + i.val) ∧
      (entry1612 i).output = T 135 (262 + i.val) ∧
      (entry1612 i).charge = charge 134 (262 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1612 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (262 + i.val)) shift
      (S (262 + i.val + 1)) (S 135) (T 134 (262 + i.val + 1))
      (T 134 (262 + i.val)) (T 135 (262 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1612.entries OriginalRow227TriangleForward1612.checked
    ⟨i.val, by rw [size1612]; exact i.isLt⟩
  change (entry1612 i).check = true at h
  rcases fields1612 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1613 : OriginalRow227TriangleForward1613.entries.size = 32 := rfl

def entry1613 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1613.entries[i.val]'(by rw [size1613]; exact i.isLt)

theorem fields1613 (i : Fin 32) :
    (entry1613 i).IA = shift ∧ (entry1613 i).ID = S (294 + i.val + 1) ∧
      (entry1613 i).IC = S 135 ∧ (entry1613 i).Inext = T 134 (294 + i.val + 1) ∧
      (entry1613 i).Icur = T 134 (294 + i.val) ∧
      (entry1613 i).output = T 135 (294 + i.val) ∧
      (entry1613 i).charge = charge 134 (294 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1613 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (294 + i.val)) shift
      (S (294 + i.val + 1)) (S 135) (T 134 (294 + i.val + 1))
      (T 134 (294 + i.val)) (T 135 (294 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1613.entries OriginalRow227TriangleForward1613.checked
    ⟨i.val, by rw [size1613]; exact i.isLt⟩
  change (entry1613 i).check = true at h
  rcases fields1613 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1614 : OriginalRow227TriangleForward1614.entries.size = 32 := rfl

def entry1614 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1614.entries[i.val]'(by rw [size1614]; exact i.isLt)

theorem fields1614 (i : Fin 32) :
    (entry1614 i).IA = shift ∧ (entry1614 i).ID = S (326 + i.val + 1) ∧
      (entry1614 i).IC = S 135 ∧ (entry1614 i).Inext = T 134 (326 + i.val + 1) ∧
      (entry1614 i).Icur = T 134 (326 + i.val) ∧
      (entry1614 i).output = T 135 (326 + i.val) ∧
      (entry1614 i).charge = charge 134 (326 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1614 (i : Fin 32) :
    forwardStepOK (-768) (charge 134 (326 + i.val)) shift
      (S (326 + i.val + 1)) (S 135) (T 134 (326 + i.val + 1))
      (T 134 (326 + i.val)) (T 135 (326 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1614.entries OriginalRow227TriangleForward1614.checked
    ⟨i.val, by rw [size1614]; exact i.isLt⟩
  change (entry1614 i).check = true at h
  rcases fields1614 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1615 : OriginalRow227TriangleForward1615.entries.size = 9 := rfl

def entry1615 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1615.entries[i.val]'(by rw [size1615]; exact i.isLt)

theorem fields1615 (i : Fin 9) :
    (entry1615 i).IA = shift ∧ (entry1615 i).ID = S (358 + i.val + 1) ∧
      (entry1615 i).IC = S 135 ∧ (entry1615 i).Inext = T 134 (358 + i.val + 1) ∧
      (entry1615 i).Icur = T 134 (358 + i.val) ∧
      (entry1615 i).output = T 135 (358 + i.val) ∧
      (entry1615 i).charge = charge 134 (358 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root135).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1615 (i : Fin 9) :
    forwardStepOK (-768) (charge 134 (358 + i.val)) shift
      (S (358 + i.val + 1)) (S 135) (T 134 (358 + i.val + 1))
      (T 134 (358 + i.val)) (T 135 (358 + i.val))
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1615.entries OriginalRow227TriangleForward1615.checked
    ⟨i.val, by rw [size1615]; exact i.isLt⟩
  change (entry1615 i).check = true at h
  rcases fields1615 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 134 ≤ d) (hhi : d < 367) :
    forwardStepOK (-768) (charge 134 d) shift (S (d + 1)) (S 135)
      (T 134 (d + 1)) (T 134 d) (T 135 d)
      (OriginalRow227Roots.root_pos 135 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 134 (by decide)) = true := by
  by_cases h262 : d < 262
  ·
    by_cases h198 : d < 198
    ·
      by_cases h166 : d < 166
      ·
        have hi : d - 134 < 32 := by omega
        have heq : 134 + (d - 134) = d := by omega
        simpa only [heq] using step1608 ⟨d - 134, hi⟩
      ·
        have hi : d - 166 < 32 := by omega
        have heq : 166 + (d - 166) = d := by omega
        simpa only [heq] using step1609 ⟨d - 166, hi⟩
    ·
      by_cases h230 : d < 230
      ·
        have hi : d - 198 < 32 := by omega
        have heq : 198 + (d - 198) = d := by omega
        simpa only [heq] using step1610 ⟨d - 198, hi⟩
      ·
        have hi : d - 230 < 32 := by omega
        have heq : 230 + (d - 230) = d := by omega
        simpa only [heq] using step1611 ⟨d - 230, hi⟩
  ·
    by_cases h326 : d < 326
    ·
      by_cases h294 : d < 294
      ·
        have hi : d - 262 < 32 := by omega
        have heq : 262 + (d - 262) = d := by omega
        simpa only [heq] using step1612 ⟨d - 262, hi⟩
      ·
        have hi : d - 294 < 32 := by omega
        have heq : 294 + (d - 294) = d := by omega
        simpa only [heq] using step1613 ⟨d - 294, hi⟩
    ·
      by_cases h358 : d < 358
      ·
        have hi : d - 326 < 32 := by omega
        have heq : 326 + (d - 326) = d := by omega
        simpa only [heq] using step1614 ⟨d - 326, hi⟩
      ·
        have hi : d - 358 < 9 := by omega
        have heq : 358 + (d - 358) = d := by omega
        simpa only [heq] using step1615 ⟨d - 358, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1608,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1608,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1609,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1609,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1610,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1610,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1611,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1611,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1612,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1612,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1613,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1613,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1614,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1614,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.fields1615,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.step1615,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow135
