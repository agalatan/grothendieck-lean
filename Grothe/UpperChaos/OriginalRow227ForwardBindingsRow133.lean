import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow133
import Grothe.UpperChaos.OriginalRow227TriangleForward1592
import Grothe.UpperChaos.OriginalRow227TriangleForward1593
import Grothe.UpperChaos.OriginalRow227TriangleForward1594
import Grothe.UpperChaos.OriginalRow227TriangleForward1595
import Grothe.UpperChaos.OriginalRow227TriangleForward1596
import Grothe.UpperChaos.OriginalRow227TriangleForward1597
import Grothe.UpperChaos.OriginalRow227TriangleForward1598
import Grothe.UpperChaos.OriginalRow227TriangleForward1599

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1592 : OriginalRow227TriangleForward1592.entries.size = 32 := rfl

def entry1592 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1592.entries[i.val]'(by rw [size1592]; exact i.isLt)

theorem fields1592 (i : Fin 32) :
    (entry1592 i).IA = shift ∧ (entry1592 i).ID = S (132 + i.val + 1) ∧
      (entry1592 i).IC = S 133 ∧ (entry1592 i).Inext = T 132 (132 + i.val + 1) ∧
      (entry1592 i).Icur = T 132 (132 + i.val) ∧
      (entry1592 i).output = T 133 (132 + i.val) ∧
      (entry1592 i).charge = charge 132 (132 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1608_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1592 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (132 + i.val)) shift
      (S (132 + i.val + 1)) (S 133) (T 132 (132 + i.val + 1))
      (T 132 (132 + i.val)) (T 133 (132 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1592.entries OriginalRow227TriangleForward1592.checked
    ⟨i.val, by rw [size1592]; exact i.isLt⟩
  change (entry1592 i).check = true at h
  rcases fields1592 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1593 : OriginalRow227TriangleForward1593.entries.size = 32 := rfl

def entry1593 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1593.entries[i.val]'(by rw [size1593]; exact i.isLt)

theorem fields1593 (i : Fin 32) :
    (entry1593 i).IA = shift ∧ (entry1593 i).ID = S (164 + i.val + 1) ∧
      (entry1593 i).IC = S 133 ∧ (entry1593 i).Inext = T 132 (164 + i.val + 1) ∧
      (entry1593 i).Icur = T 132 (164 + i.val) ∧
      (entry1593 i).output = T 133 (164 + i.val) ∧
      (entry1593 i).charge = charge 132 (164 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1609_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1593 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (164 + i.val)) shift
      (S (164 + i.val + 1)) (S 133) (T 132 (164 + i.val + 1))
      (T 132 (164 + i.val)) (T 133 (164 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1593.entries OriginalRow227TriangleForward1593.checked
    ⟨i.val, by rw [size1593]; exact i.isLt⟩
  change (entry1593 i).check = true at h
  rcases fields1593 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1594 : OriginalRow227TriangleForward1594.entries.size = 32 := rfl

def entry1594 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1594.entries[i.val]'(by rw [size1594]; exact i.isLt)

theorem fields1594 (i : Fin 32) :
    (entry1594 i).IA = shift ∧ (entry1594 i).ID = S (196 + i.val + 1) ∧
      (entry1594 i).IC = S 133 ∧ (entry1594 i).Inext = T 132 (196 + i.val + 1) ∧
      (entry1594 i).Icur = T 132 (196 + i.val) ∧
      (entry1594 i).output = T 133 (196 + i.val) ∧
      (entry1594 i).charge = charge 132 (196 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1610_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1594 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (196 + i.val)) shift
      (S (196 + i.val + 1)) (S 133) (T 132 (196 + i.val + 1))
      (T 132 (196 + i.val)) (T 133 (196 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1594.entries OriginalRow227TriangleForward1594.checked
    ⟨i.val, by rw [size1594]; exact i.isLt⟩
  change (entry1594 i).check = true at h
  rcases fields1594 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1595 : OriginalRow227TriangleForward1595.entries.size = 32 := rfl

def entry1595 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1595.entries[i.val]'(by rw [size1595]; exact i.isLt)

theorem fields1595 (i : Fin 32) :
    (entry1595 i).IA = shift ∧ (entry1595 i).ID = S (228 + i.val + 1) ∧
      (entry1595 i).IC = S 133 ∧ (entry1595 i).Inext = T 132 (228 + i.val + 1) ∧
      (entry1595 i).Icur = T 132 (228 + i.val) ∧
      (entry1595 i).output = T 133 (228 + i.val) ∧
      (entry1595 i).charge = charge 132 (228 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1611_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1595 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (228 + i.val)) shift
      (S (228 + i.val + 1)) (S 133) (T 132 (228 + i.val + 1))
      (T 132 (228 + i.val)) (T 133 (228 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1595.entries OriginalRow227TriangleForward1595.checked
    ⟨i.val, by rw [size1595]; exact i.isLt⟩
  change (entry1595 i).check = true at h
  rcases fields1595 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1596 : OriginalRow227TriangleForward1596.entries.size = 32 := rfl

def entry1596 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1596.entries[i.val]'(by rw [size1596]; exact i.isLt)

theorem fields1596 (i : Fin 32) :
    (entry1596 i).IA = shift ∧ (entry1596 i).ID = S (260 + i.val + 1) ∧
      (entry1596 i).IC = S 133 ∧ (entry1596 i).Inext = T 132 (260 + i.val + 1) ∧
      (entry1596 i).Icur = T 132 (260 + i.val) ∧
      (entry1596 i).output = T 133 (260 + i.val) ∧
      (entry1596 i).charge = charge 132 (260 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1612_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1596 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (260 + i.val)) shift
      (S (260 + i.val + 1)) (S 133) (T 132 (260 + i.val + 1))
      (T 132 (260 + i.val)) (T 133 (260 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1596.entries OriginalRow227TriangleForward1596.checked
    ⟨i.val, by rw [size1596]; exact i.isLt⟩
  change (entry1596 i).check = true at h
  rcases fields1596 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1597 : OriginalRow227TriangleForward1597.entries.size = 32 := rfl

def entry1597 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1597.entries[i.val]'(by rw [size1597]; exact i.isLt)

theorem fields1597 (i : Fin 32) :
    (entry1597 i).IA = shift ∧ (entry1597 i).ID = S (292 + i.val + 1) ∧
      (entry1597 i).IC = S 133 ∧ (entry1597 i).Inext = T 132 (292 + i.val + 1) ∧
      (entry1597 i).Icur = T 132 (292 + i.val) ∧
      (entry1597 i).output = T 133 (292 + i.val) ∧
      (entry1597 i).charge = charge 132 (292 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1613_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1597 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (292 + i.val)) shift
      (S (292 + i.val + 1)) (S 133) (T 132 (292 + i.val + 1))
      (T 132 (292 + i.val)) (T 133 (292 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1597.entries OriginalRow227TriangleForward1597.checked
    ⟨i.val, by rw [size1597]; exact i.isLt⟩
  change (entry1597 i).check = true at h
  rcases fields1597 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1598 : OriginalRow227TriangleForward1598.entries.size = 32 := rfl

def entry1598 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1598.entries[i.val]'(by rw [size1598]; exact i.isLt)

theorem fields1598 (i : Fin 32) :
    (entry1598 i).IA = shift ∧ (entry1598 i).ID = S (324 + i.val + 1) ∧
      (entry1598 i).IC = S 133 ∧ (entry1598 i).Inext = T 132 (324 + i.val + 1) ∧
      (entry1598 i).Icur = T 132 (324 + i.val) ∧
      (entry1598 i).output = T 133 (324 + i.val) ∧
      (entry1598 i).charge = charge 132 (324 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1614_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1598 (i : Fin 32) :
    forwardStepOK (-768) (charge 132 (324 + i.val)) shift
      (S (324 + i.val + 1)) (S 133) (T 132 (324 + i.val + 1))
      (T 132 (324 + i.val)) (T 133 (324 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1598.entries OriginalRow227TriangleForward1598.checked
    ⟨i.val, by rw [size1598]; exact i.isLt⟩
  change (entry1598 i).check = true at h
  rcases fields1598 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1599 : OriginalRow227TriangleForward1599.entries.size = 13 := rfl

def entry1599 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1599.entries[i.val]'(by rw [size1599]; exact i.isLt)

theorem fields1599 (i : Fin 13) :
    (entry1599 i).IA = shift ∧ (entry1599 i).ID = S (356 + i.val + 1) ∧
      (entry1599 i).IC = S 133 ∧ (entry1599 i).Inext = T 132 (356 + i.val + 1) ∧
      (entry1599 i).Icur = T 132 (356 + i.val) ∧
      (entry1599 i).output = T 133 (356 + i.val) ∧
      (entry1599 i).charge = charge 132 (356 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings04.S_eq_root133).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow133.block1615_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1599 (i : Fin 13) :
    forwardStepOK (-768) (charge 132 (356 + i.val)) shift
      (S (356 + i.val + 1)) (S 133) (T 132 (356 + i.val + 1))
      (T 132 (356 + i.val)) (T 133 (356 + i.val))
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1599.entries OriginalRow227TriangleForward1599.checked
    ⟨i.val, by rw [size1599]; exact i.isLt⟩
  change (entry1599 i).check = true at h
  rcases fields1599 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 132 ≤ d) (hhi : d < 369) :
    forwardStepOK (-768) (charge 132 d) shift (S (d + 1)) (S 133)
      (T 132 (d + 1)) (T 132 d) (T 133 d)
      (OriginalRow227Roots.root_pos 133 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 132 (by decide)) = true := by
  by_cases h260 : d < 260
  ·
    by_cases h196 : d < 196
    ·
      by_cases h164 : d < 164
      ·
        have hi : d - 132 < 32 := by omega
        have heq : 132 + (d - 132) = d := by omega
        simpa only [heq] using step1592 ⟨d - 132, hi⟩
      ·
        have hi : d - 164 < 32 := by omega
        have heq : 164 + (d - 164) = d := by omega
        simpa only [heq] using step1593 ⟨d - 164, hi⟩
    ·
      by_cases h228 : d < 228
      ·
        have hi : d - 196 < 32 := by omega
        have heq : 196 + (d - 196) = d := by omega
        simpa only [heq] using step1594 ⟨d - 196, hi⟩
      ·
        have hi : d - 228 < 32 := by omega
        have heq : 228 + (d - 228) = d := by omega
        simpa only [heq] using step1595 ⟨d - 228, hi⟩
  ·
    by_cases h324 : d < 324
    ·
      by_cases h292 : d < 292
      ·
        have hi : d - 260 < 32 := by omega
        have heq : 260 + (d - 260) = d := by omega
        simpa only [heq] using step1596 ⟨d - 260, hi⟩
      ·
        have hi : d - 292 < 32 := by omega
        have heq : 292 + (d - 292) = d := by omega
        simpa only [heq] using step1597 ⟨d - 292, hi⟩
    ·
      by_cases h356 : d < 356
      ·
        have hi : d - 324 < 32 := by omega
        have heq : 324 + (d - 324) = d := by omega
        simpa only [heq] using step1598 ⟨d - 324, hi⟩
      ·
        have hi : d - 356 < 13 := by omega
        have heq : 356 + (d - 356) = d := by omega
        simpa only [heq] using step1599 ⟨d - 356, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1592,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1592,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1593,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1593,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1594,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1594,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1595,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1595,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1596,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1596,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1597,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1597,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1598,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1598,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.fields1599,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.step1599,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow133
