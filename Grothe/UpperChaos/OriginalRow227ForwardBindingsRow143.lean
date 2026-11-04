import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow142
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow143
import Grothe.UpperChaos.OriginalRow227TriangleForward1669
import Grothe.UpperChaos.OriginalRow227TriangleForward1670
import Grothe.UpperChaos.OriginalRow227TriangleForward1671
import Grothe.UpperChaos.OriginalRow227TriangleForward1672
import Grothe.UpperChaos.OriginalRow227TriangleForward1673
import Grothe.UpperChaos.OriginalRow227TriangleForward1674
import Grothe.UpperChaos.OriginalRow227TriangleForward1675

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1669 : OriginalRow227TriangleForward1669.entries.size = 32 := rfl

def entry1669 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1669.entries[i.val]'(by rw [size1669]; exact i.isLt)

theorem fields1669 (i : Fin 32) :
    (entry1669 i).IA = shift ∧ (entry1669 i).ID = S (142 + i.val + 1) ∧
      (entry1669 i).IC = S 143 ∧ (entry1669 i).Inext = T 142 (142 + i.val + 1) ∧
      (entry1669 i).Icur = T 142 (142 + i.val) ∧
      (entry1669 i).output = T 143 (142 + i.val) ∧
      (entry1669 i).charge = charge 142 (142 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root143).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root144).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1678_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1685_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1669 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (142 + i.val)) shift
      (S (142 + i.val + 1)) (S 143) (T 142 (142 + i.val + 1))
      (T 142 (142 + i.val)) (T 143 (142 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1669.entries OriginalRow227TriangleForward1669.checked
    ⟨i.val, by rw [size1669]; exact i.isLt⟩
  change (entry1669 i).check = true at h
  rcases fields1669 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1670 : OriginalRow227TriangleForward1670.entries.size = 32 := rfl

def entry1670 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1670.entries[i.val]'(by rw [size1670]; exact i.isLt)

theorem fields1670 (i : Fin 32) :
    (entry1670 i).IA = shift ∧ (entry1670 i).ID = S (174 + i.val + 1) ∧
      (entry1670 i).IC = S 143 ∧ (entry1670 i).Inext = T 142 (174 + i.val + 1) ∧
      (entry1670 i).Icur = T 142 (174 + i.val) ∧
      (entry1670 i).output = T 143 (174 + i.val) ∧
      (entry1670 i).charge = charge 142 (174 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1679_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1686_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1670 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (174 + i.val)) shift
      (S (174 + i.val + 1)) (S 143) (T 142 (174 + i.val + 1))
      (T 142 (174 + i.val)) (T 143 (174 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1670.entries OriginalRow227TriangleForward1670.checked
    ⟨i.val, by rw [size1670]; exact i.isLt⟩
  change (entry1670 i).check = true at h
  rcases fields1670 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1671 : OriginalRow227TriangleForward1671.entries.size = 32 := rfl

def entry1671 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1671.entries[i.val]'(by rw [size1671]; exact i.isLt)

theorem fields1671 (i : Fin 32) :
    (entry1671 i).IA = shift ∧ (entry1671 i).ID = S (206 + i.val + 1) ∧
      (entry1671 i).IC = S 143 ∧ (entry1671 i).Inext = T 142 (206 + i.val + 1) ∧
      (entry1671 i).Icur = T 142 (206 + i.val) ∧
      (entry1671 i).output = T 143 (206 + i.val) ∧
      (entry1671 i).charge = charge 142 (206 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1680_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1687_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1671 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (206 + i.val)) shift
      (S (206 + i.val + 1)) (S 143) (T 142 (206 + i.val + 1))
      (T 142 (206 + i.val)) (T 143 (206 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1671.entries OriginalRow227TriangleForward1671.checked
    ⟨i.val, by rw [size1671]; exact i.isLt⟩
  change (entry1671 i).check = true at h
  rcases fields1671 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1672 : OriginalRow227TriangleForward1672.entries.size = 32 := rfl

def entry1672 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1672.entries[i.val]'(by rw [size1672]; exact i.isLt)

theorem fields1672 (i : Fin 32) :
    (entry1672 i).IA = shift ∧ (entry1672 i).ID = S (238 + i.val + 1) ∧
      (entry1672 i).IC = S 143 ∧ (entry1672 i).Inext = T 142 (238 + i.val + 1) ∧
      (entry1672 i).Icur = T 142 (238 + i.val) ∧
      (entry1672 i).output = T 143 (238 + i.val) ∧
      (entry1672 i).charge = charge 142 (238 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1681_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1688_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1672 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (238 + i.val)) shift
      (S (238 + i.val + 1)) (S 143) (T 142 (238 + i.val + 1))
      (T 142 (238 + i.val)) (T 143 (238 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1672.entries OriginalRow227TriangleForward1672.checked
    ⟨i.val, by rw [size1672]; exact i.isLt⟩
  change (entry1672 i).check = true at h
  rcases fields1672 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1673 : OriginalRow227TriangleForward1673.entries.size = 32 := rfl

def entry1673 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1673.entries[i.val]'(by rw [size1673]; exact i.isLt)

theorem fields1673 (i : Fin 32) :
    (entry1673 i).IA = shift ∧ (entry1673 i).ID = S (270 + i.val + 1) ∧
      (entry1673 i).IC = S 143 ∧ (entry1673 i).Inext = T 142 (270 + i.val + 1) ∧
      (entry1673 i).Icur = T 142 (270 + i.val) ∧
      (entry1673 i).output = T 143 (270 + i.val) ∧
      (entry1673 i).charge = charge 142 (270 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1682_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1689_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1673 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (270 + i.val)) shift
      (S (270 + i.val + 1)) (S 143) (T 142 (270 + i.val + 1))
      (T 142 (270 + i.val)) (T 143 (270 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1673.entries OriginalRow227TriangleForward1673.checked
    ⟨i.val, by rw [size1673]; exact i.isLt⟩
  change (entry1673 i).check = true at h
  rcases fields1673 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1674 : OriginalRow227TriangleForward1674.entries.size = 32 := rfl

def entry1674 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1674.entries[i.val]'(by rw [size1674]; exact i.isLt)

theorem fields1674 (i : Fin 32) :
    (entry1674 i).IA = shift ∧ (entry1674 i).ID = S (302 + i.val + 1) ∧
      (entry1674 i).IC = S 143 ∧ (entry1674 i).Inext = T 142 (302 + i.val + 1) ∧
      (entry1674 i).Icur = T 142 (302 + i.val) ∧
      (entry1674 i).output = T 143 (302 + i.val) ∧
      (entry1674 i).charge = charge 142 (302 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1683_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1690_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1674 (i : Fin 32) :
    forwardStepOK (-768) (charge 142 (302 + i.val)) shift
      (S (302 + i.val + 1)) (S 143) (T 142 (302 + i.val + 1))
      (T 142 (302 + i.val)) (T 143 (302 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1674.entries OriginalRow227TriangleForward1674.checked
    ⟨i.val, by rw [size1674]; exact i.isLt⟩
  change (entry1674 i).check = true at h
  rcases fields1674 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1675 : OriginalRow227TriangleForward1675.entries.size = 25 := rfl

def entry1675 (i : Fin 25) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1675.entries[i.val]'(by rw [size1675]; exact i.isLt)

theorem fields1675 (i : Fin 25) :
    (entry1675 i).IA = shift ∧ (entry1675 i).ID = S (334 + i.val + 1) ∧
      (entry1675 i).IC = S 143 ∧ (entry1675 i).Inext = T 142 (334 + i.val + 1) ∧
      (entry1675 i).Icur = T 142 (334 + i.val) ∧
      (entry1675 i).output = T 143 (334 + i.val) ∧
      (entry1675 i).charge = charge 142 (334 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root358).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root359).symm, (OriginalRow227RootBindings04.S_eq_root143).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow142.block1684_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow143.block1691_value ⟨24, by decide⟩).symm, rfl⟩

theorem step1675 (i : Fin 25) :
    forwardStepOK (-768) (charge 142 (334 + i.val)) shift
      (S (334 + i.val + 1)) (S 143) (T 142 (334 + i.val + 1))
      (T 142 (334 + i.val)) (T 143 (334 + i.val))
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1675.entries OriginalRow227TriangleForward1675.checked
    ⟨i.val, by rw [size1675]; exact i.isLt⟩
  change (entry1675 i).check = true at h
  rcases fields1675 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 142 ≤ d) (hhi : d < 359) :
    forwardStepOK (-768) (charge 142 d) shift (S (d + 1)) (S 143)
      (T 142 (d + 1)) (T 142 d) (T 143 d)
      (OriginalRow227Roots.root_pos 143 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 142 (by decide)) = true := by
  by_cases h238 : d < 238
  ·
    by_cases h174 : d < 174
    ·
      have hi : d - 142 < 32 := by omega
      have heq : 142 + (d - 142) = d := by omega
      simpa only [heq] using step1669 ⟨d - 142, hi⟩
    ·
      by_cases h206 : d < 206
      ·
        have hi : d - 174 < 32 := by omega
        have heq : 174 + (d - 174) = d := by omega
        simpa only [heq] using step1670 ⟨d - 174, hi⟩
      ·
        have hi : d - 206 < 32 := by omega
        have heq : 206 + (d - 206) = d := by omega
        simpa only [heq] using step1671 ⟨d - 206, hi⟩
  ·
    by_cases h302 : d < 302
    ·
      by_cases h270 : d < 270
      ·
        have hi : d - 238 < 32 := by omega
        have heq : 238 + (d - 238) = d := by omega
        simpa only [heq] using step1672 ⟨d - 238, hi⟩
      ·
        have hi : d - 270 < 32 := by omega
        have heq : 270 + (d - 270) = d := by omega
        simpa only [heq] using step1673 ⟨d - 270, hi⟩
    ·
      by_cases h334 : d < 334
      ·
        have hi : d - 302 < 32 := by omega
        have heq : 302 + (d - 302) = d := by omega
        simpa only [heq] using step1674 ⟨d - 302, hi⟩
      ·
        have hi : d - 334 < 25 := by omega
        have heq : 334 + (d - 334) = d := by omega
        simpa only [heq] using step1675 ⟨d - 334, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1669,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1669,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1670,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1670,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1671,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1671,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1672,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1672,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1673,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1673,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1674,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1674,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.fields1675,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.step1675,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow143
