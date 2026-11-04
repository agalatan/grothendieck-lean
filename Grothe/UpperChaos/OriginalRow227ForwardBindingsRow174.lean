import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow174
import Grothe.UpperChaos.OriginalRow227TriangleForward1866
import Grothe.UpperChaos.OriginalRow227TriangleForward1867
import Grothe.UpperChaos.OriginalRow227TriangleForward1868
import Grothe.UpperChaos.OriginalRow227TriangleForward1869
import Grothe.UpperChaos.OriginalRow227TriangleForward1870

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1866 : OriginalRow227TriangleForward1866.entries.size = 32 := rfl

def entry1866 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1866.entries[i.val]'(by rw [size1866]; exact i.isLt)

theorem fields1866 (i : Fin 32) :
    (entry1866 i).IA = shift ∧ (entry1866 i).ID = S (173 + i.val + 1) ∧
      (entry1866 i).IC = S 174 ∧ (entry1866 i).Inext = T 173 (173 + i.val + 1) ∧
      (entry1866 i).Icur = T 173 (173 + i.val) ∧
      (entry1866 i).output = T 174 (173 + i.val) ∧
      (entry1866 i).charge = charge 173 (173 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1882_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1866 (i : Fin 32) :
    forwardStepOK (-768) (charge 173 (173 + i.val)) shift
      (S (173 + i.val + 1)) (S 174) (T 173 (173 + i.val + 1))
      (T 173 (173 + i.val)) (T 174 (173 + i.val))
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1866.entries OriginalRow227TriangleForward1866.checked
    ⟨i.val, by rw [size1866]; exact i.isLt⟩
  change (entry1866 i).check = true at h
  rcases fields1866 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1867 : OriginalRow227TriangleForward1867.entries.size = 32 := rfl

def entry1867 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1867.entries[i.val]'(by rw [size1867]; exact i.isLt)

theorem fields1867 (i : Fin 32) :
    (entry1867 i).IA = shift ∧ (entry1867 i).ID = S (205 + i.val + 1) ∧
      (entry1867 i).IC = S 174 ∧ (entry1867 i).Inext = T 173 (205 + i.val + 1) ∧
      (entry1867 i).Icur = T 173 (205 + i.val) ∧
      (entry1867 i).output = T 174 (205 + i.val) ∧
      (entry1867 i).charge = charge 173 (205 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1883_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1867 (i : Fin 32) :
    forwardStepOK (-768) (charge 173 (205 + i.val)) shift
      (S (205 + i.val + 1)) (S 174) (T 173 (205 + i.val + 1))
      (T 173 (205 + i.val)) (T 174 (205 + i.val))
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1867.entries OriginalRow227TriangleForward1867.checked
    ⟨i.val, by rw [size1867]; exact i.isLt⟩
  change (entry1867 i).check = true at h
  rcases fields1867 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1868 : OriginalRow227TriangleForward1868.entries.size = 32 := rfl

def entry1868 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1868.entries[i.val]'(by rw [size1868]; exact i.isLt)

theorem fields1868 (i : Fin 32) :
    (entry1868 i).IA = shift ∧ (entry1868 i).ID = S (237 + i.val + 1) ∧
      (entry1868 i).IC = S 174 ∧ (entry1868 i).Inext = T 173 (237 + i.val + 1) ∧
      (entry1868 i).Icur = T 173 (237 + i.val) ∧
      (entry1868 i).output = T 174 (237 + i.val) ∧
      (entry1868 i).charge = charge 173 (237 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1884_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1868 (i : Fin 32) :
    forwardStepOK (-768) (charge 173 (237 + i.val)) shift
      (S (237 + i.val + 1)) (S 174) (T 173 (237 + i.val + 1))
      (T 173 (237 + i.val)) (T 174 (237 + i.val))
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1868.entries OriginalRow227TriangleForward1868.checked
    ⟨i.val, by rw [size1868]; exact i.isLt⟩
  change (entry1868 i).check = true at h
  rcases fields1868 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1869 : OriginalRow227TriangleForward1869.entries.size = 32 := rfl

def entry1869 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1869.entries[i.val]'(by rw [size1869]; exact i.isLt)

theorem fields1869 (i : Fin 32) :
    (entry1869 i).IA = shift ∧ (entry1869 i).ID = S (269 + i.val + 1) ∧
      (entry1869 i).IC = S 174 ∧ (entry1869 i).Inext = T 173 (269 + i.val + 1) ∧
      (entry1869 i).Icur = T 173 (269 + i.val) ∧
      (entry1869 i).output = T 174 (269 + i.val) ∧
      (entry1869 i).charge = charge 173 (269 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1885_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1869 (i : Fin 32) :
    forwardStepOK (-768) (charge 173 (269 + i.val)) shift
      (S (269 + i.val + 1)) (S 174) (T 173 (269 + i.val + 1))
      (T 173 (269 + i.val)) (T 174 (269 + i.val))
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1869.entries OriginalRow227TriangleForward1869.checked
    ⟨i.val, by rw [size1869]; exact i.isLt⟩
  change (entry1869 i).check = true at h
  rcases fields1869 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1870 : OriginalRow227TriangleForward1870.entries.size = 27 := rfl

def entry1870 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1870.entries[i.val]'(by rw [size1870]; exact i.isLt)

theorem fields1870 (i : Fin 27) :
    (entry1870 i).IA = shift ∧ (entry1870 i).ID = S (301 + i.val + 1) ∧
      (entry1870 i).IC = S 174 ∧ (entry1870 i).Inext = T 173 (301 + i.val + 1) ∧
      (entry1870 i).Icur = T 173 (301 + i.val) ∧
      (entry1870 i).output = T 174 (301 + i.val) ∧
      (entry1870 i).charge = charge 173 (301 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root174).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow174.block1886_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1870 (i : Fin 27) :
    forwardStepOK (-768) (charge 173 (301 + i.val)) shift
      (S (301 + i.val + 1)) (S 174) (T 173 (301 + i.val + 1))
      (T 173 (301 + i.val)) (T 174 (301 + i.val))
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1870.entries OriginalRow227TriangleForward1870.checked
    ⟨i.val, by rw [size1870]; exact i.isLt⟩
  change (entry1870 i).check = true at h
  rcases fields1870 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 173 ≤ d) (hhi : d < 328) :
    forwardStepOK (-768) (charge 173 d) shift (S (d + 1)) (S 174)
      (T 173 (d + 1)) (T 173 d) (T 174 d)
      (OriginalRow227Roots.root_pos 174 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 173 (by decide)) = true := by
  by_cases h237 : d < 237
  ·
    by_cases h205 : d < 205
    ·
      have hi : d - 173 < 32 := by omega
      have heq : 173 + (d - 173) = d := by omega
      simpa only [heq] using step1866 ⟨d - 173, hi⟩
    ·
      have hi : d - 205 < 32 := by omega
      have heq : 205 + (d - 205) = d := by omega
      simpa only [heq] using step1867 ⟨d - 205, hi⟩
  ·
    by_cases h269 : d < 269
    ·
      have hi : d - 237 < 32 := by omega
      have heq : 237 + (d - 237) = d := by omega
      simpa only [heq] using step1868 ⟨d - 237, hi⟩
    ·
      by_cases h301 : d < 301
      ·
        have hi : d - 269 < 32 := by omega
        have heq : 269 + (d - 269) = d := by omega
        simpa only [heq] using step1869 ⟨d - 269, hi⟩
      ·
        have hi : d - 301 < 27 := by omega
        have heq : 301 + (d - 301) = d := by omega
        simpa only [heq] using step1870 ⟨d - 301, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.fields1866,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.step1866,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.fields1867,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.step1867,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.fields1868,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.step1868,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.fields1869,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.step1869,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.fields1870,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.step1870,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow174
