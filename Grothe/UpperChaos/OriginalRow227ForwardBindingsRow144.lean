import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144
import Grothe.UpperChaos.OriginalRow227TriangleForward1676
import Grothe.UpperChaos.OriginalRow227TriangleForward1677
import Grothe.UpperChaos.OriginalRow227TriangleForward1678
import Grothe.UpperChaos.OriginalRow227TriangleForward1679
import Grothe.UpperChaos.OriginalRow227TriangleForward1680
import Grothe.UpperChaos.OriginalRow227TriangleForward1681
import Grothe.UpperChaos.OriginalRow227TriangleForward1682

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1676 : OriginalRow227TriangleForward1676.entries.size = 32 := rfl

def entry1676 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1676.entries[i.val]'(by rw [size1676]; exact i.isLt)

theorem fields1676 (i : Fin 32) :
    (entry1676 i).IA = shift ∧ (entry1676 i).ID = S (143 + i.val + 1) ∧
      (entry1676 i).IC = S 144 ∧ (entry1676 i).Inext = T 143 (143 + i.val + 1) ∧
      (entry1676 i).Icur = T 143 (143 + i.val) ∧
      (entry1676 i).output = T 144 (143 + i.val) ∧
      (entry1676 i).charge = charge 143 (143 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1676 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (143 + i.val)) shift
      (S (143 + i.val + 1)) (S 144) (T 143 (143 + i.val + 1))
      (T 143 (143 + i.val)) (T 144 (143 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1676.entries OriginalRow227TriangleForward1676.checked
    ⟨i.val, by rw [size1676]; exact i.isLt⟩
  change (entry1676 i).check = true at h
  rcases fields1676 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1677 : OriginalRow227TriangleForward1677.entries.size = 32 := rfl

def entry1677 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1677.entries[i.val]'(by rw [size1677]; exact i.isLt)

theorem fields1677 (i : Fin 32) :
    (entry1677 i).IA = shift ∧ (entry1677 i).ID = S (175 + i.val + 1) ∧
      (entry1677 i).IC = S 144 ∧ (entry1677 i).Inext = T 143 (175 + i.val + 1) ∧
      (entry1677 i).Icur = T 143 (175 + i.val) ∧
      (entry1677 i).output = T 144 (175 + i.val) ∧
      (entry1677 i).charge = charge 143 (175 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1677 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (175 + i.val)) shift
      (S (175 + i.val + 1)) (S 144) (T 143 (175 + i.val + 1))
      (T 143 (175 + i.val)) (T 144 (175 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1677.entries OriginalRow227TriangleForward1677.checked
    ⟨i.val, by rw [size1677]; exact i.isLt⟩
  change (entry1677 i).check = true at h
  rcases fields1677 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1678 : OriginalRow227TriangleForward1678.entries.size = 32 := rfl

def entry1678 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1678.entries[i.val]'(by rw [size1678]; exact i.isLt)

theorem fields1678 (i : Fin 32) :
    (entry1678 i).IA = shift ∧ (entry1678 i).ID = S (207 + i.val + 1) ∧
      (entry1678 i).IC = S 144 ∧ (entry1678 i).Inext = T 143 (207 + i.val + 1) ∧
      (entry1678 i).Icur = T 143 (207 + i.val) ∧
      (entry1678 i).output = T 144 (207 + i.val) ∧
      (entry1678 i).charge = charge 143 (207 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1678 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (207 + i.val)) shift
      (S (207 + i.val + 1)) (S 144) (T 143 (207 + i.val + 1))
      (T 143 (207 + i.val)) (T 144 (207 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1678.entries OriginalRow227TriangleForward1678.checked
    ⟨i.val, by rw [size1678]; exact i.isLt⟩
  change (entry1678 i).check = true at h
  rcases fields1678 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1679 : OriginalRow227TriangleForward1679.entries.size = 32 := rfl

def entry1679 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1679.entries[i.val]'(by rw [size1679]; exact i.isLt)

theorem fields1679 (i : Fin 32) :
    (entry1679 i).IA = shift ∧ (entry1679 i).ID = S (239 + i.val + 1) ∧
      (entry1679 i).IC = S 144 ∧ (entry1679 i).Inext = T 143 (239 + i.val + 1) ∧
      (entry1679 i).Icur = T 143 (239 + i.val) ∧
      (entry1679 i).output = T 144 (239 + i.val) ∧
      (entry1679 i).charge = charge 143 (239 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1679 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (239 + i.val)) shift
      (S (239 + i.val + 1)) (S 144) (T 143 (239 + i.val + 1))
      (T 143 (239 + i.val)) (T 144 (239 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1679.entries OriginalRow227TriangleForward1679.checked
    ⟨i.val, by rw [size1679]; exact i.isLt⟩
  change (entry1679 i).check = true at h
  rcases fields1679 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1680 : OriginalRow227TriangleForward1680.entries.size = 32 := rfl

def entry1680 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1680.entries[i.val]'(by rw [size1680]; exact i.isLt)

theorem fields1680 (i : Fin 32) :
    (entry1680 i).IA = shift ∧ (entry1680 i).ID = S (271 + i.val + 1) ∧
      (entry1680 i).IC = S 144 ∧ (entry1680 i).Inext = T 143 (271 + i.val + 1) ∧
      (entry1680 i).Icur = T 143 (271 + i.val) ∧
      (entry1680 i).output = T 144 (271 + i.val) ∧
      (entry1680 i).charge = charge 143 (271 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1680 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (271 + i.val)) shift
      (S (271 + i.val + 1)) (S 144) (T 143 (271 + i.val + 1))
      (T 143 (271 + i.val)) (T 144 (271 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1680.entries OriginalRow227TriangleForward1680.checked
    ⟨i.val, by rw [size1680]; exact i.isLt⟩
  change (entry1680 i).check = true at h
  rcases fields1680 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1681 : OriginalRow227TriangleForward1681.entries.size = 32 := rfl

def entry1681 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1681.entries[i.val]'(by rw [size1681]; exact i.isLt)

theorem fields1681 (i : Fin 32) :
    (entry1681 i).IA = shift ∧ (entry1681 i).ID = S (303 + i.val + 1) ∧
      (entry1681 i).IC = S 144 ∧ (entry1681 i).Inext = T 143 (303 + i.val + 1) ∧
      (entry1681 i).Icur = T 143 (303 + i.val) ∧
      (entry1681 i).output = T 144 (303 + i.val) ∧
      (entry1681 i).charge = charge 143 (303 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1681 (i : Fin 32) :
    forwardStepOK (-768) (charge 143 (303 + i.val)) shift
      (S (303 + i.val + 1)) (S 144) (T 143 (303 + i.val + 1))
      (T 143 (303 + i.val)) (T 144 (303 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1681.entries OriginalRow227TriangleForward1681.checked
    ⟨i.val, by rw [size1681]; exact i.isLt⟩
  change (entry1681 i).check = true at h
  rcases fields1681 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1682 : OriginalRow227TriangleForward1682.entries.size = 23 := rfl

def entry1682 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1682.entries[i.val]'(by rw [size1682]; exact i.isLt)

theorem fields1682 (i : Fin 23) :
    (entry1682 i).IA = shift ∧ (entry1682 i).ID = S (335 + i.val + 1) ∧
      (entry1682 i).IC = S 144 ∧ (entry1682 i).Inext = T 143 (335 + i.val + 1) ∧
      (entry1682 i).Icur = T 143 (335 + i.val) ∧
      (entry1682 i).output = T 144 (335 + i.val) ∧
      (entry1682 i).charge = charge 143 (335 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root144).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1682 (i : Fin 23) :
    forwardStepOK (-768) (charge 143 (335 + i.val)) shift
      (S (335 + i.val + 1)) (S 144) (T 143 (335 + i.val + 1))
      (T 143 (335 + i.val)) (T 144 (335 + i.val))
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1682.entries OriginalRow227TriangleForward1682.checked
    ⟨i.val, by rw [size1682]; exact i.isLt⟩
  change (entry1682 i).check = true at h
  rcases fields1682 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 143 ≤ d) (hhi : d < 358) :
    forwardStepOK (-768) (charge 143 d) shift (S (d + 1)) (S 144)
      (T 143 (d + 1)) (T 143 d) (T 144 d)
      (OriginalRow227Roots.root_pos 144 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 143 (by decide)) = true := by
  by_cases h239 : d < 239
  ·
    by_cases h175 : d < 175
    ·
      have hi : d - 143 < 32 := by omega
      have heq : 143 + (d - 143) = d := by omega
      simpa only [heq] using step1676 ⟨d - 143, hi⟩
    ·
      by_cases h207 : d < 207
      ·
        have hi : d - 175 < 32 := by omega
        have heq : 175 + (d - 175) = d := by omega
        simpa only [heq] using step1677 ⟨d - 175, hi⟩
      ·
        have hi : d - 207 < 32 := by omega
        have heq : 207 + (d - 207) = d := by omega
        simpa only [heq] using step1678 ⟨d - 207, hi⟩
  ·
    by_cases h303 : d < 303
    ·
      by_cases h271 : d < 271
      ·
        have hi : d - 239 < 32 := by omega
        have heq : 239 + (d - 239) = d := by omega
        simpa only [heq] using step1679 ⟨d - 239, hi⟩
      ·
        have hi : d - 271 < 32 := by omega
        have heq : 271 + (d - 271) = d := by omega
        simpa only [heq] using step1680 ⟨d - 271, hi⟩
    ·
      by_cases h335 : d < 335
      ·
        have hi : d - 303 < 32 := by omega
        have heq : 303 + (d - 303) = d := by omega
        simpa only [heq] using step1681 ⟨d - 303, hi⟩
      ·
        have hi : d - 335 < 23 := by omega
        have heq : 335 + (d - 335) = d := by omega
        simpa only [heq] using step1682 ⟨d - 335, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1676,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1676,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1677,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1677,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1678,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1678,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1679,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1679,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1680,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1680,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1681,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1681,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.fields1682,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.step1682,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow144
