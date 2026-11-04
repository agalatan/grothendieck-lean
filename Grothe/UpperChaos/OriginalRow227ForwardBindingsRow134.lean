import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow134
import Grothe.UpperChaos.OriginalRow227TriangleForward1600
import Grothe.UpperChaos.OriginalRow227TriangleForward1601
import Grothe.UpperChaos.OriginalRow227TriangleForward1602
import Grothe.UpperChaos.OriginalRow227TriangleForward1603
import Grothe.UpperChaos.OriginalRow227TriangleForward1604
import Grothe.UpperChaos.OriginalRow227TriangleForward1605
import Grothe.UpperChaos.OriginalRow227TriangleForward1606
import Grothe.UpperChaos.OriginalRow227TriangleForward1607

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1600 : OriginalRow227TriangleForward1600.entries.size = 32 := rfl

def entry1600 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1600.entries[i.val]'(by rw [size1600]; exact i.isLt)

theorem fields1600 (i : Fin 32) :
    (entry1600 i).IA = shift ∧ (entry1600 i).ID = S (133 + i.val + 1) ∧
      (entry1600 i).IC = S 134 ∧ (entry1600 i).Inext = T 133 (133 + i.val + 1) ∧
      (entry1600 i).Icur = T 133 (133 + i.val) ∧
      (entry1600 i).output = T 134 (133 + i.val) ∧
      (entry1600 i).charge = charge 133 (133 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1616_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1600 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (133 + i.val)) shift
      (S (133 + i.val + 1)) (S 134) (T 133 (133 + i.val + 1))
      (T 133 (133 + i.val)) (T 134 (133 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1600.entries OriginalRow227TriangleForward1600.checked
    ⟨i.val, by rw [size1600]; exact i.isLt⟩
  change (entry1600 i).check = true at h
  rcases fields1600 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1601 : OriginalRow227TriangleForward1601.entries.size = 32 := rfl

def entry1601 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1601.entries[i.val]'(by rw [size1601]; exact i.isLt)

theorem fields1601 (i : Fin 32) :
    (entry1601 i).IA = shift ∧ (entry1601 i).ID = S (165 + i.val + 1) ∧
      (entry1601 i).IC = S 134 ∧ (entry1601 i).Inext = T 133 (165 + i.val + 1) ∧
      (entry1601 i).Icur = T 133 (165 + i.val) ∧
      (entry1601 i).output = T 134 (165 + i.val) ∧
      (entry1601 i).charge = charge 133 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1617_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1601 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 134) (T 133 (165 + i.val + 1))
      (T 133 (165 + i.val)) (T 134 (165 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1601.entries OriginalRow227TriangleForward1601.checked
    ⟨i.val, by rw [size1601]; exact i.isLt⟩
  change (entry1601 i).check = true at h
  rcases fields1601 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1602 : OriginalRow227TriangleForward1602.entries.size = 32 := rfl

def entry1602 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1602.entries[i.val]'(by rw [size1602]; exact i.isLt)

theorem fields1602 (i : Fin 32) :
    (entry1602 i).IA = shift ∧ (entry1602 i).ID = S (197 + i.val + 1) ∧
      (entry1602 i).IC = S 134 ∧ (entry1602 i).Inext = T 133 (197 + i.val + 1) ∧
      (entry1602 i).Icur = T 133 (197 + i.val) ∧
      (entry1602 i).output = T 134 (197 + i.val) ∧
      (entry1602 i).charge = charge 133 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1618_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1602 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 134) (T 133 (197 + i.val + 1))
      (T 133 (197 + i.val)) (T 134 (197 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1602.entries OriginalRow227TriangleForward1602.checked
    ⟨i.val, by rw [size1602]; exact i.isLt⟩
  change (entry1602 i).check = true at h
  rcases fields1602 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1603 : OriginalRow227TriangleForward1603.entries.size = 32 := rfl

def entry1603 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1603.entries[i.val]'(by rw [size1603]; exact i.isLt)

theorem fields1603 (i : Fin 32) :
    (entry1603 i).IA = shift ∧ (entry1603 i).ID = S (229 + i.val + 1) ∧
      (entry1603 i).IC = S 134 ∧ (entry1603 i).Inext = T 133 (229 + i.val + 1) ∧
      (entry1603 i).Icur = T 133 (229 + i.val) ∧
      (entry1603 i).output = T 134 (229 + i.val) ∧
      (entry1603 i).charge = charge 133 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1619_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1603 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 134) (T 133 (229 + i.val + 1))
      (T 133 (229 + i.val)) (T 134 (229 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1603.entries OriginalRow227TriangleForward1603.checked
    ⟨i.val, by rw [size1603]; exact i.isLt⟩
  change (entry1603 i).check = true at h
  rcases fields1603 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1604 : OriginalRow227TriangleForward1604.entries.size = 32 := rfl

def entry1604 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1604.entries[i.val]'(by rw [size1604]; exact i.isLt)

theorem fields1604 (i : Fin 32) :
    (entry1604 i).IA = shift ∧ (entry1604 i).ID = S (261 + i.val + 1) ∧
      (entry1604 i).IC = S 134 ∧ (entry1604 i).Inext = T 133 (261 + i.val + 1) ∧
      (entry1604 i).Icur = T 133 (261 + i.val) ∧
      (entry1604 i).output = T 134 (261 + i.val) ∧
      (entry1604 i).charge = charge 133 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1620_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1604 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 134) (T 133 (261 + i.val + 1))
      (T 133 (261 + i.val)) (T 134 (261 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1604.entries OriginalRow227TriangleForward1604.checked
    ⟨i.val, by rw [size1604]; exact i.isLt⟩
  change (entry1604 i).check = true at h
  rcases fields1604 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1605 : OriginalRow227TriangleForward1605.entries.size = 32 := rfl

def entry1605 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1605.entries[i.val]'(by rw [size1605]; exact i.isLt)

theorem fields1605 (i : Fin 32) :
    (entry1605 i).IA = shift ∧ (entry1605 i).ID = S (293 + i.val + 1) ∧
      (entry1605 i).IC = S 134 ∧ (entry1605 i).Inext = T 133 (293 + i.val + 1) ∧
      (entry1605 i).Icur = T 133 (293 + i.val) ∧
      (entry1605 i).output = T 134 (293 + i.val) ∧
      (entry1605 i).charge = charge 133 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1621_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1605 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 134) (T 133 (293 + i.val + 1))
      (T 133 (293 + i.val)) (T 134 (293 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1605.entries OriginalRow227TriangleForward1605.checked
    ⟨i.val, by rw [size1605]; exact i.isLt⟩
  change (entry1605 i).check = true at h
  rcases fields1605 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1606 : OriginalRow227TriangleForward1606.entries.size = 32 := rfl

def entry1606 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1606.entries[i.val]'(by rw [size1606]; exact i.isLt)

theorem fields1606 (i : Fin 32) :
    (entry1606 i).IA = shift ∧ (entry1606 i).ID = S (325 + i.val + 1) ∧
      (entry1606 i).IC = S 134 ∧ (entry1606 i).Inext = T 133 (325 + i.val + 1) ∧
      (entry1606 i).Icur = T 133 (325 + i.val) ∧
      (entry1606 i).output = T 134 (325 + i.val) ∧
      (entry1606 i).charge = charge 133 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1622_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1606 (i : Fin 32) :
    forwardStepOK (-768) (charge 133 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 134) (T 133 (325 + i.val + 1))
      (T 133 (325 + i.val)) (T 134 (325 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1606.entries OriginalRow227TriangleForward1606.checked
    ⟨i.val, by rw [size1606]; exact i.isLt⟩
  change (entry1606 i).check = true at h
  rcases fields1606 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1607 : OriginalRow227TriangleForward1607.entries.size = 11 := rfl

def entry1607 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1607.entries[i.val]'(by rw [size1607]; exact i.isLt)

theorem fields1607 (i : Fin 11) :
    (entry1607 i).IA = shift ∧ (entry1607 i).ID = S (357 + i.val + 1) ∧
      (entry1607 i).IC = S 134 ∧ (entry1607 i).Inext = T 133 (357 + i.val + 1) ∧
      (entry1607 i).Icur = T 133 (357 + i.val) ∧
      (entry1607 i).output = T 134 (357 + i.val) ∧
      (entry1607 i).charge = charge 133 (357 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root134).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow134.block1623_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1607 (i : Fin 11) :
    forwardStepOK (-768) (charge 133 (357 + i.val)) shift
      (S (357 + i.val + 1)) (S 134) (T 133 (357 + i.val + 1))
      (T 133 (357 + i.val)) (T 134 (357 + i.val))
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1607.entries OriginalRow227TriangleForward1607.checked
    ⟨i.val, by rw [size1607]; exact i.isLt⟩
  change (entry1607 i).check = true at h
  rcases fields1607 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 133 ≤ d) (hhi : d < 368) :
    forwardStepOK (-768) (charge 133 d) shift (S (d + 1)) (S 134)
      (T 133 (d + 1)) (T 133 d) (T 134 d)
      (OriginalRow227Roots.root_pos 134 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 133 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h197 : d < 197
    ·
      by_cases h165 : d < 165
      ·
        have hi : d - 133 < 32 := by omega
        have heq : 133 + (d - 133) = d := by omega
        simpa only [heq] using step1600 ⟨d - 133, hi⟩
      ·
        have hi : d - 165 < 32 := by omega
        have heq : 165 + (d - 165) = d := by omega
        simpa only [heq] using step1601 ⟨d - 165, hi⟩
    ·
      by_cases h229 : d < 229
      ·
        have hi : d - 197 < 32 := by omega
        have heq : 197 + (d - 197) = d := by omega
        simpa only [heq] using step1602 ⟨d - 197, hi⟩
      ·
        have hi : d - 229 < 32 := by omega
        have heq : 229 + (d - 229) = d := by omega
        simpa only [heq] using step1603 ⟨d - 229, hi⟩
  ·
    by_cases h325 : d < 325
    ·
      by_cases h293 : d < 293
      ·
        have hi : d - 261 < 32 := by omega
        have heq : 261 + (d - 261) = d := by omega
        simpa only [heq] using step1604 ⟨d - 261, hi⟩
      ·
        have hi : d - 293 < 32 := by omega
        have heq : 293 + (d - 293) = d := by omega
        simpa only [heq] using step1605 ⟨d - 293, hi⟩
    ·
      by_cases h357 : d < 357
      ·
        have hi : d - 325 < 32 := by omega
        have heq : 325 + (d - 325) = d := by omega
        simpa only [heq] using step1606 ⟨d - 325, hi⟩
      ·
        have hi : d - 357 < 11 := by omega
        have heq : 357 + (d - 357) = d := by omega
        simpa only [heq] using step1607 ⟨d - 357, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1600,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1600,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1601,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1601,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1602,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1602,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1603,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1603,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1604,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1604,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1605,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1605,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1606,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1606,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.fields1607,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.step1607,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow134
