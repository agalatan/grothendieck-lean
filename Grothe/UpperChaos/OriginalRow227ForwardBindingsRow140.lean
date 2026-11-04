import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow139
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow140
import Grothe.UpperChaos.OriginalRow227TriangleForward1648
import Grothe.UpperChaos.OriginalRow227TriangleForward1649
import Grothe.UpperChaos.OriginalRow227TriangleForward1650
import Grothe.UpperChaos.OriginalRow227TriangleForward1651
import Grothe.UpperChaos.OriginalRow227TriangleForward1652
import Grothe.UpperChaos.OriginalRow227TriangleForward1653
import Grothe.UpperChaos.OriginalRow227TriangleForward1654

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1648 : OriginalRow227TriangleForward1648.entries.size = 32 := rfl

def entry1648 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1648.entries[i.val]'(by rw [size1648]; exact i.isLt)

theorem fields1648 (i : Fin 32) :
    (entry1648 i).IA = shift ∧ (entry1648 i).ID = S (139 + i.val + 1) ∧
      (entry1648 i).IC = S 140 ∧ (entry1648 i).Inext = T 139 (139 + i.val + 1) ∧
      (entry1648 i).Icur = T 139 (139 + i.val) ∧
      (entry1648 i).output = T 140 (139 + i.val) ∧
      (entry1648 i).charge = charge 139 (139 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1656_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1664_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1648 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (139 + i.val)) shift
      (S (139 + i.val + 1)) (S 140) (T 139 (139 + i.val + 1))
      (T 139 (139 + i.val)) (T 140 (139 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1648.entries OriginalRow227TriangleForward1648.checked
    ⟨i.val, by rw [size1648]; exact i.isLt⟩
  change (entry1648 i).check = true at h
  rcases fields1648 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1649 : OriginalRow227TriangleForward1649.entries.size = 32 := rfl

def entry1649 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1649.entries[i.val]'(by rw [size1649]; exact i.isLt)

theorem fields1649 (i : Fin 32) :
    (entry1649 i).IA = shift ∧ (entry1649 i).ID = S (171 + i.val + 1) ∧
      (entry1649 i).IC = S 140 ∧ (entry1649 i).Inext = T 139 (171 + i.val + 1) ∧
      (entry1649 i).Icur = T 139 (171 + i.val) ∧
      (entry1649 i).output = T 140 (171 + i.val) ∧
      (entry1649 i).charge = charge 139 (171 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1657_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1665_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1649 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (171 + i.val)) shift
      (S (171 + i.val + 1)) (S 140) (T 139 (171 + i.val + 1))
      (T 139 (171 + i.val)) (T 140 (171 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1649.entries OriginalRow227TriangleForward1649.checked
    ⟨i.val, by rw [size1649]; exact i.isLt⟩
  change (entry1649 i).check = true at h
  rcases fields1649 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1650 : OriginalRow227TriangleForward1650.entries.size = 32 := rfl

def entry1650 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1650.entries[i.val]'(by rw [size1650]; exact i.isLt)

theorem fields1650 (i : Fin 32) :
    (entry1650 i).IA = shift ∧ (entry1650 i).ID = S (203 + i.val + 1) ∧
      (entry1650 i).IC = S 140 ∧ (entry1650 i).Inext = T 139 (203 + i.val + 1) ∧
      (entry1650 i).Icur = T 139 (203 + i.val) ∧
      (entry1650 i).output = T 140 (203 + i.val) ∧
      (entry1650 i).charge = charge 139 (203 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1658_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1666_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1650 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (203 + i.val)) shift
      (S (203 + i.val + 1)) (S 140) (T 139 (203 + i.val + 1))
      (T 139 (203 + i.val)) (T 140 (203 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1650.entries OriginalRow227TriangleForward1650.checked
    ⟨i.val, by rw [size1650]; exact i.isLt⟩
  change (entry1650 i).check = true at h
  rcases fields1650 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1651 : OriginalRow227TriangleForward1651.entries.size = 32 := rfl

def entry1651 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1651.entries[i.val]'(by rw [size1651]; exact i.isLt)

theorem fields1651 (i : Fin 32) :
    (entry1651 i).IA = shift ∧ (entry1651 i).ID = S (235 + i.val + 1) ∧
      (entry1651 i).IC = S 140 ∧ (entry1651 i).Inext = T 139 (235 + i.val + 1) ∧
      (entry1651 i).Icur = T 139 (235 + i.val) ∧
      (entry1651 i).output = T 140 (235 + i.val) ∧
      (entry1651 i).charge = charge 139 (235 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1659_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1667_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1651 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (235 + i.val)) shift
      (S (235 + i.val + 1)) (S 140) (T 139 (235 + i.val + 1))
      (T 139 (235 + i.val)) (T 140 (235 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1651.entries OriginalRow227TriangleForward1651.checked
    ⟨i.val, by rw [size1651]; exact i.isLt⟩
  change (entry1651 i).check = true at h
  rcases fields1651 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1652 : OriginalRow227TriangleForward1652.entries.size = 32 := rfl

def entry1652 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1652.entries[i.val]'(by rw [size1652]; exact i.isLt)

theorem fields1652 (i : Fin 32) :
    (entry1652 i).IA = shift ∧ (entry1652 i).ID = S (267 + i.val + 1) ∧
      (entry1652 i).IC = S 140 ∧ (entry1652 i).Inext = T 139 (267 + i.val + 1) ∧
      (entry1652 i).Icur = T 139 (267 + i.val) ∧
      (entry1652 i).output = T 140 (267 + i.val) ∧
      (entry1652 i).charge = charge 139 (267 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1660_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1668_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1652 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (267 + i.val)) shift
      (S (267 + i.val + 1)) (S 140) (T 139 (267 + i.val + 1))
      (T 139 (267 + i.val)) (T 140 (267 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1652.entries OriginalRow227TriangleForward1652.checked
    ⟨i.val, by rw [size1652]; exact i.isLt⟩
  change (entry1652 i).check = true at h
  rcases fields1652 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1653 : OriginalRow227TriangleForward1653.entries.size = 32 := rfl

def entry1653 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1653.entries[i.val]'(by rw [size1653]; exact i.isLt)

theorem fields1653 (i : Fin 32) :
    (entry1653 i).IA = shift ∧ (entry1653 i).ID = S (299 + i.val + 1) ∧
      (entry1653 i).IC = S 140 ∧ (entry1653 i).Inext = T 139 (299 + i.val + 1) ∧
      (entry1653 i).Icur = T 139 (299 + i.val) ∧
      (entry1653 i).output = T 140 (299 + i.val) ∧
      (entry1653 i).charge = charge 139 (299 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1661_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1669_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1653 (i : Fin 32) :
    forwardStepOK (-768) (charge 139 (299 + i.val)) shift
      (S (299 + i.val + 1)) (S 140) (T 139 (299 + i.val + 1))
      (T 139 (299 + i.val)) (T 140 (299 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1653.entries OriginalRow227TriangleForward1653.checked
    ⟨i.val, by rw [size1653]; exact i.isLt⟩
  change (entry1653 i).check = true at h
  rcases fields1653 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1654 : OriginalRow227TriangleForward1654.entries.size = 31 := rfl

def entry1654 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1654.entries[i.val]'(by rw [size1654]; exact i.isLt)

theorem fields1654 (i : Fin 31) :
    (entry1654 i).IA = shift ∧ (entry1654 i).ID = S (331 + i.val + 1) ∧
      (entry1654 i).IC = S 140 ∧ (entry1654 i).Inext = T 139 (331 + i.val + 1) ∧
      (entry1654 i).Icur = T 139 (331 + i.val) ∧
      (entry1654 i).output = T 140 (331 + i.val) ∧
      (entry1654 i).charge = charge 139 (331 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root140).symm,
      (OriginalRow227TriangleBindingsRow139.block1663_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow139.block1662_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow140.block1670_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1654 (i : Fin 31) :
    forwardStepOK (-768) (charge 139 (331 + i.val)) shift
      (S (331 + i.val + 1)) (S 140) (T 139 (331 + i.val + 1))
      (T 139 (331 + i.val)) (T 140 (331 + i.val))
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1654.entries OriginalRow227TriangleForward1654.checked
    ⟨i.val, by rw [size1654]; exact i.isLt⟩
  change (entry1654 i).check = true at h
  rcases fields1654 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 139 ≤ d) (hhi : d < 362) :
    forwardStepOK (-768) (charge 139 d) shift (S (d + 1)) (S 140)
      (T 139 (d + 1)) (T 139 d) (T 140 d)
      (OriginalRow227Roots.root_pos 140 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 139 (by decide)) = true := by
  by_cases h235 : d < 235
  ·
    by_cases h171 : d < 171
    ·
      have hi : d - 139 < 32 := by omega
      have heq : 139 + (d - 139) = d := by omega
      simpa only [heq] using step1648 ⟨d - 139, hi⟩
    ·
      by_cases h203 : d < 203
      ·
        have hi : d - 171 < 32 := by omega
        have heq : 171 + (d - 171) = d := by omega
        simpa only [heq] using step1649 ⟨d - 171, hi⟩
      ·
        have hi : d - 203 < 32 := by omega
        have heq : 203 + (d - 203) = d := by omega
        simpa only [heq] using step1650 ⟨d - 203, hi⟩
  ·
    by_cases h299 : d < 299
    ·
      by_cases h267 : d < 267
      ·
        have hi : d - 235 < 32 := by omega
        have heq : 235 + (d - 235) = d := by omega
        simpa only [heq] using step1651 ⟨d - 235, hi⟩
      ·
        have hi : d - 267 < 32 := by omega
        have heq : 267 + (d - 267) = d := by omega
        simpa only [heq] using step1652 ⟨d - 267, hi⟩
    ·
      by_cases h331 : d < 331
      ·
        have hi : d - 299 < 32 := by omega
        have heq : 299 + (d - 299) = d := by omega
        simpa only [heq] using step1653 ⟨d - 299, hi⟩
      ·
        have hi : d - 331 < 31 := by omega
        have heq : 331 + (d - 331) = d := by omega
        simpa only [heq] using step1654 ⟨d - 331, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1648,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1648,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1649,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1649,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1650,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1650,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1651,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1651,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1652,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1652,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1653,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1653,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.fields1654,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.step1654,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow140
