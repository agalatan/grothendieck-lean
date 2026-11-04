import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow138
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139
import Grothe.UpperChaos.OriginalRow227TriangleForward1640
import Grothe.UpperChaos.OriginalRow227TriangleForward1641
import Grothe.UpperChaos.OriginalRow227TriangleForward1642
import Grothe.UpperChaos.OriginalRow227TriangleForward1643
import Grothe.UpperChaos.OriginalRow227TriangleForward1644
import Grothe.UpperChaos.OriginalRow227TriangleForward1645
import Grothe.UpperChaos.OriginalRow227TriangleForward1646
import Grothe.UpperChaos.OriginalRow227TriangleForward1647

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1640 : OriginalRow227TriangleForward1640.entries.size = 32 := rfl

def entry1640 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1640.entries[i.val]'(by rw [size1640]; exact i.isLt)

theorem fields1640 (i : Fin 32) :
    (entry1640 i).IA = shift ∧ (entry1640 i).ID = S (138 + i.val + 1) ∧
      (entry1640 i).IC = S 139 ∧ (entry1640 i).Inext = T 138 (138 + i.val + 1) ∧
      (entry1640 i).Icur = T 138 (138 + i.val) ∧
      (entry1640 i).output = T 139 (138 + i.val) ∧
      (entry1640 i).charge = charge 138 (138 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1648_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1640 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (138 + i.val)) shift
      (S (138 + i.val + 1)) (S 139) (T 138 (138 + i.val + 1))
      (T 138 (138 + i.val)) (T 139 (138 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1640.entries OriginalRow227TriangleForward1640.checked
    ⟨i.val, by rw [size1640]; exact i.isLt⟩
  change (entry1640 i).check = true at h
  rcases fields1640 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1641 : OriginalRow227TriangleForward1641.entries.size = 32 := rfl

def entry1641 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1641.entries[i.val]'(by rw [size1641]; exact i.isLt)

theorem fields1641 (i : Fin 32) :
    (entry1641 i).IA = shift ∧ (entry1641 i).ID = S (170 + i.val + 1) ∧
      (entry1641 i).IC = S 139 ∧ (entry1641 i).Inext = T 138 (170 + i.val + 1) ∧
      (entry1641 i).Icur = T 138 (170 + i.val) ∧
      (entry1641 i).output = T 139 (170 + i.val) ∧
      (entry1641 i).charge = charge 138 (170 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1649_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1641 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (170 + i.val)) shift
      (S (170 + i.val + 1)) (S 139) (T 138 (170 + i.val + 1))
      (T 138 (170 + i.val)) (T 139 (170 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1641.entries OriginalRow227TriangleForward1641.checked
    ⟨i.val, by rw [size1641]; exact i.isLt⟩
  change (entry1641 i).check = true at h
  rcases fields1641 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1642 : OriginalRow227TriangleForward1642.entries.size = 32 := rfl

def entry1642 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1642.entries[i.val]'(by rw [size1642]; exact i.isLt)

theorem fields1642 (i : Fin 32) :
    (entry1642 i).IA = shift ∧ (entry1642 i).ID = S (202 + i.val + 1) ∧
      (entry1642 i).IC = S 139 ∧ (entry1642 i).Inext = T 138 (202 + i.val + 1) ∧
      (entry1642 i).Icur = T 138 (202 + i.val) ∧
      (entry1642 i).output = T 139 (202 + i.val) ∧
      (entry1642 i).charge = charge 138 (202 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1650_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1642 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (202 + i.val)) shift
      (S (202 + i.val + 1)) (S 139) (T 138 (202 + i.val + 1))
      (T 138 (202 + i.val)) (T 139 (202 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1642.entries OriginalRow227TriangleForward1642.checked
    ⟨i.val, by rw [size1642]; exact i.isLt⟩
  change (entry1642 i).check = true at h
  rcases fields1642 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1643 : OriginalRow227TriangleForward1643.entries.size = 32 := rfl

def entry1643 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1643.entries[i.val]'(by rw [size1643]; exact i.isLt)

theorem fields1643 (i : Fin 32) :
    (entry1643 i).IA = shift ∧ (entry1643 i).ID = S (234 + i.val + 1) ∧
      (entry1643 i).IC = S 139 ∧ (entry1643 i).Inext = T 138 (234 + i.val + 1) ∧
      (entry1643 i).Icur = T 138 (234 + i.val) ∧
      (entry1643 i).output = T 139 (234 + i.val) ∧
      (entry1643 i).charge = charge 138 (234 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1651_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1643 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (234 + i.val)) shift
      (S (234 + i.val + 1)) (S 139) (T 138 (234 + i.val + 1))
      (T 138 (234 + i.val)) (T 139 (234 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1643.entries OriginalRow227TriangleForward1643.checked
    ⟨i.val, by rw [size1643]; exact i.isLt⟩
  change (entry1643 i).check = true at h
  rcases fields1643 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1644 : OriginalRow227TriangleForward1644.entries.size = 32 := rfl

def entry1644 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1644.entries[i.val]'(by rw [size1644]; exact i.isLt)

theorem fields1644 (i : Fin 32) :
    (entry1644 i).IA = shift ∧ (entry1644 i).ID = S (266 + i.val + 1) ∧
      (entry1644 i).IC = S 139 ∧ (entry1644 i).Inext = T 138 (266 + i.val + 1) ∧
      (entry1644 i).Icur = T 138 (266 + i.val) ∧
      (entry1644 i).output = T 139 (266 + i.val) ∧
      (entry1644 i).charge = charge 138 (266 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1652_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1644 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (266 + i.val)) shift
      (S (266 + i.val + 1)) (S 139) (T 138 (266 + i.val + 1))
      (T 138 (266 + i.val)) (T 139 (266 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1644.entries OriginalRow227TriangleForward1644.checked
    ⟨i.val, by rw [size1644]; exact i.isLt⟩
  change (entry1644 i).check = true at h
  rcases fields1644 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1645 : OriginalRow227TriangleForward1645.entries.size = 32 := rfl

def entry1645 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1645.entries[i.val]'(by rw [size1645]; exact i.isLt)

theorem fields1645 (i : Fin 32) :
    (entry1645 i).IA = shift ∧ (entry1645 i).ID = S (298 + i.val + 1) ∧
      (entry1645 i).IC = S 139 ∧ (entry1645 i).Inext = T 138 (298 + i.val + 1) ∧
      (entry1645 i).Icur = T 138 (298 + i.val) ∧
      (entry1645 i).output = T 139 (298 + i.val) ∧
      (entry1645 i).charge = charge 138 (298 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1653_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1645 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (298 + i.val)) shift
      (S (298 + i.val + 1)) (S 139) (T 138 (298 + i.val + 1))
      (T 138 (298 + i.val)) (T 139 (298 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1645.entries OriginalRow227TriangleForward1645.checked
    ⟨i.val, by rw [size1645]; exact i.isLt⟩
  change (entry1645 i).check = true at h
  rcases fields1645 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1646 : OriginalRow227TriangleForward1646.entries.size = 32 := rfl

def entry1646 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1646.entries[i.val]'(by rw [size1646]; exact i.isLt)

theorem fields1646 (i : Fin 32) :
    (entry1646 i).IA = shift ∧ (entry1646 i).ID = S (330 + i.val + 1) ∧
      (entry1646 i).IC = S 139 ∧ (entry1646 i).Inext = T 138 (330 + i.val + 1) ∧
      (entry1646 i).Icur = T 138 (330 + i.val) ∧
      (entry1646 i).output = T 139 (330 + i.val) ∧
      (entry1646 i).charge = charge 138 (330 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1654_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1646 (i : Fin 32) :
    forwardStepOK (-768) (charge 138 (330 + i.val)) shift
      (S (330 + i.val + 1)) (S 139) (T 138 (330 + i.val + 1))
      (T 138 (330 + i.val)) (T 139 (330 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1646.entries OriginalRow227TriangleForward1646.checked
    ⟨i.val, by rw [size1646]; exact i.isLt⟩
  change (entry1646 i).check = true at h
  rcases fields1646 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1647 : OriginalRow227TriangleForward1647.entries.size = 1 := rfl

def entry1647 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1647.entries[i.val]'(by rw [size1647]; exact i.isLt)

theorem fields1647 (i : Fin 1) :
    (entry1647 i).IA = shift ∧ (entry1647 i).ID = S (362 + i.val + 1) ∧
      (entry1647 i).IC = S 139 ∧ (entry1647 i).Inext = T 138 (362 + i.val + 1) ∧
      (entry1647 i).Icur = T 138 (362 + i.val) ∧
      (entry1647 i).output = T 139 (362 + i.val) ∧
      (entry1647 i).charge = charge 138 (362 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root139).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow138.block1655_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1663_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1647 (i : Fin 1) :
    forwardStepOK (-768) (charge 138 (362 + i.val)) shift
      (S (362 + i.val + 1)) (S 139) (T 138 (362 + i.val + 1))
      (T 138 (362 + i.val)) (T 139 (362 + i.val))
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1647.entries OriginalRow227TriangleForward1647.checked
    ⟨i.val, by rw [size1647]; exact i.isLt⟩
  change (entry1647 i).check = true at h
  rcases fields1647 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 138 ≤ d) (hhi : d < 363) :
    forwardStepOK (-768) (charge 138 d) shift (S (d + 1)) (S 139)
      (T 138 (d + 1)) (T 138 d) (T 139 d)
      (OriginalRow227Roots.root_pos 139 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 138 (by decide)) = true := by
  by_cases h266 : d < 266
  ·
    by_cases h202 : d < 202
    ·
      by_cases h170 : d < 170
      ·
        have hi : d - 138 < 32 := by omega
        have heq : 138 + (d - 138) = d := by omega
        simpa only [heq] using step1640 ⟨d - 138, hi⟩
      ·
        have hi : d - 170 < 32 := by omega
        have heq : 170 + (d - 170) = d := by omega
        simpa only [heq] using step1641 ⟨d - 170, hi⟩
    ·
      by_cases h234 : d < 234
      ·
        have hi : d - 202 < 32 := by omega
        have heq : 202 + (d - 202) = d := by omega
        simpa only [heq] using step1642 ⟨d - 202, hi⟩
      ·
        have hi : d - 234 < 32 := by omega
        have heq : 234 + (d - 234) = d := by omega
        simpa only [heq] using step1643 ⟨d - 234, hi⟩
  ·
    by_cases h330 : d < 330
    ·
      by_cases h298 : d < 298
      ·
        have hi : d - 266 < 32 := by omega
        have heq : 266 + (d - 266) = d := by omega
        simpa only [heq] using step1644 ⟨d - 266, hi⟩
      ·
        have hi : d - 298 < 32 := by omega
        have heq : 298 + (d - 298) = d := by omega
        simpa only [heq] using step1645 ⟨d - 298, hi⟩
    ·
      by_cases h362 : d < 362
      ·
        have hi : d - 330 < 32 := by omega
        have heq : 330 + (d - 330) = d := by omega
        simpa only [heq] using step1646 ⟨d - 330, hi⟩
      ·
        have hi : d - 362 < 1 := by omega
        have heq : 362 + (d - 362) = d := by omega
        simpa only [heq] using step1647 ⟨d - 362, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1640,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1640,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1641,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1641,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1642,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1642,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1643,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1643,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1644,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1644,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1645,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1645,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1646,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1646,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.fields1647,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.step1647,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow139
