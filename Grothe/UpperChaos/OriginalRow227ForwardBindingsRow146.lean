import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow145
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow146
import Grothe.UpperChaos.OriginalRow227TriangleForward1690
import Grothe.UpperChaos.OriginalRow227TriangleForward1691
import Grothe.UpperChaos.OriginalRow227TriangleForward1692
import Grothe.UpperChaos.OriginalRow227TriangleForward1693
import Grothe.UpperChaos.OriginalRow227TriangleForward1694
import Grothe.UpperChaos.OriginalRow227TriangleForward1695
import Grothe.UpperChaos.OriginalRow227TriangleForward1696

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1690 : OriginalRow227TriangleForward1690.entries.size = 32 := rfl

def entry1690 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1690.entries[i.val]'(by rw [size1690]; exact i.isLt)

theorem fields1690 (i : Fin 32) :
    (entry1690 i).IA = shift ∧ (entry1690 i).ID = S (145 + i.val + 1) ∧
      (entry1690 i).IC = S 146 ∧ (entry1690 i).Inext = T 145 (145 + i.val + 1) ∧
      (entry1690 i).Icur = T 145 (145 + i.val) ∧
      (entry1690 i).output = T 146 (145 + i.val) ∧
      (entry1690 i).charge = charge 145 (145 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root146).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root147).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root148).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root149).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root150).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root151).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root152).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root153).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root154).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root155).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1699_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1706_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1690 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (145 + i.val)) shift
      (S (145 + i.val + 1)) (S 146) (T 145 (145 + i.val + 1))
      (T 145 (145 + i.val)) (T 146 (145 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1690.entries OriginalRow227TriangleForward1690.checked
    ⟨i.val, by rw [size1690]; exact i.isLt⟩
  change (entry1690 i).check = true at h
  rcases fields1690 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1691 : OriginalRow227TriangleForward1691.entries.size = 32 := rfl

def entry1691 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1691.entries[i.val]'(by rw [size1691]; exact i.isLt)

theorem fields1691 (i : Fin 32) :
    (entry1691 i).IA = shift ∧ (entry1691 i).ID = S (177 + i.val + 1) ∧
      (entry1691 i).IC = S 146 ∧ (entry1691 i).Inext = T 145 (177 + i.val + 1) ∧
      (entry1691 i).Icur = T 145 (177 + i.val) ∧
      (entry1691 i).output = T 146 (177 + i.val) ∧
      (entry1691 i).charge = charge 145 (177 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1700_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1707_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1691 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (177 + i.val)) shift
      (S (177 + i.val + 1)) (S 146) (T 145 (177 + i.val + 1))
      (T 145 (177 + i.val)) (T 146 (177 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1691.entries OriginalRow227TriangleForward1691.checked
    ⟨i.val, by rw [size1691]; exact i.isLt⟩
  change (entry1691 i).check = true at h
  rcases fields1691 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1692 : OriginalRow227TriangleForward1692.entries.size = 32 := rfl

def entry1692 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1692.entries[i.val]'(by rw [size1692]; exact i.isLt)

theorem fields1692 (i : Fin 32) :
    (entry1692 i).IA = shift ∧ (entry1692 i).ID = S (209 + i.val + 1) ∧
      (entry1692 i).IC = S 146 ∧ (entry1692 i).Inext = T 145 (209 + i.val + 1) ∧
      (entry1692 i).Icur = T 145 (209 + i.val) ∧
      (entry1692 i).output = T 146 (209 + i.val) ∧
      (entry1692 i).charge = charge 145 (209 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1701_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1708_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1692 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (209 + i.val)) shift
      (S (209 + i.val + 1)) (S 146) (T 145 (209 + i.val + 1))
      (T 145 (209 + i.val)) (T 146 (209 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1692.entries OriginalRow227TriangleForward1692.checked
    ⟨i.val, by rw [size1692]; exact i.isLt⟩
  change (entry1692 i).check = true at h
  rcases fields1692 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1693 : OriginalRow227TriangleForward1693.entries.size = 32 := rfl

def entry1693 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1693.entries[i.val]'(by rw [size1693]; exact i.isLt)

theorem fields1693 (i : Fin 32) :
    (entry1693 i).IA = shift ∧ (entry1693 i).ID = S (241 + i.val + 1) ∧
      (entry1693 i).IC = S 146 ∧ (entry1693 i).Inext = T 145 (241 + i.val + 1) ∧
      (entry1693 i).Icur = T 145 (241 + i.val) ∧
      (entry1693 i).output = T 146 (241 + i.val) ∧
      (entry1693 i).charge = charge 145 (241 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1702_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1709_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1693 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (241 + i.val)) shift
      (S (241 + i.val + 1)) (S 146) (T 145 (241 + i.val + 1))
      (T 145 (241 + i.val)) (T 146 (241 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1693.entries OriginalRow227TriangleForward1693.checked
    ⟨i.val, by rw [size1693]; exact i.isLt⟩
  change (entry1693 i).check = true at h
  rcases fields1693 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1694 : OriginalRow227TriangleForward1694.entries.size = 32 := rfl

def entry1694 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1694.entries[i.val]'(by rw [size1694]; exact i.isLt)

theorem fields1694 (i : Fin 32) :
    (entry1694 i).IA = shift ∧ (entry1694 i).ID = S (273 + i.val + 1) ∧
      (entry1694 i).IC = S 146 ∧ (entry1694 i).Inext = T 145 (273 + i.val + 1) ∧
      (entry1694 i).Icur = T 145 (273 + i.val) ∧
      (entry1694 i).output = T 146 (273 + i.val) ∧
      (entry1694 i).charge = charge 145 (273 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1703_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1710_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1694 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (273 + i.val)) shift
      (S (273 + i.val + 1)) (S 146) (T 145 (273 + i.val + 1))
      (T 145 (273 + i.val)) (T 146 (273 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1694.entries OriginalRow227TriangleForward1694.checked
    ⟨i.val, by rw [size1694]; exact i.isLt⟩
  change (entry1694 i).check = true at h
  rcases fields1694 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1695 : OriginalRow227TriangleForward1695.entries.size = 32 := rfl

def entry1695 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1695.entries[i.val]'(by rw [size1695]; exact i.isLt)

theorem fields1695 (i : Fin 32) :
    (entry1695 i).IA = shift ∧ (entry1695 i).ID = S (305 + i.val + 1) ∧
      (entry1695 i).IC = S 146 ∧ (entry1695 i).Inext = T 145 (305 + i.val + 1) ∧
      (entry1695 i).Icur = T 145 (305 + i.val) ∧
      (entry1695 i).output = T 146 (305 + i.val) ∧
      (entry1695 i).charge = charge 145 (305 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1704_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1711_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1695 (i : Fin 32) :
    forwardStepOK (-768) (charge 145 (305 + i.val)) shift
      (S (305 + i.val + 1)) (S 146) (T 145 (305 + i.val + 1))
      (T 145 (305 + i.val)) (T 146 (305 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1695.entries OriginalRow227TriangleForward1695.checked
    ⟨i.val, by rw [size1695]; exact i.isLt⟩
  change (entry1695 i).check = true at h
  rcases fields1695 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1696 : OriginalRow227TriangleForward1696.entries.size = 19 := rfl

def entry1696 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1696.entries[i.val]'(by rw [size1696]; exact i.isLt)

theorem fields1696 (i : Fin 19) :
    (entry1696 i).IA = shift ∧ (entry1696 i).ID = S (337 + i.val + 1) ∧
      (entry1696 i).IC = S 146 ∧ (entry1696 i).Inext = T 145 (337 + i.val + 1) ∧
      (entry1696 i).Icur = T 145 (337 + i.val) ∧
      (entry1696 i).output = T 146 (337 + i.val) ∧
      (entry1696 i).charge = charge 145 (337 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root347).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root348).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root349).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root350).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root351).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root352).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root353).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root354).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root355).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings11.S_eq_root356).symm, (OriginalRow227RootBindings04.S_eq_root146).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow145.block1705_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow146.block1712_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1696 (i : Fin 19) :
    forwardStepOK (-768) (charge 145 (337 + i.val)) shift
      (S (337 + i.val + 1)) (S 146) (T 145 (337 + i.val + 1))
      (T 145 (337 + i.val)) (T 146 (337 + i.val))
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1696.entries OriginalRow227TriangleForward1696.checked
    ⟨i.val, by rw [size1696]; exact i.isLt⟩
  change (entry1696 i).check = true at h
  rcases fields1696 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 145 ≤ d) (hhi : d < 356) :
    forwardStepOK (-768) (charge 145 d) shift (S (d + 1)) (S 146)
      (T 145 (d + 1)) (T 145 d) (T 146 d)
      (OriginalRow227Roots.root_pos 146 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 145 (by decide)) = true := by
  by_cases h241 : d < 241
  ·
    by_cases h177 : d < 177
    ·
      have hi : d - 145 < 32 := by omega
      have heq : 145 + (d - 145) = d := by omega
      simpa only [heq] using step1690 ⟨d - 145, hi⟩
    ·
      by_cases h209 : d < 209
      ·
        have hi : d - 177 < 32 := by omega
        have heq : 177 + (d - 177) = d := by omega
        simpa only [heq] using step1691 ⟨d - 177, hi⟩
      ·
        have hi : d - 209 < 32 := by omega
        have heq : 209 + (d - 209) = d := by omega
        simpa only [heq] using step1692 ⟨d - 209, hi⟩
  ·
    by_cases h305 : d < 305
    ·
      by_cases h273 : d < 273
      ·
        have hi : d - 241 < 32 := by omega
        have heq : 241 + (d - 241) = d := by omega
        simpa only [heq] using step1693 ⟨d - 241, hi⟩
      ·
        have hi : d - 273 < 32 := by omega
        have heq : 273 + (d - 273) = d := by omega
        simpa only [heq] using step1694 ⟨d - 273, hi⟩
    ·
      by_cases h337 : d < 337
      ·
        have hi : d - 305 < 32 := by omega
        have heq : 305 + (d - 305) = d := by omega
        simpa only [heq] using step1695 ⟨d - 305, hi⟩
      ·
        have hi : d - 337 < 19 := by omega
        have heq : 337 + (d - 337) = d := by omega
        simpa only [heq] using step1696 ⟨d - 337, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1690,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1690,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1691,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1691,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1692,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1692,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1693,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1693,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1694,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1694,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1695,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1695,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.fields1696,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.step1696,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow146
