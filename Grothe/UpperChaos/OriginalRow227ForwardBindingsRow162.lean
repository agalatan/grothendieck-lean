import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow162
import Grothe.UpperChaos.OriginalRow227TriangleForward1796
import Grothe.UpperChaos.OriginalRow227TriangleForward1797
import Grothe.UpperChaos.OriginalRow227TriangleForward1798
import Grothe.UpperChaos.OriginalRow227TriangleForward1799
import Grothe.UpperChaos.OriginalRow227TriangleForward1800
import Grothe.UpperChaos.OriginalRow227TriangleForward1801

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1796 : OriginalRow227TriangleForward1796.entries.size = 32 := rfl

def entry1796 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1796.entries[i.val]'(by rw [size1796]; exact i.isLt)

theorem fields1796 (i : Fin 32) :
    (entry1796 i).IA = shift ∧ (entry1796 i).ID = S (161 + i.val + 1) ∧
      (entry1796 i).IC = S 162 ∧ (entry1796 i).Inext = T 161 (161 + i.val + 1) ∧
      (entry1796 i).Icur = T 161 (161 + i.val) ∧
      (entry1796 i).output = T 162 (161 + i.val) ∧
      (entry1796 i).charge = charge 161 (161 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1812_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1796 (i : Fin 32) :
    forwardStepOK (-768) (charge 161 (161 + i.val)) shift
      (S (161 + i.val + 1)) (S 162) (T 161 (161 + i.val + 1))
      (T 161 (161 + i.val)) (T 162 (161 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1796.entries OriginalRow227TriangleForward1796.checked
    ⟨i.val, by rw [size1796]; exact i.isLt⟩
  change (entry1796 i).check = true at h
  rcases fields1796 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1797 : OriginalRow227TriangleForward1797.entries.size = 32 := rfl

def entry1797 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1797.entries[i.val]'(by rw [size1797]; exact i.isLt)

theorem fields1797 (i : Fin 32) :
    (entry1797 i).IA = shift ∧ (entry1797 i).ID = S (193 + i.val + 1) ∧
      (entry1797 i).IC = S 162 ∧ (entry1797 i).Inext = T 161 (193 + i.val + 1) ∧
      (entry1797 i).Icur = T 161 (193 + i.val) ∧
      (entry1797 i).output = T 162 (193 + i.val) ∧
      (entry1797 i).charge = charge 161 (193 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1813_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1797 (i : Fin 32) :
    forwardStepOK (-768) (charge 161 (193 + i.val)) shift
      (S (193 + i.val + 1)) (S 162) (T 161 (193 + i.val + 1))
      (T 161 (193 + i.val)) (T 162 (193 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1797.entries OriginalRow227TriangleForward1797.checked
    ⟨i.val, by rw [size1797]; exact i.isLt⟩
  change (entry1797 i).check = true at h
  rcases fields1797 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1798 : OriginalRow227TriangleForward1798.entries.size = 32 := rfl

def entry1798 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1798.entries[i.val]'(by rw [size1798]; exact i.isLt)

theorem fields1798 (i : Fin 32) :
    (entry1798 i).IA = shift ∧ (entry1798 i).ID = S (225 + i.val + 1) ∧
      (entry1798 i).IC = S 162 ∧ (entry1798 i).Inext = T 161 (225 + i.val + 1) ∧
      (entry1798 i).Icur = T 161 (225 + i.val) ∧
      (entry1798 i).output = T 162 (225 + i.val) ∧
      (entry1798 i).charge = charge 161 (225 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1814_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1798 (i : Fin 32) :
    forwardStepOK (-768) (charge 161 (225 + i.val)) shift
      (S (225 + i.val + 1)) (S 162) (T 161 (225 + i.val + 1))
      (T 161 (225 + i.val)) (T 162 (225 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1798.entries OriginalRow227TriangleForward1798.checked
    ⟨i.val, by rw [size1798]; exact i.isLt⟩
  change (entry1798 i).check = true at h
  rcases fields1798 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1799 : OriginalRow227TriangleForward1799.entries.size = 32 := rfl

def entry1799 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1799.entries[i.val]'(by rw [size1799]; exact i.isLt)

theorem fields1799 (i : Fin 32) :
    (entry1799 i).IA = shift ∧ (entry1799 i).ID = S (257 + i.val + 1) ∧
      (entry1799 i).IC = S 162 ∧ (entry1799 i).Inext = T 161 (257 + i.val + 1) ∧
      (entry1799 i).Icur = T 161 (257 + i.val) ∧
      (entry1799 i).output = T 162 (257 + i.val) ∧
      (entry1799 i).charge = charge 161 (257 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1815_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1799 (i : Fin 32) :
    forwardStepOK (-768) (charge 161 (257 + i.val)) shift
      (S (257 + i.val + 1)) (S 162) (T 161 (257 + i.val + 1))
      (T 161 (257 + i.val)) (T 162 (257 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1799.entries OriginalRow227TriangleForward1799.checked
    ⟨i.val, by rw [size1799]; exact i.isLt⟩
  change (entry1799 i).check = true at h
  rcases fields1799 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1800 : OriginalRow227TriangleForward1800.entries.size = 32 := rfl

def entry1800 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1800.entries[i.val]'(by rw [size1800]; exact i.isLt)

theorem fields1800 (i : Fin 32) :
    (entry1800 i).IA = shift ∧ (entry1800 i).ID = S (289 + i.val + 1) ∧
      (entry1800 i).IC = S 162 ∧ (entry1800 i).Inext = T 161 (289 + i.val + 1) ∧
      (entry1800 i).Icur = T 161 (289 + i.val) ∧
      (entry1800 i).output = T 162 (289 + i.val) ∧
      (entry1800 i).charge = charge 161 (289 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1816_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1800 (i : Fin 32) :
    forwardStepOK (-768) (charge 161 (289 + i.val)) shift
      (S (289 + i.val + 1)) (S 162) (T 161 (289 + i.val + 1))
      (T 161 (289 + i.val)) (T 162 (289 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1800.entries OriginalRow227TriangleForward1800.checked
    ⟨i.val, by rw [size1800]; exact i.isLt⟩
  change (entry1800 i).check = true at h
  rcases fields1800 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1801 : OriginalRow227TriangleForward1801.entries.size = 19 := rfl

def entry1801 (i : Fin 19) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1801.entries[i.val]'(by rw [size1801]; exact i.isLt)

theorem fields1801 (i : Fin 19) :
    (entry1801 i).IA = shift ∧ (entry1801 i).ID = S (321 + i.val + 1) ∧
      (entry1801 i).IC = S 162 ∧ (entry1801 i).Inext = T 161 (321 + i.val + 1) ∧
      (entry1801 i).Icur = T 161 (321 + i.val) ∧
      (entry1801 i).output = T 162 (321 + i.val) ∧
      (entry1801 i).charge = charge 161 (321 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings05.S_eq_root162).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow162.block1817_value ⟨18, by decide⟩).symm, rfl⟩

theorem step1801 (i : Fin 19) :
    forwardStepOK (-768) (charge 161 (321 + i.val)) shift
      (S (321 + i.val + 1)) (S 162) (T 161 (321 + i.val + 1))
      (T 161 (321 + i.val)) (T 162 (321 + i.val))
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1801.entries OriginalRow227TriangleForward1801.checked
    ⟨i.val, by rw [size1801]; exact i.isLt⟩
  change (entry1801 i).check = true at h
  rcases fields1801 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 161 ≤ d) (hhi : d < 340) :
    forwardStepOK (-768) (charge 161 d) shift (S (d + 1)) (S 162)
      (T 161 (d + 1)) (T 161 d) (T 162 d)
      (OriginalRow227Roots.root_pos 162 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 161 (by decide)) = true := by
  by_cases h257 : d < 257
  ·
    by_cases h193 : d < 193
    ·
      have hi : d - 161 < 32 := by omega
      have heq : 161 + (d - 161) = d := by omega
      simpa only [heq] using step1796 ⟨d - 161, hi⟩
    ·
      by_cases h225 : d < 225
      ·
        have hi : d - 193 < 32 := by omega
        have heq : 193 + (d - 193) = d := by omega
        simpa only [heq] using step1797 ⟨d - 193, hi⟩
      ·
        have hi : d - 225 < 32 := by omega
        have heq : 225 + (d - 225) = d := by omega
        simpa only [heq] using step1798 ⟨d - 225, hi⟩
  ·
    by_cases h289 : d < 289
    ·
      have hi : d - 257 < 32 := by omega
      have heq : 257 + (d - 257) = d := by omega
      simpa only [heq] using step1799 ⟨d - 257, hi⟩
    ·
      by_cases h321 : d < 321
      ·
        have hi : d - 289 < 32 := by omega
        have heq : 289 + (d - 289) = d := by omega
        simpa only [heq] using step1800 ⟨d - 289, hi⟩
      ·
        have hi : d - 321 < 19 := by omega
        have heq : 321 + (d - 321) = d := by omega
        simpa only [heq] using step1801 ⟨d - 321, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1796,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1796,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1797,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1797,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1798,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1798,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1799,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1799,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1800,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1800,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.fields1801,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.step1801,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow162
