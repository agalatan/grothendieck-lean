import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow172
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow173
import Grothe.UpperChaos.OriginalRow227TriangleForward1861
import Grothe.UpperChaos.OriginalRow227TriangleForward1862
import Grothe.UpperChaos.OriginalRow227TriangleForward1863
import Grothe.UpperChaos.OriginalRow227TriangleForward1864
import Grothe.UpperChaos.OriginalRow227TriangleForward1865

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1861 : OriginalRow227TriangleForward1861.entries.size = 32 := rfl

def entry1861 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1861.entries[i.val]'(by rw [size1861]; exact i.isLt)

theorem fields1861 (i : Fin 32) :
    (entry1861 i).IA = shift ∧ (entry1861 i).ID = S (172 + i.val + 1) ∧
      (entry1861 i).IC = S 173 ∧ (entry1861 i).Inext = T 172 (172 + i.val + 1) ∧
      (entry1861 i).Icur = T 172 (172 + i.val) ∧
      (entry1861 i).output = T 173 (172 + i.val) ∧
      (entry1861 i).charge = charge 172 (172 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1872_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1877_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1861 (i : Fin 32) :
    forwardStepOK (-768) (charge 172 (172 + i.val)) shift
      (S (172 + i.val + 1)) (S 173) (T 172 (172 + i.val + 1))
      (T 172 (172 + i.val)) (T 173 (172 + i.val))
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1861.entries OriginalRow227TriangleForward1861.checked
    ⟨i.val, by rw [size1861]; exact i.isLt⟩
  change (entry1861 i).check = true at h
  rcases fields1861 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1862 : OriginalRow227TriangleForward1862.entries.size = 32 := rfl

def entry1862 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1862.entries[i.val]'(by rw [size1862]; exact i.isLt)

theorem fields1862 (i : Fin 32) :
    (entry1862 i).IA = shift ∧ (entry1862 i).ID = S (204 + i.val + 1) ∧
      (entry1862 i).IC = S 173 ∧ (entry1862 i).Inext = T 172 (204 + i.val + 1) ∧
      (entry1862 i).Icur = T 172 (204 + i.val) ∧
      (entry1862 i).output = T 173 (204 + i.val) ∧
      (entry1862 i).charge = charge 172 (204 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1873_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1878_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1862 (i : Fin 32) :
    forwardStepOK (-768) (charge 172 (204 + i.val)) shift
      (S (204 + i.val + 1)) (S 173) (T 172 (204 + i.val + 1))
      (T 172 (204 + i.val)) (T 173 (204 + i.val))
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1862.entries OriginalRow227TriangleForward1862.checked
    ⟨i.val, by rw [size1862]; exact i.isLt⟩
  change (entry1862 i).check = true at h
  rcases fields1862 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1863 : OriginalRow227TriangleForward1863.entries.size = 32 := rfl

def entry1863 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1863.entries[i.val]'(by rw [size1863]; exact i.isLt)

theorem fields1863 (i : Fin 32) :
    (entry1863 i).IA = shift ∧ (entry1863 i).ID = S (236 + i.val + 1) ∧
      (entry1863 i).IC = S 173 ∧ (entry1863 i).Inext = T 172 (236 + i.val + 1) ∧
      (entry1863 i).Icur = T 172 (236 + i.val) ∧
      (entry1863 i).output = T 173 (236 + i.val) ∧
      (entry1863 i).charge = charge 172 (236 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1874_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1879_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1863 (i : Fin 32) :
    forwardStepOK (-768) (charge 172 (236 + i.val)) shift
      (S (236 + i.val + 1)) (S 173) (T 172 (236 + i.val + 1))
      (T 172 (236 + i.val)) (T 173 (236 + i.val))
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1863.entries OriginalRow227TriangleForward1863.checked
    ⟨i.val, by rw [size1863]; exact i.isLt⟩
  change (entry1863 i).check = true at h
  rcases fields1863 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1864 : OriginalRow227TriangleForward1864.entries.size = 32 := rfl

def entry1864 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1864.entries[i.val]'(by rw [size1864]; exact i.isLt)

theorem fields1864 (i : Fin 32) :
    (entry1864 i).IA = shift ∧ (entry1864 i).ID = S (268 + i.val + 1) ∧
      (entry1864 i).IC = S 173 ∧ (entry1864 i).Inext = T 172 (268 + i.val + 1) ∧
      (entry1864 i).Icur = T 172 (268 + i.val) ∧
      (entry1864 i).output = T 173 (268 + i.val) ∧
      (entry1864 i).charge = charge 172 (268 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1875_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1880_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1864 (i : Fin 32) :
    forwardStepOK (-768) (charge 172 (268 + i.val)) shift
      (S (268 + i.val + 1)) (S 173) (T 172 (268 + i.val + 1))
      (T 172 (268 + i.val)) (T 173 (268 + i.val))
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1864.entries OriginalRow227TriangleForward1864.checked
    ⟨i.val, by rw [size1864]; exact i.isLt⟩
  change (entry1864 i).check = true at h
  rcases fields1864 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1865 : OriginalRow227TriangleForward1865.entries.size = 29 := rfl

def entry1865 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1865.entries[i.val]'(by rw [size1865]; exact i.isLt)

theorem fields1865 (i : Fin 29) :
    (entry1865 i).IA = shift ∧ (entry1865 i).ID = S (300 + i.val + 1) ∧
      (entry1865 i).IC = S 173 ∧ (entry1865 i).Inext = T 172 (300 + i.val + 1) ∧
      (entry1865 i).Icur = T 172 (300 + i.val) ∧
      (entry1865 i).output = T 173 (300 + i.val) ∧
      (entry1865 i).charge = charge 172 (300 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root173).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow172.block1876_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow173.block1881_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1865 (i : Fin 29) :
    forwardStepOK (-768) (charge 172 (300 + i.val)) shift
      (S (300 + i.val + 1)) (S 173) (T 172 (300 + i.val + 1))
      (T 172 (300 + i.val)) (T 173 (300 + i.val))
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1865.entries OriginalRow227TriangleForward1865.checked
    ⟨i.val, by rw [size1865]; exact i.isLt⟩
  change (entry1865 i).check = true at h
  rcases fields1865 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 172 ≤ d) (hhi : d < 329) :
    forwardStepOK (-768) (charge 172 d) shift (S (d + 1)) (S 173)
      (T 172 (d + 1)) (T 172 d) (T 173 d)
      (OriginalRow227Roots.root_pos 173 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 172 (by decide)) = true := by
  by_cases h236 : d < 236
  ·
    by_cases h204 : d < 204
    ·
      have hi : d - 172 < 32 := by omega
      have heq : 172 + (d - 172) = d := by omega
      simpa only [heq] using step1861 ⟨d - 172, hi⟩
    ·
      have hi : d - 204 < 32 := by omega
      have heq : 204 + (d - 204) = d := by omega
      simpa only [heq] using step1862 ⟨d - 204, hi⟩
  ·
    by_cases h268 : d < 268
    ·
      have hi : d - 236 < 32 := by omega
      have heq : 236 + (d - 236) = d := by omega
      simpa only [heq] using step1863 ⟨d - 236, hi⟩
    ·
      by_cases h300 : d < 300
      ·
        have hi : d - 268 < 32 := by omega
        have heq : 268 + (d - 268) = d := by omega
        simpa only [heq] using step1864 ⟨d - 268, hi⟩
      ·
        have hi : d - 300 < 29 := by omega
        have heq : 300 + (d - 300) = d := by omega
        simpa only [heq] using step1865 ⟨d - 300, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.fields1861,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.step1861,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.fields1862,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.step1862,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.fields1863,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.step1863,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.fields1864,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.step1864,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.fields1865,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.step1865,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow173
