import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow163
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow164
import Grothe.UpperChaos.OriginalRow227TriangleForward1808
import Grothe.UpperChaos.OriginalRow227TriangleForward1809
import Grothe.UpperChaos.OriginalRow227TriangleForward1810
import Grothe.UpperChaos.OriginalRow227TriangleForward1811
import Grothe.UpperChaos.OriginalRow227TriangleForward1812
import Grothe.UpperChaos.OriginalRow227TriangleForward1813

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1808 : OriginalRow227TriangleForward1808.entries.size = 32 := rfl

def entry1808 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1808.entries[i.val]'(by rw [size1808]; exact i.isLt)

theorem fields1808 (i : Fin 32) :
    (entry1808 i).IA = shift ∧ (entry1808 i).ID = S (163 + i.val + 1) ∧
      (entry1808 i).IC = S 164 ∧ (entry1808 i).Inext = T 163 (163 + i.val + 1) ∧
      (entry1808 i).Icur = T 163 (163 + i.val) ∧
      (entry1808 i).output = T 164 (163 + i.val) ∧
      (entry1808 i).charge = charge 163 (163 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1818_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1824_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1808 (i : Fin 32) :
    forwardStepOK (-768) (charge 163 (163 + i.val)) shift
      (S (163 + i.val + 1)) (S 164) (T 163 (163 + i.val + 1))
      (T 163 (163 + i.val)) (T 164 (163 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1808.entries OriginalRow227TriangleForward1808.checked
    ⟨i.val, by rw [size1808]; exact i.isLt⟩
  change (entry1808 i).check = true at h
  rcases fields1808 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1809 : OriginalRow227TriangleForward1809.entries.size = 32 := rfl

def entry1809 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1809.entries[i.val]'(by rw [size1809]; exact i.isLt)

theorem fields1809 (i : Fin 32) :
    (entry1809 i).IA = shift ∧ (entry1809 i).ID = S (195 + i.val + 1) ∧
      (entry1809 i).IC = S 164 ∧ (entry1809 i).Inext = T 163 (195 + i.val + 1) ∧
      (entry1809 i).Icur = T 163 (195 + i.val) ∧
      (entry1809 i).output = T 164 (195 + i.val) ∧
      (entry1809 i).charge = charge 163 (195 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1819_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1825_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1809 (i : Fin 32) :
    forwardStepOK (-768) (charge 163 (195 + i.val)) shift
      (S (195 + i.val + 1)) (S 164) (T 163 (195 + i.val + 1))
      (T 163 (195 + i.val)) (T 164 (195 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1809.entries OriginalRow227TriangleForward1809.checked
    ⟨i.val, by rw [size1809]; exact i.isLt⟩
  change (entry1809 i).check = true at h
  rcases fields1809 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1810 : OriginalRow227TriangleForward1810.entries.size = 32 := rfl

def entry1810 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1810.entries[i.val]'(by rw [size1810]; exact i.isLt)

theorem fields1810 (i : Fin 32) :
    (entry1810 i).IA = shift ∧ (entry1810 i).ID = S (227 + i.val + 1) ∧
      (entry1810 i).IC = S 164 ∧ (entry1810 i).Inext = T 163 (227 + i.val + 1) ∧
      (entry1810 i).Icur = T 163 (227 + i.val) ∧
      (entry1810 i).output = T 164 (227 + i.val) ∧
      (entry1810 i).charge = charge 163 (227 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1820_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1826_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1810 (i : Fin 32) :
    forwardStepOK (-768) (charge 163 (227 + i.val)) shift
      (S (227 + i.val + 1)) (S 164) (T 163 (227 + i.val + 1))
      (T 163 (227 + i.val)) (T 164 (227 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1810.entries OriginalRow227TriangleForward1810.checked
    ⟨i.val, by rw [size1810]; exact i.isLt⟩
  change (entry1810 i).check = true at h
  rcases fields1810 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1811 : OriginalRow227TriangleForward1811.entries.size = 32 := rfl

def entry1811 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1811.entries[i.val]'(by rw [size1811]; exact i.isLt)

theorem fields1811 (i : Fin 32) :
    (entry1811 i).IA = shift ∧ (entry1811 i).ID = S (259 + i.val + 1) ∧
      (entry1811 i).IC = S 164 ∧ (entry1811 i).Inext = T 163 (259 + i.val + 1) ∧
      (entry1811 i).Icur = T 163 (259 + i.val) ∧
      (entry1811 i).output = T 164 (259 + i.val) ∧
      (entry1811 i).charge = charge 163 (259 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1821_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1827_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1811 (i : Fin 32) :
    forwardStepOK (-768) (charge 163 (259 + i.val)) shift
      (S (259 + i.val + 1)) (S 164) (T 163 (259 + i.val + 1))
      (T 163 (259 + i.val)) (T 164 (259 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1811.entries OriginalRow227TriangleForward1811.checked
    ⟨i.val, by rw [size1811]; exact i.isLt⟩
  change (entry1811 i).check = true at h
  rcases fields1811 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1812 : OriginalRow227TriangleForward1812.entries.size = 32 := rfl

def entry1812 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1812.entries[i.val]'(by rw [size1812]; exact i.isLt)

theorem fields1812 (i : Fin 32) :
    (entry1812 i).IA = shift ∧ (entry1812 i).ID = S (291 + i.val + 1) ∧
      (entry1812 i).IC = S 164 ∧ (entry1812 i).Inext = T 163 (291 + i.val + 1) ∧
      (entry1812 i).Icur = T 163 (291 + i.val) ∧
      (entry1812 i).output = T 164 (291 + i.val) ∧
      (entry1812 i).charge = charge 163 (291 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1822_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1828_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1812 (i : Fin 32) :
    forwardStepOK (-768) (charge 163 (291 + i.val)) shift
      (S (291 + i.val + 1)) (S 164) (T 163 (291 + i.val + 1))
      (T 163 (291 + i.val)) (T 164 (291 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1812.entries OriginalRow227TriangleForward1812.checked
    ⟨i.val, by rw [size1812]; exact i.isLt⟩
  change (entry1812 i).check = true at h
  rcases fields1812 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1813 : OriginalRow227TriangleForward1813.entries.size = 15 := rfl

def entry1813 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1813.entries[i.val]'(by rw [size1813]; exact i.isLt)

theorem fields1813 (i : Fin 15) :
    (entry1813 i).IA = shift ∧ (entry1813 i).ID = S (323 + i.val + 1) ∧
      (entry1813 i).IC = S 164 ∧ (entry1813 i).Inext = T 163 (323 + i.val + 1) ∧
      (entry1813 i).Icur = T 163 (323 + i.val) ∧
      (entry1813 i).output = T 164 (323 + i.val) ∧
      (entry1813 i).charge = charge 163 (323 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings05.S_eq_root164).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow163.block1823_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow164.block1829_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1813 (i : Fin 15) :
    forwardStepOK (-768) (charge 163 (323 + i.val)) shift
      (S (323 + i.val + 1)) (S 164) (T 163 (323 + i.val + 1))
      (T 163 (323 + i.val)) (T 164 (323 + i.val))
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1813.entries OriginalRow227TriangleForward1813.checked
    ⟨i.val, by rw [size1813]; exact i.isLt⟩
  change (entry1813 i).check = true at h
  rcases fields1813 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 163 ≤ d) (hhi : d < 338) :
    forwardStepOK (-768) (charge 163 d) shift (S (d + 1)) (S 164)
      (T 163 (d + 1)) (T 163 d) (T 164 d)
      (OriginalRow227Roots.root_pos 164 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 163 (by decide)) = true := by
  by_cases h259 : d < 259
  ·
    by_cases h195 : d < 195
    ·
      have hi : d - 163 < 32 := by omega
      have heq : 163 + (d - 163) = d := by omega
      simpa only [heq] using step1808 ⟨d - 163, hi⟩
    ·
      by_cases h227 : d < 227
      ·
        have hi : d - 195 < 32 := by omega
        have heq : 195 + (d - 195) = d := by omega
        simpa only [heq] using step1809 ⟨d - 195, hi⟩
      ·
        have hi : d - 227 < 32 := by omega
        have heq : 227 + (d - 227) = d := by omega
        simpa only [heq] using step1810 ⟨d - 227, hi⟩
  ·
    by_cases h291 : d < 291
    ·
      have hi : d - 259 < 32 := by omega
      have heq : 259 + (d - 259) = d := by omega
      simpa only [heq] using step1811 ⟨d - 259, hi⟩
    ·
      by_cases h323 : d < 323
      ·
        have hi : d - 291 < 32 := by omega
        have heq : 291 + (d - 291) = d := by omega
        simpa only [heq] using step1812 ⟨d - 291, hi⟩
      ·
        have hi : d - 323 < 15 := by omega
        have heq : 323 + (d - 323) = d := by omega
        simpa only [heq] using step1813 ⟨d - 323, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1808,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1808,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1809,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1809,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1810,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1810,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1811,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1811,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1812,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1812,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.fields1813,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.step1813,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow164
