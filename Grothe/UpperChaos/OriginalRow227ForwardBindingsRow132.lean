import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow132
import Grothe.UpperChaos.OriginalRow227TriangleForward1584
import Grothe.UpperChaos.OriginalRow227TriangleForward1585
import Grothe.UpperChaos.OriginalRow227TriangleForward1586
import Grothe.UpperChaos.OriginalRow227TriangleForward1587
import Grothe.UpperChaos.OriginalRow227TriangleForward1588
import Grothe.UpperChaos.OriginalRow227TriangleForward1589
import Grothe.UpperChaos.OriginalRow227TriangleForward1590
import Grothe.UpperChaos.OriginalRow227TriangleForward1591

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1584 : OriginalRow227TriangleForward1584.entries.size = 32 := rfl

def entry1584 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1584.entries[i.val]'(by rw [size1584]; exact i.isLt)

theorem fields1584 (i : Fin 32) :
    (entry1584 i).IA = shift ∧ (entry1584 i).ID = S (131 + i.val + 1) ∧
      (entry1584 i).IC = S 132 ∧ (entry1584 i).Inext = T 131 (131 + i.val + 1) ∧
      (entry1584 i).Icur = T 131 (131 + i.val) ∧
      (entry1584 i).output = T 132 (131 + i.val) ∧
      (entry1584 i).charge = charge 131 (131 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1600_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1584 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (131 + i.val)) shift
      (S (131 + i.val + 1)) (S 132) (T 131 (131 + i.val + 1))
      (T 131 (131 + i.val)) (T 132 (131 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1584.entries OriginalRow227TriangleForward1584.checked
    ⟨i.val, by rw [size1584]; exact i.isLt⟩
  change (entry1584 i).check = true at h
  rcases fields1584 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1585 : OriginalRow227TriangleForward1585.entries.size = 32 := rfl

def entry1585 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1585.entries[i.val]'(by rw [size1585]; exact i.isLt)

theorem fields1585 (i : Fin 32) :
    (entry1585 i).IA = shift ∧ (entry1585 i).ID = S (163 + i.val + 1) ∧
      (entry1585 i).IC = S 132 ∧ (entry1585 i).Inext = T 131 (163 + i.val + 1) ∧
      (entry1585 i).Icur = T 131 (163 + i.val) ∧
      (entry1585 i).output = T 132 (163 + i.val) ∧
      (entry1585 i).charge = charge 131 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1601_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1585 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 132) (T 131 (163 + i.val + 1))
      (T 131 (163 + i.val)) (T 132 (163 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1585.entries OriginalRow227TriangleForward1585.checked
    ⟨i.val, by rw [size1585]; exact i.isLt⟩
  change (entry1585 i).check = true at h
  rcases fields1585 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1586 : OriginalRow227TriangleForward1586.entries.size = 32 := rfl

def entry1586 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1586.entries[i.val]'(by rw [size1586]; exact i.isLt)

theorem fields1586 (i : Fin 32) :
    (entry1586 i).IA = shift ∧ (entry1586 i).ID = S (195 + i.val + 1) ∧
      (entry1586 i).IC = S 132 ∧ (entry1586 i).Inext = T 131 (195 + i.val + 1) ∧
      (entry1586 i).Icur = T 131 (195 + i.val) ∧
      (entry1586 i).output = T 132 (195 + i.val) ∧
      (entry1586 i).charge = charge 131 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1602_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1586 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 132) (T 131 (195 + i.val + 1))
      (T 131 (195 + i.val)) (T 132 (195 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1586.entries OriginalRow227TriangleForward1586.checked
    ⟨i.val, by rw [size1586]; exact i.isLt⟩
  change (entry1586 i).check = true at h
  rcases fields1586 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1587 : OriginalRow227TriangleForward1587.entries.size = 32 := rfl

def entry1587 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1587.entries[i.val]'(by rw [size1587]; exact i.isLt)

theorem fields1587 (i : Fin 32) :
    (entry1587 i).IA = shift ∧ (entry1587 i).ID = S (227 + i.val + 1) ∧
      (entry1587 i).IC = S 132 ∧ (entry1587 i).Inext = T 131 (227 + i.val + 1) ∧
      (entry1587 i).Icur = T 131 (227 + i.val) ∧
      (entry1587 i).output = T 132 (227 + i.val) ∧
      (entry1587 i).charge = charge 131 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1603_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1587 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 132) (T 131 (227 + i.val + 1))
      (T 131 (227 + i.val)) (T 132 (227 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1587.entries OriginalRow227TriangleForward1587.checked
    ⟨i.val, by rw [size1587]; exact i.isLt⟩
  change (entry1587 i).check = true at h
  rcases fields1587 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1588 : OriginalRow227TriangleForward1588.entries.size = 32 := rfl

def entry1588 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1588.entries[i.val]'(by rw [size1588]; exact i.isLt)

theorem fields1588 (i : Fin 32) :
    (entry1588 i).IA = shift ∧ (entry1588 i).ID = S (259 + i.val + 1) ∧
      (entry1588 i).IC = S 132 ∧ (entry1588 i).Inext = T 131 (259 + i.val + 1) ∧
      (entry1588 i).Icur = T 131 (259 + i.val) ∧
      (entry1588 i).output = T 132 (259 + i.val) ∧
      (entry1588 i).charge = charge 131 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1604_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1588 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 132) (T 131 (259 + i.val + 1))
      (T 131 (259 + i.val)) (T 132 (259 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1588.entries OriginalRow227TriangleForward1588.checked
    ⟨i.val, by rw [size1588]; exact i.isLt⟩
  change (entry1588 i).check = true at h
  rcases fields1588 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1589 : OriginalRow227TriangleForward1589.entries.size = 32 := rfl

def entry1589 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1589.entries[i.val]'(by rw [size1589]; exact i.isLt)

theorem fields1589 (i : Fin 32) :
    (entry1589 i).IA = shift ∧ (entry1589 i).ID = S (291 + i.val + 1) ∧
      (entry1589 i).IC = S 132 ∧ (entry1589 i).Inext = T 131 (291 + i.val + 1) ∧
      (entry1589 i).Icur = T 131 (291 + i.val) ∧
      (entry1589 i).output = T 132 (291 + i.val) ∧
      (entry1589 i).charge = charge 131 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1605_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1589 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 132) (T 131 (291 + i.val + 1))
      (T 131 (291 + i.val)) (T 132 (291 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1589.entries OriginalRow227TriangleForward1589.checked
    ⟨i.val, by rw [size1589]; exact i.isLt⟩
  change (entry1589 i).check = true at h
  rcases fields1589 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1590 : OriginalRow227TriangleForward1590.entries.size = 32 := rfl

def entry1590 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1590.entries[i.val]'(by rw [size1590]; exact i.isLt)

theorem fields1590 (i : Fin 32) :
    (entry1590 i).IA = shift ∧ (entry1590 i).ID = S (323 + i.val + 1) ∧
      (entry1590 i).IC = S 132 ∧ (entry1590 i).Inext = T 131 (323 + i.val + 1) ∧
      (entry1590 i).Icur = T 131 (323 + i.val) ∧
      (entry1590 i).output = T 132 (323 + i.val) ∧
      (entry1590 i).charge = charge 131 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1606_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1590 (i : Fin 32) :
    forwardStepOK (-768) (charge 131 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 132) (T 131 (323 + i.val + 1))
      (T 131 (323 + i.val)) (T 132 (323 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1590.entries OriginalRow227TriangleForward1590.checked
    ⟨i.val, by rw [size1590]; exact i.isLt⟩
  change (entry1590 i).check = true at h
  rcases fields1590 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1591 : OriginalRow227TriangleForward1591.entries.size = 15 := rfl

def entry1591 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1591.entries[i.val]'(by rw [size1591]; exact i.isLt)

theorem fields1591 (i : Fin 15) :
    (entry1591 i).IA = shift ∧ (entry1591 i).ID = S (355 + i.val + 1) ∧
      (entry1591 i).IC = S 132 ∧ (entry1591 i).Inext = T 131 (355 + i.val + 1) ∧
      (entry1591 i).Icur = T 131 (355 + i.val) ∧
      (entry1591 i).output = T 132 (355 + i.val) ∧
      (entry1591 i).charge = charge 131 (355 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings04.S_eq_root132).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow132.block1607_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1591 (i : Fin 15) :
    forwardStepOK (-768) (charge 131 (355 + i.val)) shift
      (S (355 + i.val + 1)) (S 132) (T 131 (355 + i.val + 1))
      (T 131 (355 + i.val)) (T 132 (355 + i.val))
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1591.entries OriginalRow227TriangleForward1591.checked
    ⟨i.val, by rw [size1591]; exact i.isLt⟩
  change (entry1591 i).check = true at h
  rcases fields1591 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 131 ≤ d) (hhi : d < 370) :
    forwardStepOK (-768) (charge 131 d) shift (S (d + 1)) (S 132)
      (T 131 (d + 1)) (T 131 d) (T 132 d)
      (OriginalRow227Roots.root_pos 132 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 131 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h195 : d < 195
    ·
      by_cases h163 : d < 163
      ·
        have hi : d - 131 < 32 := by omega
        have heq : 131 + (d - 131) = d := by omega
        simpa only [heq] using step1584 ⟨d - 131, hi⟩
      ·
        have hi : d - 163 < 32 := by omega
        have heq : 163 + (d - 163) = d := by omega
        simpa only [heq] using step1585 ⟨d - 163, hi⟩
    ·
      by_cases h227 : d < 227
      ·
        have hi : d - 195 < 32 := by omega
        have heq : 195 + (d - 195) = d := by omega
        simpa only [heq] using step1586 ⟨d - 195, hi⟩
      ·
        have hi : d - 227 < 32 := by omega
        have heq : 227 + (d - 227) = d := by omega
        simpa only [heq] using step1587 ⟨d - 227, hi⟩
  ·
    by_cases h323 : d < 323
    ·
      by_cases h291 : d < 291
      ·
        have hi : d - 259 < 32 := by omega
        have heq : 259 + (d - 259) = d := by omega
        simpa only [heq] using step1588 ⟨d - 259, hi⟩
      ·
        have hi : d - 291 < 32 := by omega
        have heq : 291 + (d - 291) = d := by omega
        simpa only [heq] using step1589 ⟨d - 291, hi⟩
    ·
      by_cases h355 : d < 355
      ·
        have hi : d - 323 < 32 := by omega
        have heq : 323 + (d - 323) = d := by omega
        simpa only [heq] using step1590 ⟨d - 323, hi⟩
      ·
        have hi : d - 355 < 15 := by omega
        have heq : 355 + (d - 355) = d := by omega
        simpa only [heq] using step1591 ⟨d - 355, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1584,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1584,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1585,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1585,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1586,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1586,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1587,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1587,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1588,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1588,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1589,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1589,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1590,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1590,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.fields1591,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.step1591,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow132
