import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow178
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179
import Grothe.UpperChaos.OriginalRow227TriangleForward1891
import Grothe.UpperChaos.OriginalRow227TriangleForward1892
import Grothe.UpperChaos.OriginalRow227TriangleForward1893
import Grothe.UpperChaos.OriginalRow227TriangleForward1894
import Grothe.UpperChaos.OriginalRow227TriangleForward1895

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1891 : OriginalRow227TriangleForward1891.entries.size = 32 := rfl

def entry1891 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1891.entries[i.val]'(by rw [size1891]; exact i.isLt)

theorem fields1891 (i : Fin 32) :
    (entry1891 i).IA = shift ∧ (entry1891 i).ID = S (178 + i.val + 1) ∧
      (entry1891 i).IC = S 179 ∧ (entry1891 i).Inext = T 178 (178 + i.val + 1) ∧
      (entry1891 i).Icur = T 178 (178 + i.val) ∧
      (entry1891 i).output = T 179 (178 + i.val) ∧
      (entry1891 i).charge = charge 178 (178 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1902_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1891 (i : Fin 32) :
    forwardStepOK (-768) (charge 178 (178 + i.val)) shift
      (S (178 + i.val + 1)) (S 179) (T 178 (178 + i.val + 1))
      (T 178 (178 + i.val)) (T 179 (178 + i.val))
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1891.entries OriginalRow227TriangleForward1891.checked
    ⟨i.val, by rw [size1891]; exact i.isLt⟩
  change (entry1891 i).check = true at h
  rcases fields1891 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1892 : OriginalRow227TriangleForward1892.entries.size = 32 := rfl

def entry1892 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1892.entries[i.val]'(by rw [size1892]; exact i.isLt)

theorem fields1892 (i : Fin 32) :
    (entry1892 i).IA = shift ∧ (entry1892 i).ID = S (210 + i.val + 1) ∧
      (entry1892 i).IC = S 179 ∧ (entry1892 i).Inext = T 178 (210 + i.val + 1) ∧
      (entry1892 i).Icur = T 178 (210 + i.val) ∧
      (entry1892 i).output = T 179 (210 + i.val) ∧
      (entry1892 i).charge = charge 178 (210 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1903_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1892 (i : Fin 32) :
    forwardStepOK (-768) (charge 178 (210 + i.val)) shift
      (S (210 + i.val + 1)) (S 179) (T 178 (210 + i.val + 1))
      (T 178 (210 + i.val)) (T 179 (210 + i.val))
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1892.entries OriginalRow227TriangleForward1892.checked
    ⟨i.val, by rw [size1892]; exact i.isLt⟩
  change (entry1892 i).check = true at h
  rcases fields1892 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1893 : OriginalRow227TriangleForward1893.entries.size = 32 := rfl

def entry1893 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1893.entries[i.val]'(by rw [size1893]; exact i.isLt)

theorem fields1893 (i : Fin 32) :
    (entry1893 i).IA = shift ∧ (entry1893 i).ID = S (242 + i.val + 1) ∧
      (entry1893 i).IC = S 179 ∧ (entry1893 i).Inext = T 178 (242 + i.val + 1) ∧
      (entry1893 i).Icur = T 178 (242 + i.val) ∧
      (entry1893 i).output = T 179 (242 + i.val) ∧
      (entry1893 i).charge = charge 178 (242 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1904_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1893 (i : Fin 32) :
    forwardStepOK (-768) (charge 178 (242 + i.val)) shift
      (S (242 + i.val + 1)) (S 179) (T 178 (242 + i.val + 1))
      (T 178 (242 + i.val)) (T 179 (242 + i.val))
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1893.entries OriginalRow227TriangleForward1893.checked
    ⟨i.val, by rw [size1893]; exact i.isLt⟩
  change (entry1893 i).check = true at h
  rcases fields1893 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1894 : OriginalRow227TriangleForward1894.entries.size = 32 := rfl

def entry1894 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1894.entries[i.val]'(by rw [size1894]; exact i.isLt)

theorem fields1894 (i : Fin 32) :
    (entry1894 i).IA = shift ∧ (entry1894 i).ID = S (274 + i.val + 1) ∧
      (entry1894 i).IC = S 179 ∧ (entry1894 i).Inext = T 178 (274 + i.val + 1) ∧
      (entry1894 i).Icur = T 178 (274 + i.val) ∧
      (entry1894 i).output = T 179 (274 + i.val) ∧
      (entry1894 i).charge = charge 178 (274 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1905_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1894 (i : Fin 32) :
    forwardStepOK (-768) (charge 178 (274 + i.val)) shift
      (S (274 + i.val + 1)) (S 179) (T 178 (274 + i.val + 1))
      (T 178 (274 + i.val)) (T 179 (274 + i.val))
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1894.entries OriginalRow227TriangleForward1894.checked
    ⟨i.val, by rw [size1894]; exact i.isLt⟩
  change (entry1894 i).check = true at h
  rcases fields1894 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1895 : OriginalRow227TriangleForward1895.entries.size = 17 := rfl

def entry1895 (i : Fin 17) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1895.entries[i.val]'(by rw [size1895]; exact i.isLt)

theorem fields1895 (i : Fin 17) :
    (entry1895 i).IA = shift ∧ (entry1895 i).ID = S (306 + i.val + 1) ∧
      (entry1895 i).IC = S 179 ∧ (entry1895 i).Inext = T 178 (306 + i.val + 1) ∧
      (entry1895 i).Icur = T 178 (306 + i.val) ∧
      (entry1895 i).output = T 179 (306 + i.val) ∧
      (entry1895 i).charge = charge 178 (306 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root179).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow178.block1906_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨16, by decide⟩).symm, rfl⟩

theorem step1895 (i : Fin 17) :
    forwardStepOK (-768) (charge 178 (306 + i.val)) shift
      (S (306 + i.val + 1)) (S 179) (T 178 (306 + i.val + 1))
      (T 178 (306 + i.val)) (T 179 (306 + i.val))
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1895.entries OriginalRow227TriangleForward1895.checked
    ⟨i.val, by rw [size1895]; exact i.isLt⟩
  change (entry1895 i).check = true at h
  rcases fields1895 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 178 ≤ d) (hhi : d < 323) :
    forwardStepOK (-768) (charge 178 d) shift (S (d + 1)) (S 179)
      (T 178 (d + 1)) (T 178 d) (T 179 d)
      (OriginalRow227Roots.root_pos 179 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 178 (by decide)) = true := by
  by_cases h242 : d < 242
  ·
    by_cases h210 : d < 210
    ·
      have hi : d - 178 < 32 := by omega
      have heq : 178 + (d - 178) = d := by omega
      simpa only [heq] using step1891 ⟨d - 178, hi⟩
    ·
      have hi : d - 210 < 32 := by omega
      have heq : 210 + (d - 210) = d := by omega
      simpa only [heq] using step1892 ⟨d - 210, hi⟩
  ·
    by_cases h274 : d < 274
    ·
      have hi : d - 242 < 32 := by omega
      have heq : 242 + (d - 242) = d := by omega
      simpa only [heq] using step1893 ⟨d - 242, hi⟩
    ·
      by_cases h306 : d < 306
      ·
        have hi : d - 274 < 32 := by omega
        have heq : 274 + (d - 274) = d := by omega
        simpa only [heq] using step1894 ⟨d - 274, hi⟩
      ·
        have hi : d - 306 < 17 := by omega
        have heq : 306 + (d - 306) = d := by omega
        simpa only [heq] using step1895 ⟨d - 306, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.fields1891,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.step1891,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.fields1892,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.step1892,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.fields1893,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.step1893,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.fields1894,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.step1894,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.fields1895,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.step1895,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow179
