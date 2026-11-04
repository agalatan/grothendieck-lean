import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow150
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow151
import Grothe.UpperChaos.OriginalRow227TriangleForward1725
import Grothe.UpperChaos.OriginalRow227TriangleForward1726
import Grothe.UpperChaos.OriginalRow227TriangleForward1727
import Grothe.UpperChaos.OriginalRow227TriangleForward1728
import Grothe.UpperChaos.OriginalRow227TriangleForward1729
import Grothe.UpperChaos.OriginalRow227TriangleForward1730
import Grothe.UpperChaos.OriginalRow227TriangleForward1731

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1725 : OriginalRow227TriangleForward1725.entries.size = 32 := rfl

def entry1725 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1725.entries[i.val]'(by rw [size1725]; exact i.isLt)

theorem fields1725 (i : Fin 32) :
    (entry1725 i).IA = shift ∧ (entry1725 i).ID = S (150 + i.val + 1) ∧
      (entry1725 i).IC = S 151 ∧ (entry1725 i).Inext = T 150 (150 + i.val + 1) ∧
      (entry1725 i).Icur = T 150 (150 + i.val) ∧
      (entry1725 i).output = T 151 (150 + i.val) ∧
      (entry1725 i).charge = charge 150 (150 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1734_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1741_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1725 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (150 + i.val)) shift
      (S (150 + i.val + 1)) (S 151) (T 150 (150 + i.val + 1))
      (T 150 (150 + i.val)) (T 151 (150 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1725.entries OriginalRow227TriangleForward1725.checked
    ⟨i.val, by rw [size1725]; exact i.isLt⟩
  change (entry1725 i).check = true at h
  rcases fields1725 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1726 : OriginalRow227TriangleForward1726.entries.size = 32 := rfl

def entry1726 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1726.entries[i.val]'(by rw [size1726]; exact i.isLt)

theorem fields1726 (i : Fin 32) :
    (entry1726 i).IA = shift ∧ (entry1726 i).ID = S (182 + i.val + 1) ∧
      (entry1726 i).IC = S 151 ∧ (entry1726 i).Inext = T 150 (182 + i.val + 1) ∧
      (entry1726 i).Icur = T 150 (182 + i.val) ∧
      (entry1726 i).output = T 151 (182 + i.val) ∧
      (entry1726 i).charge = charge 150 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1735_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1742_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1726 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 151) (T 150 (182 + i.val + 1))
      (T 150 (182 + i.val)) (T 151 (182 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1726.entries OriginalRow227TriangleForward1726.checked
    ⟨i.val, by rw [size1726]; exact i.isLt⟩
  change (entry1726 i).check = true at h
  rcases fields1726 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1727 : OriginalRow227TriangleForward1727.entries.size = 32 := rfl

def entry1727 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1727.entries[i.val]'(by rw [size1727]; exact i.isLt)

theorem fields1727 (i : Fin 32) :
    (entry1727 i).IA = shift ∧ (entry1727 i).ID = S (214 + i.val + 1) ∧
      (entry1727 i).IC = S 151 ∧ (entry1727 i).Inext = T 150 (214 + i.val + 1) ∧
      (entry1727 i).Icur = T 150 (214 + i.val) ∧
      (entry1727 i).output = T 151 (214 + i.val) ∧
      (entry1727 i).charge = charge 150 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1736_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1743_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1727 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 151) (T 150 (214 + i.val + 1))
      (T 150 (214 + i.val)) (T 151 (214 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1727.entries OriginalRow227TriangleForward1727.checked
    ⟨i.val, by rw [size1727]; exact i.isLt⟩
  change (entry1727 i).check = true at h
  rcases fields1727 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1728 : OriginalRow227TriangleForward1728.entries.size = 32 := rfl

def entry1728 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1728.entries[i.val]'(by rw [size1728]; exact i.isLt)

theorem fields1728 (i : Fin 32) :
    (entry1728 i).IA = shift ∧ (entry1728 i).ID = S (246 + i.val + 1) ∧
      (entry1728 i).IC = S 151 ∧ (entry1728 i).Inext = T 150 (246 + i.val + 1) ∧
      (entry1728 i).Icur = T 150 (246 + i.val) ∧
      (entry1728 i).output = T 151 (246 + i.val) ∧
      (entry1728 i).charge = charge 150 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1737_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1744_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1728 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 151) (T 150 (246 + i.val + 1))
      (T 150 (246 + i.val)) (T 151 (246 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1728.entries OriginalRow227TriangleForward1728.checked
    ⟨i.val, by rw [size1728]; exact i.isLt⟩
  change (entry1728 i).check = true at h
  rcases fields1728 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1729 : OriginalRow227TriangleForward1729.entries.size = 32 := rfl

def entry1729 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1729.entries[i.val]'(by rw [size1729]; exact i.isLt)

theorem fields1729 (i : Fin 32) :
    (entry1729 i).IA = shift ∧ (entry1729 i).ID = S (278 + i.val + 1) ∧
      (entry1729 i).IC = S 151 ∧ (entry1729 i).Inext = T 150 (278 + i.val + 1) ∧
      (entry1729 i).Icur = T 150 (278 + i.val) ∧
      (entry1729 i).output = T 151 (278 + i.val) ∧
      (entry1729 i).charge = charge 150 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1738_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1745_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1729 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 151) (T 150 (278 + i.val + 1))
      (T 150 (278 + i.val)) (T 151 (278 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1729.entries OriginalRow227TriangleForward1729.checked
    ⟨i.val, by rw [size1729]; exact i.isLt⟩
  change (entry1729 i).check = true at h
  rcases fields1729 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1730 : OriginalRow227TriangleForward1730.entries.size = 32 := rfl

def entry1730 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1730.entries[i.val]'(by rw [size1730]; exact i.isLt)

theorem fields1730 (i : Fin 32) :
    (entry1730 i).IA = shift ∧ (entry1730 i).ID = S (310 + i.val + 1) ∧
      (entry1730 i).IC = S 151 ∧ (entry1730 i).Inext = T 150 (310 + i.val + 1) ∧
      (entry1730 i).Icur = T 150 (310 + i.val) ∧
      (entry1730 i).output = T 151 (310 + i.val) ∧
      (entry1730 i).charge = charge 150 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1739_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1746_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1730 (i : Fin 32) :
    forwardStepOK (-768) (charge 150 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 151) (T 150 (310 + i.val + 1))
      (T 150 (310 + i.val)) (T 151 (310 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1730.entries OriginalRow227TriangleForward1730.checked
    ⟨i.val, by rw [size1730]; exact i.isLt⟩
  change (entry1730 i).check = true at h
  rcases fields1730 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1731 : OriginalRow227TriangleForward1731.entries.size = 9 := rfl

def entry1731 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1731.entries[i.val]'(by rw [size1731]; exact i.isLt)

theorem fields1731 (i : Fin 9) :
    (entry1731 i).IA = shift ∧ (entry1731 i).ID = S (342 + i.val + 1) ∧
      (entry1731 i).IC = S 151 ∧ (entry1731 i).Inext = T 150 (342 + i.val + 1) ∧
      (entry1731 i).Icur = T 150 (342 + i.val) ∧
      (entry1731 i).output = T 151 (342 + i.val) ∧
      (entry1731 i).charge = charge 150 (342 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root151).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow150.block1740_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow151.block1747_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1731 (i : Fin 9) :
    forwardStepOK (-768) (charge 150 (342 + i.val)) shift
      (S (342 + i.val + 1)) (S 151) (T 150 (342 + i.val + 1))
      (T 150 (342 + i.val)) (T 151 (342 + i.val))
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1731.entries OriginalRow227TriangleForward1731.checked
    ⟨i.val, by rw [size1731]; exact i.isLt⟩
  change (entry1731 i).check = true at h
  rcases fields1731 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 150 ≤ d) (hhi : d < 351) :
    forwardStepOK (-768) (charge 150 d) shift (S (d + 1)) (S 151)
      (T 150 (d + 1)) (T 150 d) (T 151 d)
      (OriginalRow227Roots.root_pos 151 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 150 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h182 : d < 182
    ·
      have hi : d - 150 < 32 := by omega
      have heq : 150 + (d - 150) = d := by omega
      simpa only [heq] using step1725 ⟨d - 150, hi⟩
    ·
      by_cases h214 : d < 214
      ·
        have hi : d - 182 < 32 := by omega
        have heq : 182 + (d - 182) = d := by omega
        simpa only [heq] using step1726 ⟨d - 182, hi⟩
      ·
        have hi : d - 214 < 32 := by omega
        have heq : 214 + (d - 214) = d := by omega
        simpa only [heq] using step1727 ⟨d - 214, hi⟩
  ·
    by_cases h310 : d < 310
    ·
      by_cases h278 : d < 278
      ·
        have hi : d - 246 < 32 := by omega
        have heq : 246 + (d - 246) = d := by omega
        simpa only [heq] using step1728 ⟨d - 246, hi⟩
      ·
        have hi : d - 278 < 32 := by omega
        have heq : 278 + (d - 278) = d := by omega
        simpa only [heq] using step1729 ⟨d - 278, hi⟩
    ·
      by_cases h342 : d < 342
      ·
        have hi : d - 310 < 32 := by omega
        have heq : 310 + (d - 310) = d := by omega
        simpa only [heq] using step1730 ⟨d - 310, hi⟩
      ·
        have hi : d - 342 < 9 := by omega
        have heq : 342 + (d - 342) = d := by omega
        simpa only [heq] using step1731 ⟨d - 342, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1725,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1725,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1726,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1726,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1727,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1727,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1728,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1728,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1729,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1729,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1730,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1730,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.fields1731,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.step1731,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow151
