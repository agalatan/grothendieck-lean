import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow135
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow136
import Grothe.UpperChaos.OriginalRow227TriangleForward1616
import Grothe.UpperChaos.OriginalRow227TriangleForward1617
import Grothe.UpperChaos.OriginalRow227TriangleForward1618
import Grothe.UpperChaos.OriginalRow227TriangleForward1619
import Grothe.UpperChaos.OriginalRow227TriangleForward1620
import Grothe.UpperChaos.OriginalRow227TriangleForward1621
import Grothe.UpperChaos.OriginalRow227TriangleForward1622
import Grothe.UpperChaos.OriginalRow227TriangleForward1623

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1616 : OriginalRow227TriangleForward1616.entries.size = 32 := rfl

def entry1616 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1616.entries[i.val]'(by rw [size1616]; exact i.isLt)

theorem fields1616 (i : Fin 32) :
    (entry1616 i).IA = shift ∧ (entry1616 i).ID = S (135 + i.val + 1) ∧
      (entry1616 i).IC = S 136 ∧ (entry1616 i).Inext = T 135 (135 + i.val + 1) ∧
      (entry1616 i).Icur = T 135 (135 + i.val) ∧
      (entry1616 i).output = T 136 (135 + i.val) ∧
      (entry1616 i).charge = charge 135 (135 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root136).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root137).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root138).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root139).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root140).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root141).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1624_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1632_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1616 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (135 + i.val)) shift
      (S (135 + i.val + 1)) (S 136) (T 135 (135 + i.val + 1))
      (T 135 (135 + i.val)) (T 136 (135 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1616.entries OriginalRow227TriangleForward1616.checked
    ⟨i.val, by rw [size1616]; exact i.isLt⟩
  change (entry1616 i).check = true at h
  rcases fields1616 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1617 : OriginalRow227TriangleForward1617.entries.size = 32 := rfl

def entry1617 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1617.entries[i.val]'(by rw [size1617]; exact i.isLt)

theorem fields1617 (i : Fin 32) :
    (entry1617 i).IA = shift ∧ (entry1617 i).ID = S (167 + i.val + 1) ∧
      (entry1617 i).IC = S 136 ∧ (entry1617 i).Inext = T 135 (167 + i.val + 1) ∧
      (entry1617 i).Icur = T 135 (167 + i.val) ∧
      (entry1617 i).output = T 136 (167 + i.val) ∧
      (entry1617 i).charge = charge 135 (167 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1625_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1633_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1617 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (167 + i.val)) shift
      (S (167 + i.val + 1)) (S 136) (T 135 (167 + i.val + 1))
      (T 135 (167 + i.val)) (T 136 (167 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1617.entries OriginalRow227TriangleForward1617.checked
    ⟨i.val, by rw [size1617]; exact i.isLt⟩
  change (entry1617 i).check = true at h
  rcases fields1617 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1618 : OriginalRow227TriangleForward1618.entries.size = 32 := rfl

def entry1618 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1618.entries[i.val]'(by rw [size1618]; exact i.isLt)

theorem fields1618 (i : Fin 32) :
    (entry1618 i).IA = shift ∧ (entry1618 i).ID = S (199 + i.val + 1) ∧
      (entry1618 i).IC = S 136 ∧ (entry1618 i).Inext = T 135 (199 + i.val + 1) ∧
      (entry1618 i).Icur = T 135 (199 + i.val) ∧
      (entry1618 i).output = T 136 (199 + i.val) ∧
      (entry1618 i).charge = charge 135 (199 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1626_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1634_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1618 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (199 + i.val)) shift
      (S (199 + i.val + 1)) (S 136) (T 135 (199 + i.val + 1))
      (T 135 (199 + i.val)) (T 136 (199 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1618.entries OriginalRow227TriangleForward1618.checked
    ⟨i.val, by rw [size1618]; exact i.isLt⟩
  change (entry1618 i).check = true at h
  rcases fields1618 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1619 : OriginalRow227TriangleForward1619.entries.size = 32 := rfl

def entry1619 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1619.entries[i.val]'(by rw [size1619]; exact i.isLt)

theorem fields1619 (i : Fin 32) :
    (entry1619 i).IA = shift ∧ (entry1619 i).ID = S (231 + i.val + 1) ∧
      (entry1619 i).IC = S 136 ∧ (entry1619 i).Inext = T 135 (231 + i.val + 1) ∧
      (entry1619 i).Icur = T 135 (231 + i.val) ∧
      (entry1619 i).output = T 136 (231 + i.val) ∧
      (entry1619 i).charge = charge 135 (231 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1627_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1635_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1619 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (231 + i.val)) shift
      (S (231 + i.val + 1)) (S 136) (T 135 (231 + i.val + 1))
      (T 135 (231 + i.val)) (T 136 (231 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1619.entries OriginalRow227TriangleForward1619.checked
    ⟨i.val, by rw [size1619]; exact i.isLt⟩
  change (entry1619 i).check = true at h
  rcases fields1619 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1620 : OriginalRow227TriangleForward1620.entries.size = 32 := rfl

def entry1620 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1620.entries[i.val]'(by rw [size1620]; exact i.isLt)

theorem fields1620 (i : Fin 32) :
    (entry1620 i).IA = shift ∧ (entry1620 i).ID = S (263 + i.val + 1) ∧
      (entry1620 i).IC = S 136 ∧ (entry1620 i).Inext = T 135 (263 + i.val + 1) ∧
      (entry1620 i).Icur = T 135 (263 + i.val) ∧
      (entry1620 i).output = T 136 (263 + i.val) ∧
      (entry1620 i).charge = charge 135 (263 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1628_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1636_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1620 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (263 + i.val)) shift
      (S (263 + i.val + 1)) (S 136) (T 135 (263 + i.val + 1))
      (T 135 (263 + i.val)) (T 136 (263 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1620.entries OriginalRow227TriangleForward1620.checked
    ⟨i.val, by rw [size1620]; exact i.isLt⟩
  change (entry1620 i).check = true at h
  rcases fields1620 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1621 : OriginalRow227TriangleForward1621.entries.size = 32 := rfl

def entry1621 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1621.entries[i.val]'(by rw [size1621]; exact i.isLt)

theorem fields1621 (i : Fin 32) :
    (entry1621 i).IA = shift ∧ (entry1621 i).ID = S (295 + i.val + 1) ∧
      (entry1621 i).IC = S 136 ∧ (entry1621 i).Inext = T 135 (295 + i.val + 1) ∧
      (entry1621 i).Icur = T 135 (295 + i.val) ∧
      (entry1621 i).output = T 136 (295 + i.val) ∧
      (entry1621 i).charge = charge 135 (295 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1629_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1637_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1621 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (295 + i.val)) shift
      (S (295 + i.val + 1)) (S 136) (T 135 (295 + i.val + 1))
      (T 135 (295 + i.val)) (T 136 (295 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1621.entries OriginalRow227TriangleForward1621.checked
    ⟨i.val, by rw [size1621]; exact i.isLt⟩
  change (entry1621 i).check = true at h
  rcases fields1621 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1622 : OriginalRow227TriangleForward1622.entries.size = 32 := rfl

def entry1622 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1622.entries[i.val]'(by rw [size1622]; exact i.isLt)

theorem fields1622 (i : Fin 32) :
    (entry1622 i).IA = shift ∧ (entry1622 i).ID = S (327 + i.val + 1) ∧
      (entry1622 i).IC = S 136 ∧ (entry1622 i).Inext = T 135 (327 + i.val + 1) ∧
      (entry1622 i).Icur = T 135 (327 + i.val) ∧
      (entry1622 i).output = T 136 (327 + i.val) ∧
      (entry1622 i).charge = charge 135 (327 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1630_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1638_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1622 (i : Fin 32) :
    forwardStepOK (-768) (charge 135 (327 + i.val)) shift
      (S (327 + i.val + 1)) (S 136) (T 135 (327 + i.val + 1))
      (T 135 (327 + i.val)) (T 136 (327 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1622.entries OriginalRow227TriangleForward1622.checked
    ⟨i.val, by rw [size1622]; exact i.isLt⟩
  change (entry1622 i).check = true at h
  rcases fields1622 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1623 : OriginalRow227TriangleForward1623.entries.size = 7 := rfl

def entry1623 (i : Fin 7) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1623.entries[i.val]'(by rw [size1623]; exact i.isLt)

theorem fields1623 (i : Fin 7) :
    (entry1623 i).IA = shift ∧ (entry1623 i).ID = S (359 + i.val + 1) ∧
      (entry1623 i).IC = S 136 ∧ (entry1623 i).Inext = T 135 (359 + i.val + 1) ∧
      (entry1623 i).Icur = T 135 (359 + i.val) ∧
      (entry1623 i).output = T 136 (359 + i.val) ∧
      (entry1623 i).charge = charge 135 (359 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root361).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root362).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root363).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root364).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root365).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root366).symm, (OriginalRow227RootBindings04.S_eq_root136).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow135.block1631_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow136.block1639_value ⟨6, by decide⟩).symm, rfl⟩

theorem step1623 (i : Fin 7) :
    forwardStepOK (-768) (charge 135 (359 + i.val)) shift
      (S (359 + i.val + 1)) (S 136) (T 135 (359 + i.val + 1))
      (T 135 (359 + i.val)) (T 136 (359 + i.val))
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1623.entries OriginalRow227TriangleForward1623.checked
    ⟨i.val, by rw [size1623]; exact i.isLt⟩
  change (entry1623 i).check = true at h
  rcases fields1623 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 135 ≤ d) (hhi : d < 366) :
    forwardStepOK (-768) (charge 135 d) shift (S (d + 1)) (S 136)
      (T 135 (d + 1)) (T 135 d) (T 136 d)
      (OriginalRow227Roots.root_pos 136 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 135 (by decide)) = true := by
  by_cases h263 : d < 263
  ·
    by_cases h199 : d < 199
    ·
      by_cases h167 : d < 167
      ·
        have hi : d - 135 < 32 := by omega
        have heq : 135 + (d - 135) = d := by omega
        simpa only [heq] using step1616 ⟨d - 135, hi⟩
      ·
        have hi : d - 167 < 32 := by omega
        have heq : 167 + (d - 167) = d := by omega
        simpa only [heq] using step1617 ⟨d - 167, hi⟩
    ·
      by_cases h231 : d < 231
      ·
        have hi : d - 199 < 32 := by omega
        have heq : 199 + (d - 199) = d := by omega
        simpa only [heq] using step1618 ⟨d - 199, hi⟩
      ·
        have hi : d - 231 < 32 := by omega
        have heq : 231 + (d - 231) = d := by omega
        simpa only [heq] using step1619 ⟨d - 231, hi⟩
  ·
    by_cases h327 : d < 327
    ·
      by_cases h295 : d < 295
      ·
        have hi : d - 263 < 32 := by omega
        have heq : 263 + (d - 263) = d := by omega
        simpa only [heq] using step1620 ⟨d - 263, hi⟩
      ·
        have hi : d - 295 < 32 := by omega
        have heq : 295 + (d - 295) = d := by omega
        simpa only [heq] using step1621 ⟨d - 295, hi⟩
    ·
      by_cases h359 : d < 359
      ·
        have hi : d - 327 < 32 := by omega
        have heq : 327 + (d - 327) = d := by omega
        simpa only [heq] using step1622 ⟨d - 327, hi⟩
      ·
        have hi : d - 359 < 7 := by omega
        have heq : 359 + (d - 359) = d := by omega
        simpa only [heq] using step1623 ⟨d - 359, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1616,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1616,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1617,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1617,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1618,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1618,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1619,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1619,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1620,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1620,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1621,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1621,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1622,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1622,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.fields1623,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.step1623,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow136
