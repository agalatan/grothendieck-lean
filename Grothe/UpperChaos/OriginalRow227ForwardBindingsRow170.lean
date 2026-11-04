import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow169
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow170
import Grothe.UpperChaos.OriginalRow227TriangleForward1844
import Grothe.UpperChaos.OriginalRow227TriangleForward1845
import Grothe.UpperChaos.OriginalRow227TriangleForward1846
import Grothe.UpperChaos.OriginalRow227TriangleForward1847
import Grothe.UpperChaos.OriginalRow227TriangleForward1848
import Grothe.UpperChaos.OriginalRow227TriangleForward1849

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1844 : OriginalRow227TriangleForward1844.entries.size = 32 := rfl

def entry1844 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1844.entries[i.val]'(by rw [size1844]; exact i.isLt)

theorem fields1844 (i : Fin 32) :
    (entry1844 i).IA = shift ∧ (entry1844 i).ID = S (169 + i.val + 1) ∧
      (entry1844 i).IC = S 170 ∧ (entry1844 i).Inext = T 169 (169 + i.val + 1) ∧
      (entry1844 i).Icur = T 169 (169 + i.val) ∧
      (entry1844 i).output = T 170 (169 + i.val) ∧
      (entry1844 i).charge = charge 169 (169 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root170).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root171).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root172).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root173).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root174).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root175).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root176).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1854_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1860_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1844 (i : Fin 32) :
    forwardStepOK (-768) (charge 169 (169 + i.val)) shift
      (S (169 + i.val + 1)) (S 170) (T 169 (169 + i.val + 1))
      (T 169 (169 + i.val)) (T 170 (169 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1844.entries OriginalRow227TriangleForward1844.checked
    ⟨i.val, by rw [size1844]; exact i.isLt⟩
  change (entry1844 i).check = true at h
  rcases fields1844 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1845 : OriginalRow227TriangleForward1845.entries.size = 32 := rfl

def entry1845 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1845.entries[i.val]'(by rw [size1845]; exact i.isLt)

theorem fields1845 (i : Fin 32) :
    (entry1845 i).IA = shift ∧ (entry1845 i).ID = S (201 + i.val + 1) ∧
      (entry1845 i).IC = S 170 ∧ (entry1845 i).Inext = T 169 (201 + i.val + 1) ∧
      (entry1845 i).Icur = T 169 (201 + i.val) ∧
      (entry1845 i).output = T 170 (201 + i.val) ∧
      (entry1845 i).charge = charge 169 (201 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1855_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1861_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1845 (i : Fin 32) :
    forwardStepOK (-768) (charge 169 (201 + i.val)) shift
      (S (201 + i.val + 1)) (S 170) (T 169 (201 + i.val + 1))
      (T 169 (201 + i.val)) (T 170 (201 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1845.entries OriginalRow227TriangleForward1845.checked
    ⟨i.val, by rw [size1845]; exact i.isLt⟩
  change (entry1845 i).check = true at h
  rcases fields1845 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1846 : OriginalRow227TriangleForward1846.entries.size = 32 := rfl

def entry1846 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1846.entries[i.val]'(by rw [size1846]; exact i.isLt)

theorem fields1846 (i : Fin 32) :
    (entry1846 i).IA = shift ∧ (entry1846 i).ID = S (233 + i.val + 1) ∧
      (entry1846 i).IC = S 170 ∧ (entry1846 i).Inext = T 169 (233 + i.val + 1) ∧
      (entry1846 i).Icur = T 169 (233 + i.val) ∧
      (entry1846 i).output = T 170 (233 + i.val) ∧
      (entry1846 i).charge = charge 169 (233 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1856_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1862_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1846 (i : Fin 32) :
    forwardStepOK (-768) (charge 169 (233 + i.val)) shift
      (S (233 + i.val + 1)) (S 170) (T 169 (233 + i.val + 1))
      (T 169 (233 + i.val)) (T 170 (233 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1846.entries OriginalRow227TriangleForward1846.checked
    ⟨i.val, by rw [size1846]; exact i.isLt⟩
  change (entry1846 i).check = true at h
  rcases fields1846 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1847 : OriginalRow227TriangleForward1847.entries.size = 32 := rfl

def entry1847 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1847.entries[i.val]'(by rw [size1847]; exact i.isLt)

theorem fields1847 (i : Fin 32) :
    (entry1847 i).IA = shift ∧ (entry1847 i).ID = S (265 + i.val + 1) ∧
      (entry1847 i).IC = S 170 ∧ (entry1847 i).Inext = T 169 (265 + i.val + 1) ∧
      (entry1847 i).Icur = T 169 (265 + i.val) ∧
      (entry1847 i).output = T 170 (265 + i.val) ∧
      (entry1847 i).charge = charge 169 (265 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1857_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1863_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1847 (i : Fin 32) :
    forwardStepOK (-768) (charge 169 (265 + i.val)) shift
      (S (265 + i.val + 1)) (S 170) (T 169 (265 + i.val + 1))
      (T 169 (265 + i.val)) (T 170 (265 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1847.entries OriginalRow227TriangleForward1847.checked
    ⟨i.val, by rw [size1847]; exact i.isLt⟩
  change (entry1847 i).check = true at h
  rcases fields1847 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1848 : OriginalRow227TriangleForward1848.entries.size = 32 := rfl

def entry1848 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1848.entries[i.val]'(by rw [size1848]; exact i.isLt)

theorem fields1848 (i : Fin 32) :
    (entry1848 i).IA = shift ∧ (entry1848 i).ID = S (297 + i.val + 1) ∧
      (entry1848 i).IC = S 170 ∧ (entry1848 i).Inext = T 169 (297 + i.val + 1) ∧
      (entry1848 i).Icur = T 169 (297 + i.val) ∧
      (entry1848 i).output = T 170 (297 + i.val) ∧
      (entry1848 i).charge = charge 169 (297 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root326).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root327).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root328).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1858_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root329).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1864_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1848 (i : Fin 32) :
    forwardStepOK (-768) (charge 169 (297 + i.val)) shift
      (S (297 + i.val + 1)) (S 170) (T 169 (297 + i.val + 1))
      (T 169 (297 + i.val)) (T 170 (297 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1848.entries OriginalRow227TriangleForward1848.checked
    ⟨i.val, by rw [size1848]; exact i.isLt⟩
  change (entry1848 i).check = true at h
  rcases fields1848 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1849 : OriginalRow227TriangleForward1849.entries.size = 3 := rfl

def entry1849 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1849.entries[i.val]'(by rw [size1849]; exact i.isLt)

theorem fields1849 (i : Fin 3) :
    (entry1849 i).IA = shift ∧ (entry1849 i).ID = S (329 + i.val + 1) ∧
      (entry1849 i).IC = S 170 ∧ (entry1849 i).Inext = T 169 (329 + i.val + 1) ∧
      (entry1849 i).Icur = T 169 (329 + i.val) ∧
      (entry1849 i).output = T 170 (329 + i.val) ∧
      (entry1849 i).charge = charge 169 (329 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root330).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root331).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root332).symm, (OriginalRow227RootBindings05.S_eq_root170).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow169.block1859_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow170.block1865_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1849 (i : Fin 3) :
    forwardStepOK (-768) (charge 169 (329 + i.val)) shift
      (S (329 + i.val + 1)) (S 170) (T 169 (329 + i.val + 1))
      (T 169 (329 + i.val)) (T 170 (329 + i.val))
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1849.entries OriginalRow227TriangleForward1849.checked
    ⟨i.val, by rw [size1849]; exact i.isLt⟩
  change (entry1849 i).check = true at h
  rcases fields1849 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 169 ≤ d) (hhi : d < 332) :
    forwardStepOK (-768) (charge 169 d) shift (S (d + 1)) (S 170)
      (T 169 (d + 1)) (T 169 d) (T 170 d)
      (OriginalRow227Roots.root_pos 170 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 169 (by decide)) = true := by
  by_cases h265 : d < 265
  ·
    by_cases h201 : d < 201
    ·
      have hi : d - 169 < 32 := by omega
      have heq : 169 + (d - 169) = d := by omega
      simpa only [heq] using step1844 ⟨d - 169, hi⟩
    ·
      by_cases h233 : d < 233
      ·
        have hi : d - 201 < 32 := by omega
        have heq : 201 + (d - 201) = d := by omega
        simpa only [heq] using step1845 ⟨d - 201, hi⟩
      ·
        have hi : d - 233 < 32 := by omega
        have heq : 233 + (d - 233) = d := by omega
        simpa only [heq] using step1846 ⟨d - 233, hi⟩
  ·
    by_cases h297 : d < 297
    ·
      have hi : d - 265 < 32 := by omega
      have heq : 265 + (d - 265) = d := by omega
      simpa only [heq] using step1847 ⟨d - 265, hi⟩
    ·
      by_cases h329 : d < 329
      ·
        have hi : d - 297 < 32 := by omega
        have heq : 297 + (d - 297) = d := by omega
        simpa only [heq] using step1848 ⟨d - 297, hi⟩
      ·
        have hi : d - 329 < 3 := by omega
        have heq : 329 + (d - 329) = d := by omega
        simpa only [heq] using step1849 ⟨d - 329, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1844,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1844,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1845,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1845,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1846,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1846,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1847,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1847,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1848,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1848,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.fields1849,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.step1849,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow170
