import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163
import Grothe.UpperChaos.OriginalRow227TriangleForward1802
import Grothe.UpperChaos.OriginalRow227TriangleForward1803
import Grothe.UpperChaos.OriginalRow227TriangleForward1804
import Grothe.UpperChaos.OriginalRow227TriangleForward1805
import Grothe.UpperChaos.OriginalRow227TriangleForward1806
import Grothe.UpperChaos.OriginalRow227TriangleForward1807

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1802 : OriginalRow227TriangleForward1802.entries.size = 32 := rfl

def entry1802 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1802.entries[i.val]'(by rw [size1802]; exact i.isLt)

theorem fields1802 (i : Fin 32) :
    (entry1802 i).IA = shift ∧ (entry1802 i).ID = S (162 + i.val + 1) ∧
      (entry1802 i).IC = S 163 ∧ (entry1802 i).Inext = T 162 (162 + i.val + 1) ∧
      (entry1802 i).Icur = T 162 (162 + i.val) ∧
      (entry1802 i).output = T 163 (162 + i.val) ∧
      (entry1802 i).charge = charge 162 (162 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1802 (i : Fin 32) :
    forwardStepOK (-768) (charge 162 (162 + i.val)) shift
      (S (162 + i.val + 1)) (S 163) (T 162 (162 + i.val + 1))
      (T 162 (162 + i.val)) (T 163 (162 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1802.entries OriginalRow227TriangleForward1802.checked
    ⟨i.val, by rw [size1802]; exact i.isLt⟩
  change (entry1802 i).check = true at h
  rcases fields1802 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1803 : OriginalRow227TriangleForward1803.entries.size = 32 := rfl

def entry1803 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1803.entries[i.val]'(by rw [size1803]; exact i.isLt)

theorem fields1803 (i : Fin 32) :
    (entry1803 i).IA = shift ∧ (entry1803 i).ID = S (194 + i.val + 1) ∧
      (entry1803 i).IC = S 163 ∧ (entry1803 i).Inext = T 162 (194 + i.val + 1) ∧
      (entry1803 i).Icur = T 162 (194 + i.val) ∧
      (entry1803 i).output = T 163 (194 + i.val) ∧
      (entry1803 i).charge = charge 162 (194 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1803 (i : Fin 32) :
    forwardStepOK (-768) (charge 162 (194 + i.val)) shift
      (S (194 + i.val + 1)) (S 163) (T 162 (194 + i.val + 1))
      (T 162 (194 + i.val)) (T 163 (194 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1803.entries OriginalRow227TriangleForward1803.checked
    ⟨i.val, by rw [size1803]; exact i.isLt⟩
  change (entry1803 i).check = true at h
  rcases fields1803 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1804 : OriginalRow227TriangleForward1804.entries.size = 32 := rfl

def entry1804 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1804.entries[i.val]'(by rw [size1804]; exact i.isLt)

theorem fields1804 (i : Fin 32) :
    (entry1804 i).IA = shift ∧ (entry1804 i).ID = S (226 + i.val + 1) ∧
      (entry1804 i).IC = S 163 ∧ (entry1804 i).Inext = T 162 (226 + i.val + 1) ∧
      (entry1804 i).Icur = T 162 (226 + i.val) ∧
      (entry1804 i).output = T 163 (226 + i.val) ∧
      (entry1804 i).charge = charge 162 (226 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1804 (i : Fin 32) :
    forwardStepOK (-768) (charge 162 (226 + i.val)) shift
      (S (226 + i.val + 1)) (S 163) (T 162 (226 + i.val + 1))
      (T 162 (226 + i.val)) (T 163 (226 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1804.entries OriginalRow227TriangleForward1804.checked
    ⟨i.val, by rw [size1804]; exact i.isLt⟩
  change (entry1804 i).check = true at h
  rcases fields1804 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1805 : OriginalRow227TriangleForward1805.entries.size = 32 := rfl

def entry1805 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1805.entries[i.val]'(by rw [size1805]; exact i.isLt)

theorem fields1805 (i : Fin 32) :
    (entry1805 i).IA = shift ∧ (entry1805 i).ID = S (258 + i.val + 1) ∧
      (entry1805 i).IC = S 163 ∧ (entry1805 i).Inext = T 162 (258 + i.val + 1) ∧
      (entry1805 i).Icur = T 162 (258 + i.val) ∧
      (entry1805 i).output = T 163 (258 + i.val) ∧
      (entry1805 i).charge = charge 162 (258 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1805 (i : Fin 32) :
    forwardStepOK (-768) (charge 162 (258 + i.val)) shift
      (S (258 + i.val + 1)) (S 163) (T 162 (258 + i.val + 1))
      (T 162 (258 + i.val)) (T 163 (258 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1805.entries OriginalRow227TriangleForward1805.checked
    ⟨i.val, by rw [size1805]; exact i.isLt⟩
  change (entry1805 i).check = true at h
  rcases fields1805 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1806 : OriginalRow227TriangleForward1806.entries.size = 32 := rfl

def entry1806 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1806.entries[i.val]'(by rw [size1806]; exact i.isLt)

theorem fields1806 (i : Fin 32) :
    (entry1806 i).IA = shift ∧ (entry1806 i).ID = S (290 + i.val + 1) ∧
      (entry1806 i).IC = S 163 ∧ (entry1806 i).Inext = T 162 (290 + i.val + 1) ∧
      (entry1806 i).Icur = T 162 (290 + i.val) ∧
      (entry1806 i).output = T 163 (290 + i.val) ∧
      (entry1806 i).charge = charge 162 (290 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1806 (i : Fin 32) :
    forwardStepOK (-768) (charge 162 (290 + i.val)) shift
      (S (290 + i.val + 1)) (S 163) (T 162 (290 + i.val + 1))
      (T 162 (290 + i.val)) (T 163 (290 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1806.entries OriginalRow227TriangleForward1806.checked
    ⟨i.val, by rw [size1806]; exact i.isLt⟩
  change (entry1806 i).check = true at h
  rcases fields1806 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1807 : OriginalRow227TriangleForward1807.entries.size = 17 := rfl

def entry1807 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1807.entries[i.val]'(by rw [size1807]; exact i.isLt)

theorem fields1807 (i : Fin 17) :
    (entry1807 i).IA = shift ∧ (entry1807 i).ID = S (322 + i.val + 1) ∧
      (entry1807 i).IC = S 163 ∧ (entry1807 i).Inext = T 162 (322 + i.val + 1) ∧
      (entry1807 i).Icur = T 162 (322 + i.val) ∧
      (entry1807 i).output = T 163 (322 + i.val) ∧
      (entry1807 i).charge = charge 162 (322 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings05.S_eq_root163).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1807 (i : Fin 17) :
    forwardStepOK (-768) (charge 162 (322 + i.val)) shift
      (S (322 + i.val + 1)) (S 163) (T 162 (322 + i.val + 1))
      (T 162 (322 + i.val)) (T 163 (322 + i.val))
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1807.entries OriginalRow227TriangleForward1807.checked
    ⟨i.val, by rw [size1807]; exact i.isLt⟩
  change (entry1807 i).check = true at h
  rcases fields1807 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 162 ≤ d) (hhi : d < 339) :
    forwardStepOK (-768) (charge 162 d) shift (S (d + 1)) (S 163)
      (T 162 (d + 1)) (T 162 d) (T 163 d)
      (OriginalRow227Roots.root_pos 163 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 162 (by decide)) = true := by
  by_cases h258 : d < 258
  ·
    by_cases h194 : d < 194
    ·
      have hi : d - 162 < 32 := by omega
      have heq : 162 + (d - 162) = d := by omega
      simpa only [heq] using step1802 ⟨d - 162, hi⟩
    ·
      by_cases h226 : d < 226
      ·
        have hi : d - 194 < 32 := by omega
        have heq : 194 + (d - 194) = d := by omega
        simpa only [heq] using step1803 ⟨d - 194, hi⟩
      ·
        have hi : d - 226 < 32 := by omega
        have heq : 226 + (d - 226) = d := by omega
        simpa only [heq] using step1804 ⟨d - 226, hi⟩
  ·
    by_cases h290 : d < 290
    ·
      have hi : d - 258 < 32 := by omega
      have heq : 258 + (d - 258) = d := by omega
      simpa only [heq] using step1805 ⟨d - 258, hi⟩
    ·
      by_cases h322 : d < 322
      ·
        have hi : d - 290 < 32 := by omega
        have heq : 290 + (d - 290) = d := by omega
        simpa only [heq] using step1806 ⟨d - 290, hi⟩
      ·
        have hi : d - 322 < 17 := by omega
        have heq : 322 + (d - 322) = d := by omega
        simpa only [heq] using step1807 ⟨d - 322, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1802,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1802,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1803,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1803,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1804,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1804,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1805,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1805,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1806,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1806,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.fields1807,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.step1807,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow163
