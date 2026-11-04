import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow137
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138
import Grothe.UpperChaos.OriginalRow227TriangleForward1632
import Grothe.UpperChaos.OriginalRow227TriangleForward1633
import Grothe.UpperChaos.OriginalRow227TriangleForward1634
import Grothe.UpperChaos.OriginalRow227TriangleForward1635
import Grothe.UpperChaos.OriginalRow227TriangleForward1636
import Grothe.UpperChaos.OriginalRow227TriangleForward1637
import Grothe.UpperChaos.OriginalRow227TriangleForward1638
import Grothe.UpperChaos.OriginalRow227TriangleForward1639

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1632 : OriginalRow227TriangleForward1632.entries.size = 32 := rfl

def entry1632 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1632.entries[i.val]'(by rw [size1632]; exact i.isLt)

theorem fields1632 (i : Fin 32) :
    (entry1632 i).IA = shift ∧ (entry1632 i).ID = S (137 + i.val + 1) ∧
      (entry1632 i).IC = S 138 ∧ (entry1632 i).Inext = T 137 (137 + i.val + 1) ∧
      (entry1632 i).Icur = T 137 (137 + i.val) ∧
      (entry1632 i).output = T 138 (137 + i.val) ∧
      (entry1632 i).charge = charge 137 (137 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1640_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1632 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (137 + i.val)) shift
      (S (137 + i.val + 1)) (S 138) (T 137 (137 + i.val + 1))
      (T 137 (137 + i.val)) (T 138 (137 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1632.entries OriginalRow227TriangleForward1632.checked
    ⟨i.val, by rw [size1632]; exact i.isLt⟩
  change (entry1632 i).check = true at h
  rcases fields1632 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1633 : OriginalRow227TriangleForward1633.entries.size = 32 := rfl

def entry1633 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1633.entries[i.val]'(by rw [size1633]; exact i.isLt)

theorem fields1633 (i : Fin 32) :
    (entry1633 i).IA = shift ∧ (entry1633 i).ID = S (169 + i.val + 1) ∧
      (entry1633 i).IC = S 138 ∧ (entry1633 i).Inext = T 137 (169 + i.val + 1) ∧
      (entry1633 i).Icur = T 137 (169 + i.val) ∧
      (entry1633 i).output = T 138 (169 + i.val) ∧
      (entry1633 i).charge = charge 137 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1641_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1633 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 138) (T 137 (169 + i.val + 1))
      (T 137 (169 + i.val)) (T 138 (169 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1633.entries OriginalRow227TriangleForward1633.checked
    ⟨i.val, by rw [size1633]; exact i.isLt⟩
  change (entry1633 i).check = true at h
  rcases fields1633 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1634 : OriginalRow227TriangleForward1634.entries.size = 32 := rfl

def entry1634 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1634.entries[i.val]'(by rw [size1634]; exact i.isLt)

theorem fields1634 (i : Fin 32) :
    (entry1634 i).IA = shift ∧ (entry1634 i).ID = S (201 + i.val + 1) ∧
      (entry1634 i).IC = S 138 ∧ (entry1634 i).Inext = T 137 (201 + i.val + 1) ∧
      (entry1634 i).Icur = T 137 (201 + i.val) ∧
      (entry1634 i).output = T 138 (201 + i.val) ∧
      (entry1634 i).charge = charge 137 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1642_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1634 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 138) (T 137 (201 + i.val + 1))
      (T 137 (201 + i.val)) (T 138 (201 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1634.entries OriginalRow227TriangleForward1634.checked
    ⟨i.val, by rw [size1634]; exact i.isLt⟩
  change (entry1634 i).check = true at h
  rcases fields1634 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1635 : OriginalRow227TriangleForward1635.entries.size = 32 := rfl

def entry1635 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1635.entries[i.val]'(by rw [size1635]; exact i.isLt)

theorem fields1635 (i : Fin 32) :
    (entry1635 i).IA = shift ∧ (entry1635 i).ID = S (233 + i.val + 1) ∧
      (entry1635 i).IC = S 138 ∧ (entry1635 i).Inext = T 137 (233 + i.val + 1) ∧
      (entry1635 i).Icur = T 137 (233 + i.val) ∧
      (entry1635 i).output = T 138 (233 + i.val) ∧
      (entry1635 i).charge = charge 137 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1643_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1635 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 138) (T 137 (233 + i.val + 1))
      (T 137 (233 + i.val)) (T 138 (233 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1635.entries OriginalRow227TriangleForward1635.checked
    ⟨i.val, by rw [size1635]; exact i.isLt⟩
  change (entry1635 i).check = true at h
  rcases fields1635 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1636 : OriginalRow227TriangleForward1636.entries.size = 32 := rfl

def entry1636 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1636.entries[i.val]'(by rw [size1636]; exact i.isLt)

theorem fields1636 (i : Fin 32) :
    (entry1636 i).IA = shift ∧ (entry1636 i).ID = S (265 + i.val + 1) ∧
      (entry1636 i).IC = S 138 ∧ (entry1636 i).Inext = T 137 (265 + i.val + 1) ∧
      (entry1636 i).Icur = T 137 (265 + i.val) ∧
      (entry1636 i).output = T 138 (265 + i.val) ∧
      (entry1636 i).charge = charge 137 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1644_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1636 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 138) (T 137 (265 + i.val + 1))
      (T 137 (265 + i.val)) (T 138 (265 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1636.entries OriginalRow227TriangleForward1636.checked
    ⟨i.val, by rw [size1636]; exact i.isLt⟩
  change (entry1636 i).check = true at h
  rcases fields1636 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1637 : OriginalRow227TriangleForward1637.entries.size = 32 := rfl

def entry1637 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1637.entries[i.val]'(by rw [size1637]; exact i.isLt)

theorem fields1637 (i : Fin 32) :
    (entry1637 i).IA = shift ∧ (entry1637 i).ID = S (297 + i.val + 1) ∧
      (entry1637 i).IC = S 138 ∧ (entry1637 i).Inext = T 137 (297 + i.val + 1) ∧
      (entry1637 i).Icur = T 137 (297 + i.val) ∧
      (entry1637 i).output = T 138 (297 + i.val) ∧
      (entry1637 i).charge = charge 137 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1645_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1637 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 138) (T 137 (297 + i.val + 1))
      (T 137 (297 + i.val)) (T 138 (297 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1637.entries OriginalRow227TriangleForward1637.checked
    ⟨i.val, by rw [size1637]; exact i.isLt⟩
  change (entry1637 i).check = true at h
  rcases fields1637 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1638 : OriginalRow227TriangleForward1638.entries.size = 32 := rfl

def entry1638 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1638.entries[i.val]'(by rw [size1638]; exact i.isLt)

theorem fields1638 (i : Fin 32) :
    (entry1638 i).IA = shift ∧ (entry1638 i).ID = S (329 + i.val + 1) ∧
      (entry1638 i).IC = S 138 ∧ (entry1638 i).Inext = T 137 (329 + i.val + 1) ∧
      (entry1638 i).Icur = T 137 (329 + i.val) ∧
      (entry1638 i).output = T 138 (329 + i.val) ∧
      (entry1638 i).charge = charge 137 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1646_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1638 (i : Fin 32) :
    forwardStepOK (-768) (charge 137 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 138) (T 137 (329 + i.val + 1))
      (T 137 (329 + i.val)) (T 138 (329 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1638.entries OriginalRow227TriangleForward1638.checked
    ⟨i.val, by rw [size1638]; exact i.isLt⟩
  change (entry1638 i).check = true at h
  rcases fields1638 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1639 : OriginalRow227TriangleForward1639.entries.size = 3 := rfl

def entry1639 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1639.entries[i.val]'(by rw [size1639]; exact i.isLt)

theorem fields1639 (i : Fin 3) :
    (entry1639 i).IA = shift ∧ (entry1639 i).ID = S (361 + i.val + 1) ∧
      (entry1639 i).IC = S 138 ∧ (entry1639 i).Inext = T 137 (361 + i.val + 1) ∧
      (entry1639 i).Icur = T 137 (361 + i.val) ∧
      (entry1639 i).output = T 138 (361 + i.val) ∧
      (entry1639 i).charge = charge 137 (361 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root138).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow137.block1647_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1639 (i : Fin 3) :
    forwardStepOK (-768) (charge 137 (361 + i.val)) shift
      (S (361 + i.val + 1)) (S 138) (T 137 (361 + i.val + 1))
      (T 137 (361 + i.val)) (T 138 (361 + i.val))
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1639.entries OriginalRow227TriangleForward1639.checked
    ⟨i.val, by rw [size1639]; exact i.isLt⟩
  change (entry1639 i).check = true at h
  rcases fields1639 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 137 ≤ d) (hhi : d < 364) :
    forwardStepOK (-768) (charge 137 d) shift (S (d + 1)) (S 138)
      (T 137 (d + 1)) (T 137 d) (T 138 d)
      (OriginalRow227Roots.root_pos 138 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 137 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h201 : d < 201
    ·
      by_cases h169 : d < 169
      ·
        have hi : d - 137 < 32 := by omega
        have heq : 137 + (d - 137) = d := by omega
        simpa only [heq] using step1632 ⟨d - 137, hi⟩
      ·
        have hi : d - 169 < 32 := by omega
        have heq : 169 + (d - 169) = d := by omega
        simpa only [heq] using step1633 ⟨d - 169, hi⟩
    ·
      by_cases h233 : d < 233
      ·
        have hi : d - 201 < 32 := by omega
        have heq : 201 + (d - 201) = d := by omega
        simpa only [heq] using step1634 ⟨d - 201, hi⟩
      ·
        have hi : d - 233 < 32 := by omega
        have heq : 233 + (d - 233) = d := by omega
        simpa only [heq] using step1635 ⟨d - 233, hi⟩
  ·
    by_cases h329 : d < 329
    ·
      by_cases h297 : d < 297
      ·
        have hi : d - 265 < 32 := by omega
        have heq : 265 + (d - 265) = d := by omega
        simpa only [heq] using step1636 ⟨d - 265, hi⟩
      ·
        have hi : d - 297 < 32 := by omega
        have heq : 297 + (d - 297) = d := by omega
        simpa only [heq] using step1637 ⟨d - 297, hi⟩
    ·
      by_cases h361 : d < 361
      ·
        have hi : d - 329 < 32 := by omega
        have heq : 329 + (d - 329) = d := by omega
        simpa only [heq] using step1638 ⟨d - 329, hi⟩
      ·
        have hi : d - 361 < 3 := by omega
        have heq : 361 + (d - 361) = d := by omega
        simpa only [heq] using step1639 ⟨d - 361, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1632,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1632,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1633,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1633,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1634,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1634,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1635,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1635,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1636,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1636,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1637,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1637,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1638,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1638,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.fields1639,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.step1639,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow138
