import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow147
import Grothe.UpperChaos.OriginalRow227TriangleForward1697
import Grothe.UpperChaos.OriginalRow227TriangleForward1698
import Grothe.UpperChaos.OriginalRow227TriangleForward1699
import Grothe.UpperChaos.OriginalRow227TriangleForward1700
import Grothe.UpperChaos.OriginalRow227TriangleForward1701
import Grothe.UpperChaos.OriginalRow227TriangleForward1702
import Grothe.UpperChaos.OriginalRow227TriangleForward1703

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1697 : OriginalRow227TriangleForward1697.entries.size = 32 := rfl

def entry1697 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1697.entries[i.val]'(by rw [size1697]; exact i.isLt)

theorem fields1697 (i : Fin 32) :
    (entry1697 i).IA = shift ∧ (entry1697 i).ID = S (146 + i.val + 1) ∧
      (entry1697 i).IC = S 147 ∧ (entry1697 i).Inext = T 146 (146 + i.val + 1) ∧
      (entry1697 i).Icur = T 146 (146 + i.val) ∧
      (entry1697 i).output = T 147 (146 + i.val) ∧
      (entry1697 i).charge = charge 146 (146 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1713_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1697 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (146 + i.val)) shift
      (S (146 + i.val + 1)) (S 147) (T 146 (146 + i.val + 1))
      (T 146 (146 + i.val)) (T 147 (146 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1697.entries OriginalRow227TriangleForward1697.checked
    ⟨i.val, by rw [size1697]; exact i.isLt⟩
  change (entry1697 i).check = true at h
  rcases fields1697 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1698 : OriginalRow227TriangleForward1698.entries.size = 32 := rfl

def entry1698 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1698.entries[i.val]'(by rw [size1698]; exact i.isLt)

theorem fields1698 (i : Fin 32) :
    (entry1698 i).IA = shift ∧ (entry1698 i).ID = S (178 + i.val + 1) ∧
      (entry1698 i).IC = S 147 ∧ (entry1698 i).Inext = T 146 (178 + i.val + 1) ∧
      (entry1698 i).Icur = T 146 (178 + i.val) ∧
      (entry1698 i).output = T 147 (178 + i.val) ∧
      (entry1698 i).charge = charge 146 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1714_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1698 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 147) (T 146 (178 + i.val + 1))
      (T 146 (178 + i.val)) (T 147 (178 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1698.entries OriginalRow227TriangleForward1698.checked
    ⟨i.val, by rw [size1698]; exact i.isLt⟩
  change (entry1698 i).check = true at h
  rcases fields1698 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1699 : OriginalRow227TriangleForward1699.entries.size = 32 := rfl

def entry1699 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1699.entries[i.val]'(by rw [size1699]; exact i.isLt)

theorem fields1699 (i : Fin 32) :
    (entry1699 i).IA = shift ∧ (entry1699 i).ID = S (210 + i.val + 1) ∧
      (entry1699 i).IC = S 147 ∧ (entry1699 i).Inext = T 146 (210 + i.val + 1) ∧
      (entry1699 i).Icur = T 146 (210 + i.val) ∧
      (entry1699 i).output = T 147 (210 + i.val) ∧
      (entry1699 i).charge = charge 146 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1715_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1699 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 147) (T 146 (210 + i.val + 1))
      (T 146 (210 + i.val)) (T 147 (210 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1699.entries OriginalRow227TriangleForward1699.checked
    ⟨i.val, by rw [size1699]; exact i.isLt⟩
  change (entry1699 i).check = true at h
  rcases fields1699 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1700 : OriginalRow227TriangleForward1700.entries.size = 32 := rfl

def entry1700 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1700.entries[i.val]'(by rw [size1700]; exact i.isLt)

theorem fields1700 (i : Fin 32) :
    (entry1700 i).IA = shift ∧ (entry1700 i).ID = S (242 + i.val + 1) ∧
      (entry1700 i).IC = S 147 ∧ (entry1700 i).Inext = T 146 (242 + i.val + 1) ∧
      (entry1700 i).Icur = T 146 (242 + i.val) ∧
      (entry1700 i).output = T 147 (242 + i.val) ∧
      (entry1700 i).charge = charge 146 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1716_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1700 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 147) (T 146 (242 + i.val + 1))
      (T 146 (242 + i.val)) (T 147 (242 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1700.entries OriginalRow227TriangleForward1700.checked
    ⟨i.val, by rw [size1700]; exact i.isLt⟩
  change (entry1700 i).check = true at h
  rcases fields1700 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1701 : OriginalRow227TriangleForward1701.entries.size = 32 := rfl

def entry1701 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1701.entries[i.val]'(by rw [size1701]; exact i.isLt)

theorem fields1701 (i : Fin 32) :
    (entry1701 i).IA = shift ∧ (entry1701 i).ID = S (274 + i.val + 1) ∧
      (entry1701 i).IC = S 147 ∧ (entry1701 i).Inext = T 146 (274 + i.val + 1) ∧
      (entry1701 i).Icur = T 146 (274 + i.val) ∧
      (entry1701 i).output = T 147 (274 + i.val) ∧
      (entry1701 i).charge = charge 146 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1717_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1701 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 147) (T 146 (274 + i.val + 1))
      (T 146 (274 + i.val)) (T 147 (274 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1701.entries OriginalRow227TriangleForward1701.checked
    ⟨i.val, by rw [size1701]; exact i.isLt⟩
  change (entry1701 i).check = true at h
  rcases fields1701 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1702 : OriginalRow227TriangleForward1702.entries.size = 32 := rfl

def entry1702 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1702.entries[i.val]'(by rw [size1702]; exact i.isLt)

theorem fields1702 (i : Fin 32) :
    (entry1702 i).IA = shift ∧ (entry1702 i).ID = S (306 + i.val + 1) ∧
      (entry1702 i).IC = S 147 ∧ (entry1702 i).Inext = T 146 (306 + i.val + 1) ∧
      (entry1702 i).Icur = T 146 (306 + i.val) ∧
      (entry1702 i).output = T 147 (306 + i.val) ∧
      (entry1702 i).charge = charge 146 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1718_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1702 (i : Fin 32) :
    forwardStepOK (-768) (charge 146 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 147) (T 146 (306 + i.val + 1))
      (T 146 (306 + i.val)) (T 147 (306 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1702.entries OriginalRow227TriangleForward1702.checked
    ⟨i.val, by rw [size1702]; exact i.isLt⟩
  change (entry1702 i).check = true at h
  rcases fields1702 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1703 : OriginalRow227TriangleForward1703.entries.size = 17 := rfl

def entry1703 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1703.entries[i.val]'(by rw [size1703]; exact i.isLt)

theorem fields1703 (i : Fin 17) :
    (entry1703 i).IA = shift ∧ (entry1703 i).ID = S (338 + i.val + 1) ∧
      (entry1703 i).IC = S 147 ∧ (entry1703 i).Inext = T 146 (338 + i.val + 1) ∧
      (entry1703 i).Icur = T 146 (338 + i.val) ∧
      (entry1703 i).output = T 147 (338 + i.val) ∧
      (entry1703 i).charge = charge 146 (338 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root147).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow147.block1719_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1703 (i : Fin 17) :
    forwardStepOK (-768) (charge 146 (338 + i.val)) shift
      (S (338 + i.val + 1)) (S 147) (T 146 (338 + i.val + 1))
      (T 146 (338 + i.val)) (T 147 (338 + i.val))
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1703.entries OriginalRow227TriangleForward1703.checked
    ⟨i.val, by rw [size1703]; exact i.isLt⟩
  change (entry1703 i).check = true at h
  rcases fields1703 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 146 ≤ d) (hhi : d < 355) :
    forwardStepOK (-768) (charge 146 d) shift (S (d + 1)) (S 147)
      (T 146 (d + 1)) (T 146 d) (T 147 d)
      (OriginalRow227Roots.root_pos 147 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 146 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h178 : d < 178
    ·
      have hi : d - 146 < 32 := by omega
      have heq : 146 + (d - 146) = d := by omega
      simpa only [heq] using step1697 ⟨d - 146, hi⟩
    ·
      by_cases h210 : d < 210
      ·
        have hi : d - 178 < 32 := by omega
        have heq : 178 + (d - 178) = d := by omega
        simpa only [heq] using step1698 ⟨d - 178, hi⟩
      ·
        have hi : d - 210 < 32 := by omega
        have heq : 210 + (d - 210) = d := by omega
        simpa only [heq] using step1699 ⟨d - 210, hi⟩
  ·
    by_cases h306 : d < 306
    ·
      by_cases h274 : d < 274
      ·
        have hi : d - 242 < 32 := by omega
        have heq : 242 + (d - 242) = d := by omega
        simpa only [heq] using step1700 ⟨d - 242, hi⟩
      ·
        have hi : d - 274 < 32 := by omega
        have heq : 274 + (d - 274) = d := by omega
        simpa only [heq] using step1701 ⟨d - 274, hi⟩
    ·
      by_cases h338 : d < 338
      ·
        have hi : d - 306 < 32 := by omega
        have heq : 306 + (d - 306) = d := by omega
        simpa only [heq] using step1702 ⟨d - 306, hi⟩
      ·
        have hi : d - 338 < 17 := by omega
        have heq : 338 + (d - 338) = d := by omega
        simpa only [heq] using step1703 ⟨d - 338, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1697,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1697,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1698,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1698,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1699,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1699,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1700,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1700,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1701,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1701,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1702,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1702,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.fields1703,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.step1703,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow147
