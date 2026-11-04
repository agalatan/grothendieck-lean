import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137
import Grothe.UpperChaos.OriginalRow227TriangleForward1624
import Grothe.UpperChaos.OriginalRow227TriangleForward1625
import Grothe.UpperChaos.OriginalRow227TriangleForward1626
import Grothe.UpperChaos.OriginalRow227TriangleForward1627
import Grothe.UpperChaos.OriginalRow227TriangleForward1628
import Grothe.UpperChaos.OriginalRow227TriangleForward1629
import Grothe.UpperChaos.OriginalRow227TriangleForward1630
import Grothe.UpperChaos.OriginalRow227TriangleForward1631

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1624 : OriginalRow227TriangleForward1624.entries.size = 32 := rfl

def entry1624 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1624.entries[i.val]'(by rw [size1624]; exact i.isLt)

theorem fields1624 (i : Fin 32) :
    (entry1624 i).IA = shift ∧ (entry1624 i).ID = S (136 + i.val + 1) ∧
      (entry1624 i).IC = S 137 ∧ (entry1624 i).Inext = T 136 (136 + i.val + 1) ∧
      (entry1624 i).Icur = T 136 (136 + i.val) ∧
      (entry1624 i).output = T 137 (136 + i.val) ∧
      (entry1624 i).charge = charge 136 (136 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1624 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (136 + i.val)) shift
      (S (136 + i.val + 1)) (S 137) (T 136 (136 + i.val + 1))
      (T 136 (136 + i.val)) (T 137 (136 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1624.entries OriginalRow227TriangleForward1624.checked
    ⟨i.val, by rw [size1624]; exact i.isLt⟩
  change (entry1624 i).check = true at h
  rcases fields1624 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1625 : OriginalRow227TriangleForward1625.entries.size = 32 := rfl

def entry1625 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1625.entries[i.val]'(by rw [size1625]; exact i.isLt)

theorem fields1625 (i : Fin 32) :
    (entry1625 i).IA = shift ∧ (entry1625 i).ID = S (168 + i.val + 1) ∧
      (entry1625 i).IC = S 137 ∧ (entry1625 i).Inext = T 136 (168 + i.val + 1) ∧
      (entry1625 i).Icur = T 136 (168 + i.val) ∧
      (entry1625 i).output = T 137 (168 + i.val) ∧
      (entry1625 i).charge = charge 136 (168 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1625 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (168 + i.val)) shift
      (S (168 + i.val + 1)) (S 137) (T 136 (168 + i.val + 1))
      (T 136 (168 + i.val)) (T 137 (168 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1625.entries OriginalRow227TriangleForward1625.checked
    ⟨i.val, by rw [size1625]; exact i.isLt⟩
  change (entry1625 i).check = true at h
  rcases fields1625 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1626 : OriginalRow227TriangleForward1626.entries.size = 32 := rfl

def entry1626 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1626.entries[i.val]'(by rw [size1626]; exact i.isLt)

theorem fields1626 (i : Fin 32) :
    (entry1626 i).IA = shift ∧ (entry1626 i).ID = S (200 + i.val + 1) ∧
      (entry1626 i).IC = S 137 ∧ (entry1626 i).Inext = T 136 (200 + i.val + 1) ∧
      (entry1626 i).Icur = T 136 (200 + i.val) ∧
      (entry1626 i).output = T 137 (200 + i.val) ∧
      (entry1626 i).charge = charge 136 (200 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1626 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (200 + i.val)) shift
      (S (200 + i.val + 1)) (S 137) (T 136 (200 + i.val + 1))
      (T 136 (200 + i.val)) (T 137 (200 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1626.entries OriginalRow227TriangleForward1626.checked
    ⟨i.val, by rw [size1626]; exact i.isLt⟩
  change (entry1626 i).check = true at h
  rcases fields1626 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1627 : OriginalRow227TriangleForward1627.entries.size = 32 := rfl

def entry1627 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1627.entries[i.val]'(by rw [size1627]; exact i.isLt)

theorem fields1627 (i : Fin 32) :
    (entry1627 i).IA = shift ∧ (entry1627 i).ID = S (232 + i.val + 1) ∧
      (entry1627 i).IC = S 137 ∧ (entry1627 i).Inext = T 136 (232 + i.val + 1) ∧
      (entry1627 i).Icur = T 136 (232 + i.val) ∧
      (entry1627 i).output = T 137 (232 + i.val) ∧
      (entry1627 i).charge = charge 136 (232 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1627 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (232 + i.val)) shift
      (S (232 + i.val + 1)) (S 137) (T 136 (232 + i.val + 1))
      (T 136 (232 + i.val)) (T 137 (232 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1627.entries OriginalRow227TriangleForward1627.checked
    ⟨i.val, by rw [size1627]; exact i.isLt⟩
  change (entry1627 i).check = true at h
  rcases fields1627 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1628 : OriginalRow227TriangleForward1628.entries.size = 32 := rfl

def entry1628 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1628.entries[i.val]'(by rw [size1628]; exact i.isLt)

theorem fields1628 (i : Fin 32) :
    (entry1628 i).IA = shift ∧ (entry1628 i).ID = S (264 + i.val + 1) ∧
      (entry1628 i).IC = S 137 ∧ (entry1628 i).Inext = T 136 (264 + i.val + 1) ∧
      (entry1628 i).Icur = T 136 (264 + i.val) ∧
      (entry1628 i).output = T 137 (264 + i.val) ∧
      (entry1628 i).charge = charge 136 (264 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1628 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (264 + i.val)) shift
      (S (264 + i.val + 1)) (S 137) (T 136 (264 + i.val + 1))
      (T 136 (264 + i.val)) (T 137 (264 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1628.entries OriginalRow227TriangleForward1628.checked
    ⟨i.val, by rw [size1628]; exact i.isLt⟩
  change (entry1628 i).check = true at h
  rcases fields1628 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1629 : OriginalRow227TriangleForward1629.entries.size = 32 := rfl

def entry1629 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1629.entries[i.val]'(by rw [size1629]; exact i.isLt)

theorem fields1629 (i : Fin 32) :
    (entry1629 i).IA = shift ∧ (entry1629 i).ID = S (296 + i.val + 1) ∧
      (entry1629 i).IC = S 137 ∧ (entry1629 i).Inext = T 136 (296 + i.val + 1) ∧
      (entry1629 i).Icur = T 136 (296 + i.val) ∧
      (entry1629 i).output = T 137 (296 + i.val) ∧
      (entry1629 i).charge = charge 136 (296 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1629 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (296 + i.val)) shift
      (S (296 + i.val + 1)) (S 137) (T 136 (296 + i.val + 1))
      (T 136 (296 + i.val)) (T 137 (296 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1629.entries OriginalRow227TriangleForward1629.checked
    ⟨i.val, by rw [size1629]; exact i.isLt⟩
  change (entry1629 i).check = true at h
  rcases fields1629 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1630 : OriginalRow227TriangleForward1630.entries.size = 32 := rfl

def entry1630 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1630.entries[i.val]'(by rw [size1630]; exact i.isLt)

theorem fields1630 (i : Fin 32) :
    (entry1630 i).IA = shift ∧ (entry1630 i).ID = S (328 + i.val + 1) ∧
      (entry1630 i).IC = S 137 ∧ (entry1630 i).Inext = T 136 (328 + i.val + 1) ∧
      (entry1630 i).Icur = T 136 (328 + i.val) ∧
      (entry1630 i).output = T 137 (328 + i.val) ∧
      (entry1630 i).charge = charge 136 (328 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1630 (i : Fin 32) :
    forwardStepOK (-768) (charge 136 (328 + i.val)) shift
      (S (328 + i.val + 1)) (S 137) (T 136 (328 + i.val + 1))
      (T 136 (328 + i.val)) (T 137 (328 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1630.entries OriginalRow227TriangleForward1630.checked
    ⟨i.val, by rw [size1630]; exact i.isLt⟩
  change (entry1630 i).check = true at h
  rcases fields1630 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1631 : OriginalRow227TriangleForward1631.entries.size = 5 := rfl

def entry1631 (i : Fin 5) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1631.entries[i.val]'(by rw [size1631]; exact i.isLt)

theorem fields1631 (i : Fin 5) :
    (entry1631 i).IA = shift ∧ (entry1631 i).ID = S (360 + i.val + 1) ∧
      (entry1631 i).IC = S 137 ∧ (entry1631 i).Inext = T 136 (360 + i.val + 1) ∧
      (entry1631 i).Icur = T 136 (360 + i.val) ∧
      (entry1631 i).output = T 137 (360 + i.val) ∧
      (entry1631 i).charge = charge 136 (360 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root137).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨4, by decide⟩).symm, rfl⟩

theorem step1631 (i : Fin 5) :
    forwardStepOK (-768) (charge 136 (360 + i.val)) shift
      (S (360 + i.val + 1)) (S 137) (T 136 (360 + i.val + 1))
      (T 136 (360 + i.val)) (T 137 (360 + i.val))
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1631.entries OriginalRow227TriangleForward1631.checked
    ⟨i.val, by rw [size1631]; exact i.isLt⟩
  change (entry1631 i).check = true at h
  rcases fields1631 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 136 ≤ d) (hhi : d < 365) :
    forwardStepOK (-768) (charge 136 d) shift (S (d + 1)) (S 137)
      (T 136 (d + 1)) (T 136 d) (T 137 d)
      (OriginalRow227Roots.root_pos 137 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 136 (by decide)) = true := by
  by_cases h264 : d < 264
  ·
    by_cases h200 : d < 200
    ·
      by_cases h168 : d < 168
      ·
        have hi : d - 136 < 32 := by omega
        have heq : 136 + (d - 136) = d := by omega
        simpa only [heq] using step1624 ⟨d - 136, hi⟩
      ·
        have hi : d - 168 < 32 := by omega
        have heq : 168 + (d - 168) = d := by omega
        simpa only [heq] using step1625 ⟨d - 168, hi⟩
    ·
      by_cases h232 : d < 232
      ·
        have hi : d - 200 < 32 := by omega
        have heq : 200 + (d - 200) = d := by omega
        simpa only [heq] using step1626 ⟨d - 200, hi⟩
      ·
        have hi : d - 232 < 32 := by omega
        have heq : 232 + (d - 232) = d := by omega
        simpa only [heq] using step1627 ⟨d - 232, hi⟩
  ·
    by_cases h328 : d < 328
    ·
      by_cases h296 : d < 296
      ·
        have hi : d - 264 < 32 := by omega
        have heq : 264 + (d - 264) = d := by omega
        simpa only [heq] using step1628 ⟨d - 264, hi⟩
      ·
        have hi : d - 296 < 32 := by omega
        have heq : 296 + (d - 296) = d := by omega
        simpa only [heq] using step1629 ⟨d - 296, hi⟩
    ·
      by_cases h360 : d < 360
      ·
        have hi : d - 328 < 32 := by omega
        have heq : 328 + (d - 328) = d := by omega
        simpa only [heq] using step1630 ⟨d - 328, hi⟩
      ·
        have hi : d - 360 < 5 := by omega
        have heq : 360 + (d - 360) = d := by omega
        simpa only [heq] using step1631 ⟨d - 360, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1624,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1624,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1625,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1625,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1626,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1626,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1627,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1627,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1628,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1628,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1629,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1629,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1630,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1630,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.fields1631,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.step1631,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow137
