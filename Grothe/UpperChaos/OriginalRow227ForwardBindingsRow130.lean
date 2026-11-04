import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow129
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow130
import Grothe.UpperChaos.OriginalRow227TriangleForward1568
import Grothe.UpperChaos.OriginalRow227TriangleForward1569
import Grothe.UpperChaos.OriginalRow227TriangleForward1570
import Grothe.UpperChaos.OriginalRow227TriangleForward1571
import Grothe.UpperChaos.OriginalRow227TriangleForward1572
import Grothe.UpperChaos.OriginalRow227TriangleForward1573
import Grothe.UpperChaos.OriginalRow227TriangleForward1574
import Grothe.UpperChaos.OriginalRow227TriangleForward1575

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1568 : OriginalRow227TriangleForward1568.entries.size = 32 := rfl

def entry1568 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1568.entries[i.val]'(by rw [size1568]; exact i.isLt)

theorem fields1568 (i : Fin 32) :
    (entry1568 i).IA = shift ∧ (entry1568 i).ID = S (129 + i.val + 1) ∧
      (entry1568 i).IC = S 130 ∧ (entry1568 i).Inext = T 129 (129 + i.val + 1) ∧
      (entry1568 i).Icur = T 129 (129 + i.val) ∧
      (entry1568 i).output = T 130 (129 + i.val) ∧
      (entry1568 i).charge = charge 129 (129 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root130).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root131).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root132).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root133).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root134).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root135).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1576_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1584_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1568 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (129 + i.val)) shift
      (S (129 + i.val + 1)) (S 130) (T 129 (129 + i.val + 1))
      (T 129 (129 + i.val)) (T 130 (129 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1568.entries OriginalRow227TriangleForward1568.checked
    ⟨i.val, by rw [size1568]; exact i.isLt⟩
  change (entry1568 i).check = true at h
  rcases fields1568 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1569 : OriginalRow227TriangleForward1569.entries.size = 32 := rfl

def entry1569 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1569.entries[i.val]'(by rw [size1569]; exact i.isLt)

theorem fields1569 (i : Fin 32) :
    (entry1569 i).IA = shift ∧ (entry1569 i).ID = S (161 + i.val + 1) ∧
      (entry1569 i).IC = S 130 ∧ (entry1569 i).Inext = T 129 (161 + i.val + 1) ∧
      (entry1569 i).Icur = T 129 (161 + i.val) ∧
      (entry1569 i).output = T 130 (161 + i.val) ∧
      (entry1569 i).charge = charge 129 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1577_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1585_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1569 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 130) (T 129 (161 + i.val + 1))
      (T 129 (161 + i.val)) (T 130 (161 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1569.entries OriginalRow227TriangleForward1569.checked
    ⟨i.val, by rw [size1569]; exact i.isLt⟩
  change (entry1569 i).check = true at h
  rcases fields1569 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1570 : OriginalRow227TriangleForward1570.entries.size = 32 := rfl

def entry1570 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1570.entries[i.val]'(by rw [size1570]; exact i.isLt)

theorem fields1570 (i : Fin 32) :
    (entry1570 i).IA = shift ∧ (entry1570 i).ID = S (193 + i.val + 1) ∧
      (entry1570 i).IC = S 130 ∧ (entry1570 i).Inext = T 129 (193 + i.val + 1) ∧
      (entry1570 i).Icur = T 129 (193 + i.val) ∧
      (entry1570 i).output = T 130 (193 + i.val) ∧
      (entry1570 i).charge = charge 129 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1578_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1586_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1570 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 130) (T 129 (193 + i.val + 1))
      (T 129 (193 + i.val)) (T 130 (193 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1570.entries OriginalRow227TriangleForward1570.checked
    ⟨i.val, by rw [size1570]; exact i.isLt⟩
  change (entry1570 i).check = true at h
  rcases fields1570 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1571 : OriginalRow227TriangleForward1571.entries.size = 32 := rfl

def entry1571 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1571.entries[i.val]'(by rw [size1571]; exact i.isLt)

theorem fields1571 (i : Fin 32) :
    (entry1571 i).IA = shift ∧ (entry1571 i).ID = S (225 + i.val + 1) ∧
      (entry1571 i).IC = S 130 ∧ (entry1571 i).Inext = T 129 (225 + i.val + 1) ∧
      (entry1571 i).Icur = T 129 (225 + i.val) ∧
      (entry1571 i).output = T 130 (225 + i.val) ∧
      (entry1571 i).charge = charge 129 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1579_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1587_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1571 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 130) (T 129 (225 + i.val + 1))
      (T 129 (225 + i.val)) (T 130 (225 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1571.entries OriginalRow227TriangleForward1571.checked
    ⟨i.val, by rw [size1571]; exact i.isLt⟩
  change (entry1571 i).check = true at h
  rcases fields1571 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1572 : OriginalRow227TriangleForward1572.entries.size = 32 := rfl

def entry1572 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1572.entries[i.val]'(by rw [size1572]; exact i.isLt)

theorem fields1572 (i : Fin 32) :
    (entry1572 i).IA = shift ∧ (entry1572 i).ID = S (257 + i.val + 1) ∧
      (entry1572 i).IC = S 130 ∧ (entry1572 i).Inext = T 129 (257 + i.val + 1) ∧
      (entry1572 i).Icur = T 129 (257 + i.val) ∧
      (entry1572 i).output = T 130 (257 + i.val) ∧
      (entry1572 i).charge = charge 129 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1580_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1588_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1572 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 130) (T 129 (257 + i.val + 1))
      (T 129 (257 + i.val)) (T 130 (257 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1572.entries OriginalRow227TriangleForward1572.checked
    ⟨i.val, by rw [size1572]; exact i.isLt⟩
  change (entry1572 i).check = true at h
  rcases fields1572 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1573 : OriginalRow227TriangleForward1573.entries.size = 32 := rfl

def entry1573 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1573.entries[i.val]'(by rw [size1573]; exact i.isLt)

theorem fields1573 (i : Fin 32) :
    (entry1573 i).IA = shift ∧ (entry1573 i).ID = S (289 + i.val + 1) ∧
      (entry1573 i).IC = S 130 ∧ (entry1573 i).Inext = T 129 (289 + i.val + 1) ∧
      (entry1573 i).Icur = T 129 (289 + i.val) ∧
      (entry1573 i).output = T 130 (289 + i.val) ∧
      (entry1573 i).charge = charge 129 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1581_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1589_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1573 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 130) (T 129 (289 + i.val + 1))
      (T 129 (289 + i.val)) (T 130 (289 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1573.entries OriginalRow227TriangleForward1573.checked
    ⟨i.val, by rw [size1573]; exact i.isLt⟩
  change (entry1573 i).check = true at h
  rcases fields1573 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1574 : OriginalRow227TriangleForward1574.entries.size = 32 := rfl

def entry1574 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1574.entries[i.val]'(by rw [size1574]; exact i.isLt)

theorem fields1574 (i : Fin 32) :
    (entry1574 i).IA = shift ∧ (entry1574 i).ID = S (321 + i.val + 1) ∧
      (entry1574 i).IC = S 130 ∧ (entry1574 i).Inext = T 129 (321 + i.val + 1) ∧
      (entry1574 i).Icur = T 129 (321 + i.val) ∧
      (entry1574 i).output = T 130 (321 + i.val) ∧
      (entry1574 i).charge = charge 129 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1582_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1590_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1574 (i : Fin 32) :
    forwardStepOK (-768) (charge 129 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 130) (T 129 (321 + i.val + 1))
      (T 129 (321 + i.val)) (T 130 (321 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1574.entries OriginalRow227TriangleForward1574.checked
    ⟨i.val, by rw [size1574]; exact i.isLt⟩
  change (entry1574 i).check = true at h
  rcases fields1574 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1575 : OriginalRow227TriangleForward1575.entries.size = 19 := rfl

def entry1575 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1575.entries[i.val]'(by rw [size1575]; exact i.isLt)

theorem fields1575 (i : Fin 19) :
    (entry1575 i).IA = shift ∧ (entry1575 i).ID = S (353 + i.val + 1) ∧
      (entry1575 i).IC = S 130 ∧ (entry1575 i).Inext = T 129 (353 + i.val + 1) ∧
      (entry1575 i).Icur = T 129 (353 + i.val) ∧
      (entry1575 i).output = T 130 (353 + i.val) ∧
      (entry1575 i).charge = charge 129 (353 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root367).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root368).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root369).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root370).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root371).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root372).symm, (OriginalRow227RootBindings04.S_eq_root130).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow129.block1583_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow130.block1591_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1575 (i : Fin 19) :
    forwardStepOK (-768) (charge 129 (353 + i.val)) shift
      (S (353 + i.val + 1)) (S 130) (T 129 (353 + i.val + 1))
      (T 129 (353 + i.val)) (T 130 (353 + i.val))
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1575.entries OriginalRow227TriangleForward1575.checked
    ⟨i.val, by rw [size1575]; exact i.isLt⟩
  change (entry1575 i).check = true at h
  rcases fields1575 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 129 ≤ d) (hhi : d < 372) :
    forwardStepOK (-768) (charge 129 d) shift (S (d + 1)) (S 130)
      (T 129 (d + 1)) (T 129 d) (T 130 d)
      (OriginalRow227Roots.root_pos 130 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 129 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h193 : d < 193
    ·
      by_cases h161 : d < 161
      ·
        have hi : d - 129 < 32 := by omega
        have heq : 129 + (d - 129) = d := by omega
        simpa only [heq] using step1568 ⟨d - 129, hi⟩
      ·
        have hi : d - 161 < 32 := by omega
        have heq : 161 + (d - 161) = d := by omega
        simpa only [heq] using step1569 ⟨d - 161, hi⟩
    ·
      by_cases h225 : d < 225
      ·
        have hi : d - 193 < 32 := by omega
        have heq : 193 + (d - 193) = d := by omega
        simpa only [heq] using step1570 ⟨d - 193, hi⟩
      ·
        have hi : d - 225 < 32 := by omega
        have heq : 225 + (d - 225) = d := by omega
        simpa only [heq] using step1571 ⟨d - 225, hi⟩
  ·
    by_cases h321 : d < 321
    ·
      by_cases h289 : d < 289
      ·
        have hi : d - 257 < 32 := by omega
        have heq : 257 + (d - 257) = d := by omega
        simpa only [heq] using step1572 ⟨d - 257, hi⟩
      ·
        have hi : d - 289 < 32 := by omega
        have heq : 289 + (d - 289) = d := by omega
        simpa only [heq] using step1573 ⟨d - 289, hi⟩
    ·
      by_cases h353 : d < 353
      ·
        have hi : d - 321 < 32 := by omega
        have heq : 321 + (d - 321) = d := by omega
        simpa only [heq] using step1574 ⟨d - 321, hi⟩
      ·
        have hi : d - 353 < 19 := by omega
        have heq : 353 + (d - 353) = d := by omega
        simpa only [heq] using step1575 ⟨d - 353, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1568,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1568,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1569,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1569,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1570,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1570,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1571,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1571,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1572,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1572,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1573,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1573,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1574,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1574,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.fields1575,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.step1575,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow130
