import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow160
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow161
import Grothe.UpperChaos.OriginalRow227TriangleForward1790
import Grothe.UpperChaos.OriginalRow227TriangleForward1791
import Grothe.UpperChaos.OriginalRow227TriangleForward1792
import Grothe.UpperChaos.OriginalRow227TriangleForward1793
import Grothe.UpperChaos.OriginalRow227TriangleForward1794
import Grothe.UpperChaos.OriginalRow227TriangleForward1795

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1790 : OriginalRow227TriangleForward1790.entries.size = 32 := rfl

def entry1790 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1790.entries[i.val]'(by rw [size1790]; exact i.isLt)

theorem fields1790 (i : Fin 32) :
    (entry1790 i).IA = shift ∧ (entry1790 i).ID = S (160 + i.val + 1) ∧
      (entry1790 i).IC = S 161 ∧ (entry1790 i).Inext = T 160 (160 + i.val + 1) ∧
      (entry1790 i).Icur = T 160 (160 + i.val) ∧
      (entry1790 i).output = T 161 (160 + i.val) ∧
      (entry1790 i).charge = charge 160 (160 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root161).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root162).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root163).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root164).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root165).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root166).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root167).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root168).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root169).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1800_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1806_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1790 (i : Fin 32) :
    forwardStepOK (-768) (charge 160 (160 + i.val)) shift
      (S (160 + i.val + 1)) (S 161) (T 160 (160 + i.val + 1))
      (T 160 (160 + i.val)) (T 161 (160 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1790.entries OriginalRow227TriangleForward1790.checked
    ⟨i.val, by rw [size1790]; exact i.isLt⟩
  change (entry1790 i).check = true at h
  rcases fields1790 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1791 : OriginalRow227TriangleForward1791.entries.size = 32 := rfl

def entry1791 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1791.entries[i.val]'(by rw [size1791]; exact i.isLt)

theorem fields1791 (i : Fin 32) :
    (entry1791 i).IA = shift ∧ (entry1791 i).ID = S (192 + i.val + 1) ∧
      (entry1791 i).IC = S 161 ∧ (entry1791 i).Inext = T 160 (192 + i.val + 1) ∧
      (entry1791 i).Icur = T 160 (192 + i.val) ∧
      (entry1791 i).output = T 161 (192 + i.val) ∧
      (entry1791 i).charge = charge 160 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1801_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1807_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1791 (i : Fin 32) :
    forwardStepOK (-768) (charge 160 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 161) (T 160 (192 + i.val + 1))
      (T 160 (192 + i.val)) (T 161 (192 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1791.entries OriginalRow227TriangleForward1791.checked
    ⟨i.val, by rw [size1791]; exact i.isLt⟩
  change (entry1791 i).check = true at h
  rcases fields1791 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1792 : OriginalRow227TriangleForward1792.entries.size = 32 := rfl

def entry1792 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1792.entries[i.val]'(by rw [size1792]; exact i.isLt)

theorem fields1792 (i : Fin 32) :
    (entry1792 i).IA = shift ∧ (entry1792 i).ID = S (224 + i.val + 1) ∧
      (entry1792 i).IC = S 161 ∧ (entry1792 i).Inext = T 160 (224 + i.val + 1) ∧
      (entry1792 i).Icur = T 160 (224 + i.val) ∧
      (entry1792 i).output = T 161 (224 + i.val) ∧
      (entry1792 i).charge = charge 160 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1802_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1808_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1792 (i : Fin 32) :
    forwardStepOK (-768) (charge 160 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 161) (T 160 (224 + i.val + 1))
      (T 160 (224 + i.val)) (T 161 (224 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1792.entries OriginalRow227TriangleForward1792.checked
    ⟨i.val, by rw [size1792]; exact i.isLt⟩
  change (entry1792 i).check = true at h
  rcases fields1792 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1793 : OriginalRow227TriangleForward1793.entries.size = 32 := rfl

def entry1793 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1793.entries[i.val]'(by rw [size1793]; exact i.isLt)

theorem fields1793 (i : Fin 32) :
    (entry1793 i).IA = shift ∧ (entry1793 i).ID = S (256 + i.val + 1) ∧
      (entry1793 i).IC = S 161 ∧ (entry1793 i).Inext = T 160 (256 + i.val + 1) ∧
      (entry1793 i).Icur = T 160 (256 + i.val) ∧
      (entry1793 i).output = T 161 (256 + i.val) ∧
      (entry1793 i).charge = charge 160 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1803_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1809_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1793 (i : Fin 32) :
    forwardStepOK (-768) (charge 160 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 161) (T 160 (256 + i.val + 1))
      (T 160 (256 + i.val)) (T 161 (256 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1793.entries OriginalRow227TriangleForward1793.checked
    ⟨i.val, by rw [size1793]; exact i.isLt⟩
  change (entry1793 i).check = true at h
  rcases fields1793 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1794 : OriginalRow227TriangleForward1794.entries.size = 32 := rfl

def entry1794 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1794.entries[i.val]'(by rw [size1794]; exact i.isLt)

theorem fields1794 (i : Fin 32) :
    (entry1794 i).IA = shift ∧ (entry1794 i).ID = S (288 + i.val + 1) ∧
      (entry1794 i).IC = S 161 ∧ (entry1794 i).Inext = T 160 (288 + i.val + 1) ∧
      (entry1794 i).Icur = T 160 (288 + i.val) ∧
      (entry1794 i).output = T 161 (288 + i.val) ∧
      (entry1794 i).charge = charge 160 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1804_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1810_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1794 (i : Fin 32) :
    forwardStepOK (-768) (charge 160 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 161) (T 160 (288 + i.val + 1))
      (T 160 (288 + i.val)) (T 161 (288 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1794.entries OriginalRow227TriangleForward1794.checked
    ⟨i.val, by rw [size1794]; exact i.isLt⟩
  change (entry1794 i).check = true at h
  rcases fields1794 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1795 : OriginalRow227TriangleForward1795.entries.size = 21 := rfl

def entry1795 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1795.entries[i.val]'(by rw [size1795]; exact i.isLt)

theorem fields1795 (i : Fin 21) :
    (entry1795 i).IA = shift ∧ (entry1795 i).ID = S (320 + i.val + 1) ∧
      (entry1795 i).IC = S 161 ∧ (entry1795 i).Inext = T 160 (320 + i.val + 1) ∧
      (entry1795 i).Icur = T 160 (320 + i.val) ∧
      (entry1795 i).output = T 161 (320 + i.val) ∧
      (entry1795 i).charge = charge 160 (320 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root333).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root334).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root335).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root336).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root337).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root338).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root339).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root340).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root341).symm, (OriginalRow227RootBindings05.S_eq_root161).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow160.block1805_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow161.block1811_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1795 (i : Fin 21) :
    forwardStepOK (-768) (charge 160 (320 + i.val)) shift
      (S (320 + i.val + 1)) (S 161) (T 160 (320 + i.val + 1))
      (T 160 (320 + i.val)) (T 161 (320 + i.val))
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1795.entries OriginalRow227TriangleForward1795.checked
    ⟨i.val, by rw [size1795]; exact i.isLt⟩
  change (entry1795 i).check = true at h
  rcases fields1795 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 160 ≤ d) (hhi : d < 341) :
    forwardStepOK (-768) (charge 160 d) shift (S (d + 1)) (S 161)
      (T 160 (d + 1)) (T 160 d) (T 161 d)
      (OriginalRow227Roots.root_pos 161 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 160 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h192 : d < 192
    ·
      have hi : d - 160 < 32 := by omega
      have heq : 160 + (d - 160) = d := by omega
      simpa only [heq] using step1790 ⟨d - 160, hi⟩
    ·
      by_cases h224 : d < 224
      ·
        have hi : d - 192 < 32 := by omega
        have heq : 192 + (d - 192) = d := by omega
        simpa only [heq] using step1791 ⟨d - 192, hi⟩
      ·
        have hi : d - 224 < 32 := by omega
        have heq : 224 + (d - 224) = d := by omega
        simpa only [heq] using step1792 ⟨d - 224, hi⟩
  ·
    by_cases h288 : d < 288
    ·
      have hi : d - 256 < 32 := by omega
      have heq : 256 + (d - 256) = d := by omega
      simpa only [heq] using step1793 ⟨d - 256, hi⟩
    ·
      by_cases h320 : d < 320
      ·
        have hi : d - 288 < 32 := by omega
        have heq : 288 + (d - 288) = d := by omega
        simpa only [heq] using step1794 ⟨d - 288, hi⟩
      ·
        have hi : d - 320 < 21 := by omega
        have heq : 320 + (d - 320) = d := by omega
        simpa only [heq] using step1795 ⟨d - 320, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1790,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1790,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1791,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1791,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1792,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1792,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1793,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1793,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1794,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1794,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.fields1795,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.step1795,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow161
