import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow165
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow166
import Grothe.UpperChaos.OriginalRow227TriangleForward1820
import Grothe.UpperChaos.OriginalRow227TriangleForward1821
import Grothe.UpperChaos.OriginalRow227TriangleForward1822
import Grothe.UpperChaos.OriginalRow227TriangleForward1823
import Grothe.UpperChaos.OriginalRow227TriangleForward1824
import Grothe.UpperChaos.OriginalRow227TriangleForward1825

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1820 : OriginalRow227TriangleForward1820.entries.size = 32 := rfl

def entry1820 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1820.entries[i.val]'(by rw [size1820]; exact i.isLt)

theorem fields1820 (i : Fin 32) :
    (entry1820 i).IA = shift ∧ (entry1820 i).ID = S (165 + i.val + 1) ∧
      (entry1820 i).IC = S 166 ∧ (entry1820 i).Inext = T 165 (165 + i.val + 1) ∧
      (entry1820 i).Icur = T 165 (165 + i.val) ∧
      (entry1820 i).output = T 166 (165 + i.val) ∧
      (entry1820 i).charge = charge 165 (165 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1830_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1836_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1820 (i : Fin 32) :
    forwardStepOK (-768) (charge 165 (165 + i.val)) shift
      (S (165 + i.val + 1)) (S 166) (T 165 (165 + i.val + 1))
      (T 165 (165 + i.val)) (T 166 (165 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1820.entries OriginalRow227TriangleForward1820.checked
    ⟨i.val, by rw [size1820]; exact i.isLt⟩
  change (entry1820 i).check = true at h
  rcases fields1820 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1821 : OriginalRow227TriangleForward1821.entries.size = 32 := rfl

def entry1821 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1821.entries[i.val]'(by rw [size1821]; exact i.isLt)

theorem fields1821 (i : Fin 32) :
    (entry1821 i).IA = shift ∧ (entry1821 i).ID = S (197 + i.val + 1) ∧
      (entry1821 i).IC = S 166 ∧ (entry1821 i).Inext = T 165 (197 + i.val + 1) ∧
      (entry1821 i).Icur = T 165 (197 + i.val) ∧
      (entry1821 i).output = T 166 (197 + i.val) ∧
      (entry1821 i).charge = charge 165 (197 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1831_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1837_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1821 (i : Fin 32) :
    forwardStepOK (-768) (charge 165 (197 + i.val)) shift
      (S (197 + i.val + 1)) (S 166) (T 165 (197 + i.val + 1))
      (T 165 (197 + i.val)) (T 166 (197 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1821.entries OriginalRow227TriangleForward1821.checked
    ⟨i.val, by rw [size1821]; exact i.isLt⟩
  change (entry1821 i).check = true at h
  rcases fields1821 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1822 : OriginalRow227TriangleForward1822.entries.size = 32 := rfl

def entry1822 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1822.entries[i.val]'(by rw [size1822]; exact i.isLt)

theorem fields1822 (i : Fin 32) :
    (entry1822 i).IA = shift ∧ (entry1822 i).ID = S (229 + i.val + 1) ∧
      (entry1822 i).IC = S 166 ∧ (entry1822 i).Inext = T 165 (229 + i.val + 1) ∧
      (entry1822 i).Icur = T 165 (229 + i.val) ∧
      (entry1822 i).output = T 166 (229 + i.val) ∧
      (entry1822 i).charge = charge 165 (229 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1832_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1838_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1822 (i : Fin 32) :
    forwardStepOK (-768) (charge 165 (229 + i.val)) shift
      (S (229 + i.val + 1)) (S 166) (T 165 (229 + i.val + 1))
      (T 165 (229 + i.val)) (T 166 (229 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1822.entries OriginalRow227TriangleForward1822.checked
    ⟨i.val, by rw [size1822]; exact i.isLt⟩
  change (entry1822 i).check = true at h
  rcases fields1822 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1823 : OriginalRow227TriangleForward1823.entries.size = 32 := rfl

def entry1823 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1823.entries[i.val]'(by rw [size1823]; exact i.isLt)

theorem fields1823 (i : Fin 32) :
    (entry1823 i).IA = shift ∧ (entry1823 i).ID = S (261 + i.val + 1) ∧
      (entry1823 i).IC = S 166 ∧ (entry1823 i).Inext = T 165 (261 + i.val + 1) ∧
      (entry1823 i).Icur = T 165 (261 + i.val) ∧
      (entry1823 i).output = T 166 (261 + i.val) ∧
      (entry1823 i).charge = charge 165 (261 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1833_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1839_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1823 (i : Fin 32) :
    forwardStepOK (-768) (charge 165 (261 + i.val)) shift
      (S (261 + i.val + 1)) (S 166) (T 165 (261 + i.val + 1))
      (T 165 (261 + i.val)) (T 166 (261 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1823.entries OriginalRow227TriangleForward1823.checked
    ⟨i.val, by rw [size1823]; exact i.isLt⟩
  change (entry1823 i).check = true at h
  rcases fields1823 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1824 : OriginalRow227TriangleForward1824.entries.size = 32 := rfl

def entry1824 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1824.entries[i.val]'(by rw [size1824]; exact i.isLt)

theorem fields1824 (i : Fin 32) :
    (entry1824 i).IA = shift ∧ (entry1824 i).ID = S (293 + i.val + 1) ∧
      (entry1824 i).IC = S 166 ∧ (entry1824 i).Inext = T 165 (293 + i.val + 1) ∧
      (entry1824 i).Icur = T 165 (293 + i.val) ∧
      (entry1824 i).output = T 166 (293 + i.val) ∧
      (entry1824 i).charge = charge 165 (293 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1834_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1840_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1824 (i : Fin 32) :
    forwardStepOK (-768) (charge 165 (293 + i.val)) shift
      (S (293 + i.val + 1)) (S 166) (T 165 (293 + i.val + 1))
      (T 165 (293 + i.val)) (T 166 (293 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1824.entries OriginalRow227TriangleForward1824.checked
    ⟨i.val, by rw [size1824]; exact i.isLt⟩
  change (entry1824 i).check = true at h
  rcases fields1824 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1825 : OriginalRow227TriangleForward1825.entries.size = 11 := rfl

def entry1825 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1825.entries[i.val]'(by rw [size1825]; exact i.isLt)

theorem fields1825 (i : Fin 11) :
    (entry1825 i).IA = shift ∧ (entry1825 i).ID = S (325 + i.val + 1) ∧
      (entry1825 i).IC = S 166 ∧ (entry1825 i).Inext = T 165 (325 + i.val + 1) ∧
      (entry1825 i).Icur = T 165 (325 + i.val) ∧
      (entry1825 i).output = T 166 (325 + i.val) ∧
      (entry1825 i).charge = charge 165 (325 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root166).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow165.block1835_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow166.block1841_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1825 (i : Fin 11) :
    forwardStepOK (-768) (charge 165 (325 + i.val)) shift
      (S (325 + i.val + 1)) (S 166) (T 165 (325 + i.val + 1))
      (T 165 (325 + i.val)) (T 166 (325 + i.val))
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1825.entries OriginalRow227TriangleForward1825.checked
    ⟨i.val, by rw [size1825]; exact i.isLt⟩
  change (entry1825 i).check = true at h
  rcases fields1825 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 165 ≤ d) (hhi : d < 336) :
    forwardStepOK (-768) (charge 165 d) shift (S (d + 1)) (S 166)
      (T 165 (d + 1)) (T 165 d) (T 166 d)
      (OriginalRow227Roots.root_pos 166 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 165 (by decide)) = true := by
  by_cases h261 : d < 261
  ·
    by_cases h197 : d < 197
    ·
      have hi : d - 165 < 32 := by omega
      have heq : 165 + (d - 165) = d := by omega
      simpa only [heq] using step1820 ⟨d - 165, hi⟩
    ·
      by_cases h229 : d < 229
      ·
        have hi : d - 197 < 32 := by omega
        have heq : 197 + (d - 197) = d := by omega
        simpa only [heq] using step1821 ⟨d - 197, hi⟩
      ·
        have hi : d - 229 < 32 := by omega
        have heq : 229 + (d - 229) = d := by omega
        simpa only [heq] using step1822 ⟨d - 229, hi⟩
  ·
    by_cases h293 : d < 293
    ·
      have hi : d - 261 < 32 := by omega
      have heq : 261 + (d - 261) = d := by omega
      simpa only [heq] using step1823 ⟨d - 261, hi⟩
    ·
      by_cases h325 : d < 325
      ·
        have hi : d - 293 < 32 := by omega
        have heq : 293 + (d - 293) = d := by omega
        simpa only [heq] using step1824 ⟨d - 293, hi⟩
      ·
        have hi : d - 325 < 11 := by omega
        have heq : 325 + (d - 325) = d := by omega
        simpa only [heq] using step1825 ⟨d - 325, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1820,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1820,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1821,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1821,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1822,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1822,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1823,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1823,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1824,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1824,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.fields1825,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.step1825,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow166
