import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow131
import Grothe.UpperChaos.OriginalRow227TriangleForward1576
import Grothe.UpperChaos.OriginalRow227TriangleForward1577
import Grothe.UpperChaos.OriginalRow227TriangleForward1578
import Grothe.UpperChaos.OriginalRow227TriangleForward1579
import Grothe.UpperChaos.OriginalRow227TriangleForward1580
import Grothe.UpperChaos.OriginalRow227TriangleForward1581
import Grothe.UpperChaos.OriginalRow227TriangleForward1582
import Grothe.UpperChaos.OriginalRow227TriangleForward1583

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1576 : OriginalRow227TriangleForward1576.entries.size = 32 := rfl

def entry1576 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1576.entries[i.val]'(by rw [size1576]; exact i.isLt)

theorem fields1576 (i : Fin 32) :
    (entry1576 i).IA = shift ∧ (entry1576 i).ID = S (130 + i.val + 1) ∧
      (entry1576 i).IC = S 131 ∧ (entry1576 i).Inext = T 130 (130 + i.val + 1) ∧
      (entry1576 i).Icur = T 130 (130 + i.val) ∧
      (entry1576 i).output = T 131 (130 + i.val) ∧
      (entry1576 i).charge = charge 130 (130 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1592_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1576 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (130 + i.val)) shift
      (S (130 + i.val + 1)) (S 131) (T 130 (130 + i.val + 1))
      (T 130 (130 + i.val)) (T 131 (130 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1576.entries OriginalRow227TriangleForward1576.checked
    ⟨i.val, by rw [size1576]; exact i.isLt⟩
  change (entry1576 i).check = true at h
  rcases fields1576 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1577 : OriginalRow227TriangleForward1577.entries.size = 32 := rfl

def entry1577 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1577.entries[i.val]'(by rw [size1577]; exact i.isLt)

theorem fields1577 (i : Fin 32) :
    (entry1577 i).IA = shift ∧ (entry1577 i).ID = S (162 + i.val + 1) ∧
      (entry1577 i).IC = S 131 ∧ (entry1577 i).Inext = T 130 (162 + i.val + 1) ∧
      (entry1577 i).Icur = T 130 (162 + i.val) ∧
      (entry1577 i).output = T 131 (162 + i.val) ∧
      (entry1577 i).charge = charge 130 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1593_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1577 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 131) (T 130 (162 + i.val + 1))
      (T 130 (162 + i.val)) (T 131 (162 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1577.entries OriginalRow227TriangleForward1577.checked
    ⟨i.val, by rw [size1577]; exact i.isLt⟩
  change (entry1577 i).check = true at h
  rcases fields1577 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1578 : OriginalRow227TriangleForward1578.entries.size = 32 := rfl

def entry1578 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1578.entries[i.val]'(by rw [size1578]; exact i.isLt)

theorem fields1578 (i : Fin 32) :
    (entry1578 i).IA = shift ∧ (entry1578 i).ID = S (194 + i.val + 1) ∧
      (entry1578 i).IC = S 131 ∧ (entry1578 i).Inext = T 130 (194 + i.val + 1) ∧
      (entry1578 i).Icur = T 130 (194 + i.val) ∧
      (entry1578 i).output = T 131 (194 + i.val) ∧
      (entry1578 i).charge = charge 130 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1594_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1578 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 131) (T 130 (194 + i.val + 1))
      (T 130 (194 + i.val)) (T 131 (194 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1578.entries OriginalRow227TriangleForward1578.checked
    ⟨i.val, by rw [size1578]; exact i.isLt⟩
  change (entry1578 i).check = true at h
  rcases fields1578 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1579 : OriginalRow227TriangleForward1579.entries.size = 32 := rfl

def entry1579 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1579.entries[i.val]'(by rw [size1579]; exact i.isLt)

theorem fields1579 (i : Fin 32) :
    (entry1579 i).IA = shift ∧ (entry1579 i).ID = S (226 + i.val + 1) ∧
      (entry1579 i).IC = S 131 ∧ (entry1579 i).Inext = T 130 (226 + i.val + 1) ∧
      (entry1579 i).Icur = T 130 (226 + i.val) ∧
      (entry1579 i).output = T 131 (226 + i.val) ∧
      (entry1579 i).charge = charge 130 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1595_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1579 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 131) (T 130 (226 + i.val + 1))
      (T 130 (226 + i.val)) (T 131 (226 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1579.entries OriginalRow227TriangleForward1579.checked
    ⟨i.val, by rw [size1579]; exact i.isLt⟩
  change (entry1579 i).check = true at h
  rcases fields1579 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1580 : OriginalRow227TriangleForward1580.entries.size = 32 := rfl

def entry1580 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1580.entries[i.val]'(by rw [size1580]; exact i.isLt)

theorem fields1580 (i : Fin 32) :
    (entry1580 i).IA = shift ∧ (entry1580 i).ID = S (258 + i.val + 1) ∧
      (entry1580 i).IC = S 131 ∧ (entry1580 i).Inext = T 130 (258 + i.val + 1) ∧
      (entry1580 i).Icur = T 130 (258 + i.val) ∧
      (entry1580 i).output = T 131 (258 + i.val) ∧
      (entry1580 i).charge = charge 130 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1596_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1580 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 131) (T 130 (258 + i.val + 1))
      (T 130 (258 + i.val)) (T 131 (258 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1580.entries OriginalRow227TriangleForward1580.checked
    ⟨i.val, by rw [size1580]; exact i.isLt⟩
  change (entry1580 i).check = true at h
  rcases fields1580 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1581 : OriginalRow227TriangleForward1581.entries.size = 32 := rfl

def entry1581 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1581.entries[i.val]'(by rw [size1581]; exact i.isLt)

theorem fields1581 (i : Fin 32) :
    (entry1581 i).IA = shift ∧ (entry1581 i).ID = S (290 + i.val + 1) ∧
      (entry1581 i).IC = S 131 ∧ (entry1581 i).Inext = T 130 (290 + i.val + 1) ∧
      (entry1581 i).Icur = T 130 (290 + i.val) ∧
      (entry1581 i).output = T 131 (290 + i.val) ∧
      (entry1581 i).charge = charge 130 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1597_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1581 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 131) (T 130 (290 + i.val + 1))
      (T 130 (290 + i.val)) (T 131 (290 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1581.entries OriginalRow227TriangleForward1581.checked
    ⟨i.val, by rw [size1581]; exact i.isLt⟩
  change (entry1581 i).check = true at h
  rcases fields1581 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1582 : OriginalRow227TriangleForward1582.entries.size = 32 := rfl

def entry1582 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1582.entries[i.val]'(by rw [size1582]; exact i.isLt)

theorem fields1582 (i : Fin 32) :
    (entry1582 i).IA = shift ∧ (entry1582 i).ID = S (322 + i.val + 1) ∧
      (entry1582 i).IC = S 131 ∧ (entry1582 i).Inext = T 130 (322 + i.val + 1) ∧
      (entry1582 i).Icur = T 130 (322 + i.val) ∧
      (entry1582 i).output = T 131 (322 + i.val) ∧
      (entry1582 i).charge = charge 130 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1598_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1582 (i : Fin 32) :
    forwardStepOK (-768) (charge 130 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 131) (T 130 (322 + i.val + 1))
      (T 130 (322 + i.val)) (T 131 (322 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1582.entries OriginalRow227TriangleForward1582.checked
    ⟨i.val, by rw [size1582]; exact i.isLt⟩
  change (entry1582 i).check = true at h
  rcases fields1582 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1583 : OriginalRow227TriangleForward1583.entries.size = 17 := rfl

def entry1583 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1583.entries[i.val]'(by rw [size1583]; exact i.isLt)

theorem fields1583 (i : Fin 17) :
    (entry1583 i).IA = shift ∧ (entry1583 i).ID = S (354 + i.val + 1) ∧
      (entry1583 i).IC = S 131 ∧ (entry1583 i).Inext = T 130 (354 + i.val + 1) ∧
      (entry1583 i).Icur = T 130 (354 + i.val) ∧
      (entry1583 i).output = T 131 (354 + i.val) ∧
      (entry1583 i).charge = charge 130 (354 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings04.S_eq_root131).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow131.block1599_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1583 (i : Fin 17) :
    forwardStepOK (-768) (charge 130 (354 + i.val)) shift
      (S (354 + i.val + 1)) (S 131) (T 130 (354 + i.val + 1))
      (T 130 (354 + i.val)) (T 131 (354 + i.val))
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1583.entries OriginalRow227TriangleForward1583.checked
    ⟨i.val, by rw [size1583]; exact i.isLt⟩
  change (entry1583 i).check = true at h
  rcases fields1583 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 130 ≤ d) (hhi : d < 371) :
    forwardStepOK (-768) (charge 130 d) shift (S (d + 1)) (S 131)
      (T 130 (d + 1)) (T 130 d) (T 131 d)
      (OriginalRow227Roots.root_pos 131 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 130 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h194 : d < 194
    ·
      by_cases h162 : d < 162
      ·
        have hi : d - 130 < 32 := by omega
        have heq : 130 + (d - 130) = d := by omega
        simpa only [heq] using step1576 ⟨d - 130, hi⟩
      ·
        have hi : d - 162 < 32 := by omega
        have heq : 162 + (d - 162) = d := by omega
        simpa only [heq] using step1577 ⟨d - 162, hi⟩
    ·
      by_cases h226 : d < 226
      ·
        have hi : d - 194 < 32 := by omega
        have heq : 194 + (d - 194) = d := by omega
        simpa only [heq] using step1578 ⟨d - 194, hi⟩
      ·
        have hi : d - 226 < 32 := by omega
        have heq : 226 + (d - 226) = d := by omega
        simpa only [heq] using step1579 ⟨d - 226, hi⟩
  ·
    by_cases h322 : d < 322
    ·
      by_cases h290 : d < 290
      ·
        have hi : d - 258 < 32 := by omega
        have heq : 258 + (d - 258) = d := by omega
        simpa only [heq] using step1580 ⟨d - 258, hi⟩
      ·
        have hi : d - 290 < 32 := by omega
        have heq : 290 + (d - 290) = d := by omega
        simpa only [heq] using step1581 ⟨d - 290, hi⟩
    ·
      by_cases h354 : d < 354
      ·
        have hi : d - 322 < 32 := by omega
        have heq : 322 + (d - 322) = d := by omega
        simpa only [heq] using step1582 ⟨d - 322, hi⟩
      ·
        have hi : d - 354 < 17 := by omega
        have heq : 354 + (d - 354) = d := by omega
        simpa only [heq] using step1583 ⟨d - 354, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1576,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1576,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1577,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1577,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1578,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1578,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1579,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1579,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1580,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1580,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1581,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1581,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1582,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1582,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.fields1583,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.step1583,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow131
