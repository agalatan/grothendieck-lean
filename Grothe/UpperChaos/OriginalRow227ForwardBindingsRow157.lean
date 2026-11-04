import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow157
import Grothe.UpperChaos.OriginalRow227TriangleForward1766
import Grothe.UpperChaos.OriginalRow227TriangleForward1767
import Grothe.UpperChaos.OriginalRow227TriangleForward1768
import Grothe.UpperChaos.OriginalRow227TriangleForward1769
import Grothe.UpperChaos.OriginalRow227TriangleForward1770
import Grothe.UpperChaos.OriginalRow227TriangleForward1771

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1766 : OriginalRow227TriangleForward1766.entries.size = 32 := rfl

def entry1766 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1766.entries[i.val]'(by rw [size1766]; exact i.isLt)

theorem fields1766 (i : Fin 32) :
    (entry1766 i).IA = shift ∧ (entry1766 i).ID = S (156 + i.val + 1) ∧
      (entry1766 i).IC = S 157 ∧ (entry1766 i).Inext = T 156 (156 + i.val + 1) ∧
      (entry1766 i).Icur = T 156 (156 + i.val) ∧
      (entry1766 i).output = T 157 (156 + i.val) ∧
      (entry1766 i).charge = charge 156 (156 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1782_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1766 (i : Fin 32) :
    forwardStepOK (-768) (charge 156 (156 + i.val)) shift
      (S (156 + i.val + 1)) (S 157) (T 156 (156 + i.val + 1))
      (T 156 (156 + i.val)) (T 157 (156 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1766.entries OriginalRow227TriangleForward1766.checked
    ⟨i.val, by rw [size1766]; exact i.isLt⟩
  change (entry1766 i).check = true at h
  rcases fields1766 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1767 : OriginalRow227TriangleForward1767.entries.size = 32 := rfl

def entry1767 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1767.entries[i.val]'(by rw [size1767]; exact i.isLt)

theorem fields1767 (i : Fin 32) :
    (entry1767 i).IA = shift ∧ (entry1767 i).ID = S (188 + i.val + 1) ∧
      (entry1767 i).IC = S 157 ∧ (entry1767 i).Inext = T 156 (188 + i.val + 1) ∧
      (entry1767 i).Icur = T 156 (188 + i.val) ∧
      (entry1767 i).output = T 157 (188 + i.val) ∧
      (entry1767 i).charge = charge 156 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1783_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1767 (i : Fin 32) :
    forwardStepOK (-768) (charge 156 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 157) (T 156 (188 + i.val + 1))
      (T 156 (188 + i.val)) (T 157 (188 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1767.entries OriginalRow227TriangleForward1767.checked
    ⟨i.val, by rw [size1767]; exact i.isLt⟩
  change (entry1767 i).check = true at h
  rcases fields1767 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1768 : OriginalRow227TriangleForward1768.entries.size = 32 := rfl

def entry1768 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1768.entries[i.val]'(by rw [size1768]; exact i.isLt)

theorem fields1768 (i : Fin 32) :
    (entry1768 i).IA = shift ∧ (entry1768 i).ID = S (220 + i.val + 1) ∧
      (entry1768 i).IC = S 157 ∧ (entry1768 i).Inext = T 156 (220 + i.val + 1) ∧
      (entry1768 i).Icur = T 156 (220 + i.val) ∧
      (entry1768 i).output = T 157 (220 + i.val) ∧
      (entry1768 i).charge = charge 156 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1784_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1768 (i : Fin 32) :
    forwardStepOK (-768) (charge 156 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 157) (T 156 (220 + i.val + 1))
      (T 156 (220 + i.val)) (T 157 (220 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1768.entries OriginalRow227TriangleForward1768.checked
    ⟨i.val, by rw [size1768]; exact i.isLt⟩
  change (entry1768 i).check = true at h
  rcases fields1768 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1769 : OriginalRow227TriangleForward1769.entries.size = 32 := rfl

def entry1769 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1769.entries[i.val]'(by rw [size1769]; exact i.isLt)

theorem fields1769 (i : Fin 32) :
    (entry1769 i).IA = shift ∧ (entry1769 i).ID = S (252 + i.val + 1) ∧
      (entry1769 i).IC = S 157 ∧ (entry1769 i).Inext = T 156 (252 + i.val + 1) ∧
      (entry1769 i).Icur = T 156 (252 + i.val) ∧
      (entry1769 i).output = T 157 (252 + i.val) ∧
      (entry1769 i).charge = charge 156 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1785_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1769 (i : Fin 32) :
    forwardStepOK (-768) (charge 156 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 157) (T 156 (252 + i.val + 1))
      (T 156 (252 + i.val)) (T 157 (252 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1769.entries OriginalRow227TriangleForward1769.checked
    ⟨i.val, by rw [size1769]; exact i.isLt⟩
  change (entry1769 i).check = true at h
  rcases fields1769 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1770 : OriginalRow227TriangleForward1770.entries.size = 32 := rfl

def entry1770 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1770.entries[i.val]'(by rw [size1770]; exact i.isLt)

theorem fields1770 (i : Fin 32) :
    (entry1770 i).IA = shift ∧ (entry1770 i).ID = S (284 + i.val + 1) ∧
      (entry1770 i).IC = S 157 ∧ (entry1770 i).Inext = T 156 (284 + i.val + 1) ∧
      (entry1770 i).Icur = T 156 (284 + i.val) ∧
      (entry1770 i).output = T 157 (284 + i.val) ∧
      (entry1770 i).charge = charge 156 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1786_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1770 (i : Fin 32) :
    forwardStepOK (-768) (charge 156 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 157) (T 156 (284 + i.val + 1))
      (T 156 (284 + i.val)) (T 157 (284 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1770.entries OriginalRow227TriangleForward1770.checked
    ⟨i.val, by rw [size1770]; exact i.isLt⟩
  change (entry1770 i).check = true at h
  rcases fields1770 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1771 : OriginalRow227TriangleForward1771.entries.size = 29 := rfl

def entry1771 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1771.entries[i.val]'(by rw [size1771]; exact i.isLt)

theorem fields1771 (i : Fin 29) :
    (entry1771 i).IA = shift ∧ (entry1771 i).ID = S (316 + i.val + 1) ∧
      (entry1771 i).IC = S 157 ∧ (entry1771 i).Inext = T 156 (316 + i.val + 1) ∧
      (entry1771 i).Icur = T 156 (316 + i.val) ∧
      (entry1771 i).output = T 157 (316 + i.val) ∧
      (entry1771 i).charge = charge 156 (316 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root157).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow157.block1787_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1771 (i : Fin 29) :
    forwardStepOK (-768) (charge 156 (316 + i.val)) shift
      (S (316 + i.val + 1)) (S 157) (T 156 (316 + i.val + 1))
      (T 156 (316 + i.val)) (T 157 (316 + i.val))
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1771.entries OriginalRow227TriangleForward1771.checked
    ⟨i.val, by rw [size1771]; exact i.isLt⟩
  change (entry1771 i).check = true at h
  rcases fields1771 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 156 ≤ d) (hhi : d < 345) :
    forwardStepOK (-768) (charge 156 d) shift (S (d + 1)) (S 157)
      (T 156 (d + 1)) (T 156 d) (T 157 d)
      (OriginalRow227Roots.root_pos 157 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 156 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h188 : d < 188
    ·
      have hi : d - 156 < 32 := by omega
      have heq : 156 + (d - 156) = d := by omega
      simpa only [heq] using step1766 ⟨d - 156, hi⟩
    ·
      by_cases h220 : d < 220
      ·
        have hi : d - 188 < 32 := by omega
        have heq : 188 + (d - 188) = d := by omega
        simpa only [heq] using step1767 ⟨d - 188, hi⟩
      ·
        have hi : d - 220 < 32 := by omega
        have heq : 220 + (d - 220) = d := by omega
        simpa only [heq] using step1768 ⟨d - 220, hi⟩
  ·
    by_cases h284 : d < 284
    ·
      have hi : d - 252 < 32 := by omega
      have heq : 252 + (d - 252) = d := by omega
      simpa only [heq] using step1769 ⟨d - 252, hi⟩
    ·
      by_cases h316 : d < 316
      ·
        have hi : d - 284 < 32 := by omega
        have heq : 284 + (d - 284) = d := by omega
        simpa only [heq] using step1770 ⟨d - 284, hi⟩
      ·
        have hi : d - 316 < 29 := by omega
        have heq : 316 + (d - 316) = d := by omega
        simpa only [heq] using step1771 ⟨d - 316, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1766,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1766,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1767,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1767,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1768,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1768,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1769,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1769,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1770,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1770,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.fields1771,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.step1771,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow157
