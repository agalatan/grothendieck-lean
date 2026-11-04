import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow141
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142
import Grothe.UpperChaos.OriginalRow227TriangleForward1662
import Grothe.UpperChaos.OriginalRow227TriangleForward1663
import Grothe.UpperChaos.OriginalRow227TriangleForward1664
import Grothe.UpperChaos.OriginalRow227TriangleForward1665
import Grothe.UpperChaos.OriginalRow227TriangleForward1666
import Grothe.UpperChaos.OriginalRow227TriangleForward1667
import Grothe.UpperChaos.OriginalRow227TriangleForward1668

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1662 : OriginalRow227TriangleForward1662.entries.size = 32 := rfl

def entry1662 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1662.entries[i.val]'(by rw [size1662]; exact i.isLt)

theorem fields1662 (i : Fin 32) :
    (entry1662 i).IA = shift ∧ (entry1662 i).ID = S (141 + i.val + 1) ∧
      (entry1662 i).IC = S 142 ∧ (entry1662 i).Inext = T 141 (141 + i.val + 1) ∧
      (entry1662 i).Icur = T 141 (141 + i.val) ∧
      (entry1662 i).output = T 142 (141 + i.val) ∧
      (entry1662 i).charge = charge 141 (141 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root142).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1671_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1662 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (141 + i.val)) shift
      (S (141 + i.val + 1)) (S 142) (T 141 (141 + i.val + 1))
      (T 141 (141 + i.val)) (T 142 (141 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1662.entries OriginalRow227TriangleForward1662.checked
    ⟨i.val, by rw [size1662]; exact i.isLt⟩
  change (entry1662 i).check = true at h
  rcases fields1662 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1663 : OriginalRow227TriangleForward1663.entries.size = 32 := rfl

def entry1663 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1663.entries[i.val]'(by rw [size1663]; exact i.isLt)

theorem fields1663 (i : Fin 32) :
    (entry1663 i).IA = shift ∧ (entry1663 i).ID = S (173 + i.val + 1) ∧
      (entry1663 i).IC = S 142 ∧ (entry1663 i).Inext = T 141 (173 + i.val + 1) ∧
      (entry1663 i).Icur = T 141 (173 + i.val) ∧
      (entry1663 i).output = T 142 (173 + i.val) ∧
      (entry1663 i).charge = charge 141 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1672_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1663 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 142) (T 141 (173 + i.val + 1))
      (T 141 (173 + i.val)) (T 142 (173 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1663.entries OriginalRow227TriangleForward1663.checked
    ⟨i.val, by rw [size1663]; exact i.isLt⟩
  change (entry1663 i).check = true at h
  rcases fields1663 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1664 : OriginalRow227TriangleForward1664.entries.size = 32 := rfl

def entry1664 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1664.entries[i.val]'(by rw [size1664]; exact i.isLt)

theorem fields1664 (i : Fin 32) :
    (entry1664 i).IA = shift ∧ (entry1664 i).ID = S (205 + i.val + 1) ∧
      (entry1664 i).IC = S 142 ∧ (entry1664 i).Inext = T 141 (205 + i.val + 1) ∧
      (entry1664 i).Icur = T 141 (205 + i.val) ∧
      (entry1664 i).output = T 142 (205 + i.val) ∧
      (entry1664 i).charge = charge 141 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1673_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1664 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 142) (T 141 (205 + i.val + 1))
      (T 141 (205 + i.val)) (T 142 (205 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1664.entries OriginalRow227TriangleForward1664.checked
    ⟨i.val, by rw [size1664]; exact i.isLt⟩
  change (entry1664 i).check = true at h
  rcases fields1664 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1665 : OriginalRow227TriangleForward1665.entries.size = 32 := rfl

def entry1665 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1665.entries[i.val]'(by rw [size1665]; exact i.isLt)

theorem fields1665 (i : Fin 32) :
    (entry1665 i).IA = shift ∧ (entry1665 i).ID = S (237 + i.val + 1) ∧
      (entry1665 i).IC = S 142 ∧ (entry1665 i).Inext = T 141 (237 + i.val + 1) ∧
      (entry1665 i).Icur = T 141 (237 + i.val) ∧
      (entry1665 i).output = T 142 (237 + i.val) ∧
      (entry1665 i).charge = charge 141 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1674_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1665 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 142) (T 141 (237 + i.val + 1))
      (T 141 (237 + i.val)) (T 142 (237 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1665.entries OriginalRow227TriangleForward1665.checked
    ⟨i.val, by rw [size1665]; exact i.isLt⟩
  change (entry1665 i).check = true at h
  rcases fields1665 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1666 : OriginalRow227TriangleForward1666.entries.size = 32 := rfl

def entry1666 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1666.entries[i.val]'(by rw [size1666]; exact i.isLt)

theorem fields1666 (i : Fin 32) :
    (entry1666 i).IA = shift ∧ (entry1666 i).ID = S (269 + i.val + 1) ∧
      (entry1666 i).IC = S 142 ∧ (entry1666 i).Inext = T 141 (269 + i.val + 1) ∧
      (entry1666 i).Icur = T 141 (269 + i.val) ∧
      (entry1666 i).output = T 142 (269 + i.val) ∧
      (entry1666 i).charge = charge 141 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1675_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1666 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 142) (T 141 (269 + i.val + 1))
      (T 141 (269 + i.val)) (T 142 (269 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1666.entries OriginalRow227TriangleForward1666.checked
    ⟨i.val, by rw [size1666]; exact i.isLt⟩
  change (entry1666 i).check = true at h
  rcases fields1666 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1667 : OriginalRow227TriangleForward1667.entries.size = 32 := rfl

def entry1667 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1667.entries[i.val]'(by rw [size1667]; exact i.isLt)

theorem fields1667 (i : Fin 32) :
    (entry1667 i).IA = shift ∧ (entry1667 i).ID = S (301 + i.val + 1) ∧
      (entry1667 i).IC = S 142 ∧ (entry1667 i).Inext = T 141 (301 + i.val + 1) ∧
      (entry1667 i).Icur = T 141 (301 + i.val) ∧
      (entry1667 i).output = T 142 (301 + i.val) ∧
      (entry1667 i).charge = charge 141 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1676_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1667 (i : Fin 32) :
    forwardStepOK (-768) (charge 141 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 142) (T 141 (301 + i.val + 1))
      (T 141 (301 + i.val)) (T 142 (301 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1667.entries OriginalRow227TriangleForward1667.checked
    ⟨i.val, by rw [size1667]; exact i.isLt⟩
  change (entry1667 i).check = true at h
  rcases fields1667 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1668 : OriginalRow227TriangleForward1668.entries.size = 27 := rfl

def entry1668 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1668.entries[i.val]'(by rw [size1668]; exact i.isLt)

theorem fields1668 (i : Fin 27) :
    (entry1668 i).IA = shift ∧ (entry1668 i).ID = S (333 + i.val + 1) ∧
      (entry1668 i).IC = S 142 ∧ (entry1668 i).Inext = T 141 (333 + i.val + 1) ∧
      (entry1668 i).Icur = T 141 (333 + i.val) ∧
      (entry1668 i).output = T 142 (333 + i.val) ∧
      (entry1668 i).charge = charge 141 (333 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root360).symm, (OriginalRow227RootBindings04.S_eq_root142).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow141.block1677_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1668 (i : Fin 27) :
    forwardStepOK (-768) (charge 141 (333 + i.val)) shift
      (S (333 + i.val + 1)) (S 142) (T 141 (333 + i.val + 1))
      (T 141 (333 + i.val)) (T 142 (333 + i.val))
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1668.entries OriginalRow227TriangleForward1668.checked
    ⟨i.val, by rw [size1668]; exact i.isLt⟩
  change (entry1668 i).check = true at h
  rcases fields1668 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 141 ≤ d) (hhi : d < 360) :
    forwardStepOK (-768) (charge 141 d) shift (S (d + 1)) (S 142)
      (T 141 (d + 1)) (T 141 d) (T 142 d)
      (OriginalRow227Roots.root_pos 142 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 141 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h173 : d < 173
    ·
      have hi : d - 141 < 32 := by omega
      have heq : 141 + (d - 141) = d := by omega
      simpa only [heq] using step1662 ⟨d - 141, hi⟩
    ·
      by_cases h205 : d < 205
      ·
        have hi : d - 173 < 32 := by omega
        have heq : 173 + (d - 173) = d := by omega
        simpa only [heq] using step1663 ⟨d - 173, hi⟩
      ·
        have hi : d - 205 < 32 := by omega
        have heq : 205 + (d - 205) = d := by omega
        simpa only [heq] using step1664 ⟨d - 205, hi⟩
  ·
    by_cases h301 : d < 301
    ·
      by_cases h269 : d < 269
      ·
        have hi : d - 237 < 32 := by omega
        have heq : 237 + (d - 237) = d := by omega
        simpa only [heq] using step1665 ⟨d - 237, hi⟩
      ·
        have hi : d - 269 < 32 := by omega
        have heq : 269 + (d - 269) = d := by omega
        simpa only [heq] using step1666 ⟨d - 269, hi⟩
    ·
      by_cases h333 : d < 333
      ·
        have hi : d - 301 < 32 := by omega
        have heq : 301 + (d - 301) = d := by omega
        simpa only [heq] using step1667 ⟨d - 301, hi⟩
      ·
        have hi : d - 333 < 27 := by omega
        have heq : 333 + (d - 333) = d := by omega
        simpa only [heq] using step1668 ⟨d - 333, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1662,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1662,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1663,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1663,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1664,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1664,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1665,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1665,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1666,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1666,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1667,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1667,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.fields1668,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.step1668,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow142
