import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow144
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145
import Grothe.UpperChaos.OriginalRow227TriangleForward1683
import Grothe.UpperChaos.OriginalRow227TriangleForward1684
import Grothe.UpperChaos.OriginalRow227TriangleForward1685
import Grothe.UpperChaos.OriginalRow227TriangleForward1686
import Grothe.UpperChaos.OriginalRow227TriangleForward1687
import Grothe.UpperChaos.OriginalRow227TriangleForward1688
import Grothe.UpperChaos.OriginalRow227TriangleForward1689

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1683 : OriginalRow227TriangleForward1683.entries.size = 32 := rfl

def entry1683 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1683.entries[i.val]'(by rw [size1683]; exact i.isLt)

theorem fields1683 (i : Fin 32) :
    (entry1683 i).IA = shift ∧ (entry1683 i).ID = S (144 + i.val + 1) ∧
      (entry1683 i).IC = S 145 ∧ (entry1683 i).Inext = T 144 (144 + i.val + 1) ∧
      (entry1683 i).Icur = T 144 (144 + i.val) ∧
      (entry1683 i).output = T 145 (144 + i.val) ∧
      (entry1683 i).charge = charge 144 (144 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root145).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1692_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1683 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (144 + i.val)) shift
      (S (144 + i.val + 1)) (S 145) (T 144 (144 + i.val + 1))
      (T 144 (144 + i.val)) (T 145 (144 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1683.entries OriginalRow227TriangleForward1683.checked
    ⟨i.val, by rw [size1683]; exact i.isLt⟩
  change (entry1683 i).check = true at h
  rcases fields1683 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1684 : OriginalRow227TriangleForward1684.entries.size = 32 := rfl

def entry1684 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1684.entries[i.val]'(by rw [size1684]; exact i.isLt)

theorem fields1684 (i : Fin 32) :
    (entry1684 i).IA = shift ∧ (entry1684 i).ID = S (176 + i.val + 1) ∧
      (entry1684 i).IC = S 145 ∧ (entry1684 i).Inext = T 144 (176 + i.val + 1) ∧
      (entry1684 i).Icur = T 144 (176 + i.val) ∧
      (entry1684 i).output = T 145 (176 + i.val) ∧
      (entry1684 i).charge = charge 144 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1693_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1684 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 145) (T 144 (176 + i.val + 1))
      (T 144 (176 + i.val)) (T 145 (176 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1684.entries OriginalRow227TriangleForward1684.checked
    ⟨i.val, by rw [size1684]; exact i.isLt⟩
  change (entry1684 i).check = true at h
  rcases fields1684 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1685 : OriginalRow227TriangleForward1685.entries.size = 32 := rfl

def entry1685 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1685.entries[i.val]'(by rw [size1685]; exact i.isLt)

theorem fields1685 (i : Fin 32) :
    (entry1685 i).IA = shift ∧ (entry1685 i).ID = S (208 + i.val + 1) ∧
      (entry1685 i).IC = S 145 ∧ (entry1685 i).Inext = T 144 (208 + i.val + 1) ∧
      (entry1685 i).Icur = T 144 (208 + i.val) ∧
      (entry1685 i).output = T 145 (208 + i.val) ∧
      (entry1685 i).charge = charge 144 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1694_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1685 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 145) (T 144 (208 + i.val + 1))
      (T 144 (208 + i.val)) (T 145 (208 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1685.entries OriginalRow227TriangleForward1685.checked
    ⟨i.val, by rw [size1685]; exact i.isLt⟩
  change (entry1685 i).check = true at h
  rcases fields1685 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1686 : OriginalRow227TriangleForward1686.entries.size = 32 := rfl

def entry1686 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1686.entries[i.val]'(by rw [size1686]; exact i.isLt)

theorem fields1686 (i : Fin 32) :
    (entry1686 i).IA = shift ∧ (entry1686 i).ID = S (240 + i.val + 1) ∧
      (entry1686 i).IC = S 145 ∧ (entry1686 i).Inext = T 144 (240 + i.val + 1) ∧
      (entry1686 i).Icur = T 144 (240 + i.val) ∧
      (entry1686 i).output = T 145 (240 + i.val) ∧
      (entry1686 i).charge = charge 144 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1695_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1686 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 145) (T 144 (240 + i.val + 1))
      (T 144 (240 + i.val)) (T 145 (240 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1686.entries OriginalRow227TriangleForward1686.checked
    ⟨i.val, by rw [size1686]; exact i.isLt⟩
  change (entry1686 i).check = true at h
  rcases fields1686 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1687 : OriginalRow227TriangleForward1687.entries.size = 32 := rfl

def entry1687 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1687.entries[i.val]'(by rw [size1687]; exact i.isLt)

theorem fields1687 (i : Fin 32) :
    (entry1687 i).IA = shift ∧ (entry1687 i).ID = S (272 + i.val + 1) ∧
      (entry1687 i).IC = S 145 ∧ (entry1687 i).Inext = T 144 (272 + i.val + 1) ∧
      (entry1687 i).Icur = T 144 (272 + i.val) ∧
      (entry1687 i).output = T 145 (272 + i.val) ∧
      (entry1687 i).charge = charge 144 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1696_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1687 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 145) (T 144 (272 + i.val + 1))
      (T 144 (272 + i.val)) (T 145 (272 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1687.entries OriginalRow227TriangleForward1687.checked
    ⟨i.val, by rw [size1687]; exact i.isLt⟩
  change (entry1687 i).check = true at h
  rcases fields1687 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1688 : OriginalRow227TriangleForward1688.entries.size = 32 := rfl

def entry1688 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1688.entries[i.val]'(by rw [size1688]; exact i.isLt)

theorem fields1688 (i : Fin 32) :
    (entry1688 i).IA = shift ∧ (entry1688 i).ID = S (304 + i.val + 1) ∧
      (entry1688 i).IC = S 145 ∧ (entry1688 i).Inext = T 144 (304 + i.val + 1) ∧
      (entry1688 i).Icur = T 144 (304 + i.val) ∧
      (entry1688 i).output = T 145 (304 + i.val) ∧
      (entry1688 i).charge = charge 144 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1697_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1688 (i : Fin 32) :
    forwardStepOK (-768) (charge 144 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 145) (T 144 (304 + i.val + 1))
      (T 144 (304 + i.val)) (T 145 (304 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1688.entries OriginalRow227TriangleForward1688.checked
    ⟨i.val, by rw [size1688]; exact i.isLt⟩
  change (entry1688 i).check = true at h
  rcases fields1688 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1689 : OriginalRow227TriangleForward1689.entries.size = 21 := rfl

def entry1689 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1689.entries[i.val]'(by rw [size1689]; exact i.isLt)

theorem fields1689 (i : Fin 21) :
    (entry1689 i).IA = shift ∧ (entry1689 i).ID = S (336 + i.val + 1) ∧
      (entry1689 i).IC = S 145 ∧ (entry1689 i).Inext = T 144 (336 + i.val + 1) ∧
      (entry1689 i).Icur = T 144 (336 + i.val) ∧
      (entry1689 i).output = T 145 (336 + i.val) ∧
      (entry1689 i).charge = charge 144 (336 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root357).symm, (OriginalRow227RootBindings04.S_eq_root145).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow144.block1698_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1689 (i : Fin 21) :
    forwardStepOK (-768) (charge 144 (336 + i.val)) shift
      (S (336 + i.val + 1)) (S 145) (T 144 (336 + i.val + 1))
      (T 144 (336 + i.val)) (T 145 (336 + i.val))
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1689.entries OriginalRow227TriangleForward1689.checked
    ⟨i.val, by rw [size1689]; exact i.isLt⟩
  change (entry1689 i).check = true at h
  rcases fields1689 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 144 ≤ d) (hhi : d < 357) :
    forwardStepOK (-768) (charge 144 d) shift (S (d + 1)) (S 145)
      (T 144 (d + 1)) (T 144 d) (T 145 d)
      (OriginalRow227Roots.root_pos 145 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 144 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h176 : d < 176
    ·
      have hi : d - 144 < 32 := by omega
      have heq : 144 + (d - 144) = d := by omega
      simpa only [heq] using step1683 ⟨d - 144, hi⟩
    ·
      by_cases h208 : d < 208
      ·
        have hi : d - 176 < 32 := by omega
        have heq : 176 + (d - 176) = d := by omega
        simpa only [heq] using step1684 ⟨d - 176, hi⟩
      ·
        have hi : d - 208 < 32 := by omega
        have heq : 208 + (d - 208) = d := by omega
        simpa only [heq] using step1685 ⟨d - 208, hi⟩
  ·
    by_cases h304 : d < 304
    ·
      by_cases h272 : d < 272
      ·
        have hi : d - 240 < 32 := by omega
        have heq : 240 + (d - 240) = d := by omega
        simpa only [heq] using step1686 ⟨d - 240, hi⟩
      ·
        have hi : d - 272 < 32 := by omega
        have heq : 272 + (d - 272) = d := by omega
        simpa only [heq] using step1687 ⟨d - 272, hi⟩
    ·
      by_cases h336 : d < 336
      ·
        have hi : d - 304 < 32 := by omega
        have heq : 304 + (d - 304) = d := by omega
        simpa only [heq] using step1688 ⟨d - 304, hi⟩
      ·
        have hi : d - 336 < 21 := by omega
        have heq : 336 + (d - 336) = d := by omega
        simpa only [heq] using step1689 ⟨d - 336, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1683,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1683,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1684,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1684,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1685,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1685,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1686,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1686,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1687,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1687,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1688,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1688,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.fields1689,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.step1689,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow145
