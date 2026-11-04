import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow155
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow156
import Grothe.UpperChaos.OriginalRow227TriangleForward1760
import Grothe.UpperChaos.OriginalRow227TriangleForward1761
import Grothe.UpperChaos.OriginalRow227TriangleForward1762
import Grothe.UpperChaos.OriginalRow227TriangleForward1763
import Grothe.UpperChaos.OriginalRow227TriangleForward1764
import Grothe.UpperChaos.OriginalRow227TriangleForward1765

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1760 : OriginalRow227TriangleForward1760.entries.size = 32 := rfl

def entry1760 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1760.entries[i.val]'(by rw [size1760]; exact i.isLt)

theorem fields1760 (i : Fin 32) :
    (entry1760 i).IA = shift ∧ (entry1760 i).ID = S (155 + i.val + 1) ∧
      (entry1760 i).IC = S 156 ∧ (entry1760 i).Inext = T 155 (155 + i.val + 1) ∧
      (entry1760 i).Icur = T 155 (155 + i.val) ∧
      (entry1760 i).output = T 156 (155 + i.val) ∧
      (entry1760 i).charge = charge 155 (155 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root156).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root157).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root158).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root159).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings04.S_eq_root160).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1769_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1776_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1760 (i : Fin 32) :
    forwardStepOK (-768) (charge 155 (155 + i.val)) shift
      (S (155 + i.val + 1)) (S 156) (T 155 (155 + i.val + 1))
      (T 155 (155 + i.val)) (T 156 (155 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1760.entries OriginalRow227TriangleForward1760.checked
    ⟨i.val, by rw [size1760]; exact i.isLt⟩
  change (entry1760 i).check = true at h
  rcases fields1760 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1761 : OriginalRow227TriangleForward1761.entries.size = 32 := rfl

def entry1761 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1761.entries[i.val]'(by rw [size1761]; exact i.isLt)

theorem fields1761 (i : Fin 32) :
    (entry1761 i).IA = shift ∧ (entry1761 i).ID = S (187 + i.val + 1) ∧
      (entry1761 i).IC = S 156 ∧ (entry1761 i).Inext = T 155 (187 + i.val + 1) ∧
      (entry1761 i).Icur = T 155 (187 + i.val) ∧
      (entry1761 i).output = T 156 (187 + i.val) ∧
      (entry1761 i).charge = charge 155 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1770_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1777_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1761 (i : Fin 32) :
    forwardStepOK (-768) (charge 155 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 156) (T 155 (187 + i.val + 1))
      (T 155 (187 + i.val)) (T 156 (187 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1761.entries OriginalRow227TriangleForward1761.checked
    ⟨i.val, by rw [size1761]; exact i.isLt⟩
  change (entry1761 i).check = true at h
  rcases fields1761 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1762 : OriginalRow227TriangleForward1762.entries.size = 32 := rfl

def entry1762 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1762.entries[i.val]'(by rw [size1762]; exact i.isLt)

theorem fields1762 (i : Fin 32) :
    (entry1762 i).IA = shift ∧ (entry1762 i).ID = S (219 + i.val + 1) ∧
      (entry1762 i).IC = S 156 ∧ (entry1762 i).Inext = T 155 (219 + i.val + 1) ∧
      (entry1762 i).Icur = T 155 (219 + i.val) ∧
      (entry1762 i).output = T 156 (219 + i.val) ∧
      (entry1762 i).charge = charge 155 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1771_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1778_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1762 (i : Fin 32) :
    forwardStepOK (-768) (charge 155 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 156) (T 155 (219 + i.val + 1))
      (T 155 (219 + i.val)) (T 156 (219 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1762.entries OriginalRow227TriangleForward1762.checked
    ⟨i.val, by rw [size1762]; exact i.isLt⟩
  change (entry1762 i).check = true at h
  rcases fields1762 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1763 : OriginalRow227TriangleForward1763.entries.size = 32 := rfl

def entry1763 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1763.entries[i.val]'(by rw [size1763]; exact i.isLt)

theorem fields1763 (i : Fin 32) :
    (entry1763 i).IA = shift ∧ (entry1763 i).ID = S (251 + i.val + 1) ∧
      (entry1763 i).IC = S 156 ∧ (entry1763 i).Inext = T 155 (251 + i.val + 1) ∧
      (entry1763 i).Icur = T 155 (251 + i.val) ∧
      (entry1763 i).output = T 156 (251 + i.val) ∧
      (entry1763 i).charge = charge 155 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1772_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1779_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1763 (i : Fin 32) :
    forwardStepOK (-768) (charge 155 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 156) (T 155 (251 + i.val + 1))
      (T 155 (251 + i.val)) (T 156 (251 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1763.entries OriginalRow227TriangleForward1763.checked
    ⟨i.val, by rw [size1763]; exact i.isLt⟩
  change (entry1763 i).check = true at h
  rcases fields1763 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1764 : OriginalRow227TriangleForward1764.entries.size = 32 := rfl

def entry1764 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1764.entries[i.val]'(by rw [size1764]; exact i.isLt)

theorem fields1764 (i : Fin 32) :
    (entry1764 i).IA = shift ∧ (entry1764 i).ID = S (283 + i.val + 1) ∧
      (entry1764 i).IC = S 156 ∧ (entry1764 i).Inext = T 155 (283 + i.val + 1) ∧
      (entry1764 i).Icur = T 155 (283 + i.val) ∧
      (entry1764 i).output = T 156 (283 + i.val) ∧
      (entry1764 i).charge = charge 155 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1773_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1780_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1764 (i : Fin 32) :
    forwardStepOK (-768) (charge 155 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 156) (T 155 (283 + i.val + 1))
      (T 155 (283 + i.val)) (T 156 (283 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1764.entries OriginalRow227TriangleForward1764.checked
    ⟨i.val, by rw [size1764]; exact i.isLt⟩
  change (entry1764 i).check = true at h
  rcases fields1764 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1765 : OriginalRow227TriangleForward1765.entries.size = 31 := rfl

def entry1765 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1765.entries[i.val]'(by rw [size1765]; exact i.isLt)

theorem fields1765 (i : Fin 31) :
    (entry1765 i).IA = shift ∧ (entry1765 i).ID = S (315 + i.val + 1) ∧
      (entry1765 i).IC = S 156 ∧ (entry1765 i).Inext = T 155 (315 + i.val + 1) ∧
      (entry1765 i).Icur = T 155 (315 + i.val) ∧
      (entry1765 i).output = T 156 (315 + i.val) ∧
      (entry1765 i).charge = charge 155 (315 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root342).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root343).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root344).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root345).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root346).symm, (OriginalRow227RootBindings04.S_eq_root156).symm,
      (OriginalRow227TriangleBindingsRow155.block1775_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow155.block1774_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow156.block1781_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1765 (i : Fin 31) :
    forwardStepOK (-768) (charge 155 (315 + i.val)) shift
      (S (315 + i.val + 1)) (S 156) (T 155 (315 + i.val + 1))
      (T 155 (315 + i.val)) (T 156 (315 + i.val))
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1765.entries OriginalRow227TriangleForward1765.checked
    ⟨i.val, by rw [size1765]; exact i.isLt⟩
  change (entry1765 i).check = true at h
  rcases fields1765 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 155 ≤ d) (hhi : d < 346) :
    forwardStepOK (-768) (charge 155 d) shift (S (d + 1)) (S 156)
      (T 155 (d + 1)) (T 155 d) (T 156 d)
      (OriginalRow227Roots.root_pos 156 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 155 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h187 : d < 187
    ·
      have hi : d - 155 < 32 := by omega
      have heq : 155 + (d - 155) = d := by omega
      simpa only [heq] using step1760 ⟨d - 155, hi⟩
    ·
      by_cases h219 : d < 219
      ·
        have hi : d - 187 < 32 := by omega
        have heq : 187 + (d - 187) = d := by omega
        simpa only [heq] using step1761 ⟨d - 187, hi⟩
      ·
        have hi : d - 219 < 32 := by omega
        have heq : 219 + (d - 219) = d := by omega
        simpa only [heq] using step1762 ⟨d - 219, hi⟩
  ·
    by_cases h283 : d < 283
    ·
      have hi : d - 251 < 32 := by omega
      have heq : 251 + (d - 251) = d := by omega
      simpa only [heq] using step1763 ⟨d - 251, hi⟩
    ·
      by_cases h315 : d < 315
      ·
        have hi : d - 283 < 32 := by omega
        have heq : 283 + (d - 283) = d := by omega
        simpa only [heq] using step1764 ⟨d - 283, hi⟩
      ·
        have hi : d - 315 < 31 := by omega
        have heq : 315 + (d - 315) = d := by omega
        simpa only [heq] using step1765 ⟨d - 315, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1760,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1760,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1761,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1761,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1762,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1762,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1763,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1763,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1764,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1764,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.fields1765,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.step1765,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow156
