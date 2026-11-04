import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow176
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow177
import Grothe.UpperChaos.OriginalRow227TriangleForward1881
import Grothe.UpperChaos.OriginalRow227TriangleForward1882
import Grothe.UpperChaos.OriginalRow227TriangleForward1883
import Grothe.UpperChaos.OriginalRow227TriangleForward1884
import Grothe.UpperChaos.OriginalRow227TriangleForward1885

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1881 : OriginalRow227TriangleForward1881.entries.size = 32 := rfl

def entry1881 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1881.entries[i.val]'(by rw [size1881]; exact i.isLt)

theorem fields1881 (i : Fin 32) :
    (entry1881 i).IA = shift ∧ (entry1881 i).ID = S (176 + i.val + 1) ∧
      (entry1881 i).IC = S 177 ∧ (entry1881 i).Inext = T 176 (176 + i.val + 1) ∧
      (entry1881 i).Icur = T 176 (176 + i.val) ∧
      (entry1881 i).output = T 177 (176 + i.val) ∧
      (entry1881 i).charge = charge 176 (176 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root177).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root178).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root179).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1892_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1897_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1881 (i : Fin 32) :
    forwardStepOK (-768) (charge 176 (176 + i.val)) shift
      (S (176 + i.val + 1)) (S 177) (T 176 (176 + i.val + 1))
      (T 176 (176 + i.val)) (T 177 (176 + i.val))
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1881.entries OriginalRow227TriangleForward1881.checked
    ⟨i.val, by rw [size1881]; exact i.isLt⟩
  change (entry1881 i).check = true at h
  rcases fields1881 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1882 : OriginalRow227TriangleForward1882.entries.size = 32 := rfl

def entry1882 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1882.entries[i.val]'(by rw [size1882]; exact i.isLt)

theorem fields1882 (i : Fin 32) :
    (entry1882 i).IA = shift ∧ (entry1882 i).ID = S (208 + i.val + 1) ∧
      (entry1882 i).IC = S 177 ∧ (entry1882 i).Inext = T 176 (208 + i.val + 1) ∧
      (entry1882 i).Icur = T 176 (208 + i.val) ∧
      (entry1882 i).output = T 177 (208 + i.val) ∧
      (entry1882 i).charge = charge 176 (208 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1893_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1898_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1882 (i : Fin 32) :
    forwardStepOK (-768) (charge 176 (208 + i.val)) shift
      (S (208 + i.val + 1)) (S 177) (T 176 (208 + i.val + 1))
      (T 176 (208 + i.val)) (T 177 (208 + i.val))
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1882.entries OriginalRow227TriangleForward1882.checked
    ⟨i.val, by rw [size1882]; exact i.isLt⟩
  change (entry1882 i).check = true at h
  rcases fields1882 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1883 : OriginalRow227TriangleForward1883.entries.size = 32 := rfl

def entry1883 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1883.entries[i.val]'(by rw [size1883]; exact i.isLt)

theorem fields1883 (i : Fin 32) :
    (entry1883 i).IA = shift ∧ (entry1883 i).ID = S (240 + i.val + 1) ∧
      (entry1883 i).IC = S 177 ∧ (entry1883 i).Inext = T 176 (240 + i.val + 1) ∧
      (entry1883 i).Icur = T 176 (240 + i.val) ∧
      (entry1883 i).output = T 177 (240 + i.val) ∧
      (entry1883 i).charge = charge 176 (240 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1894_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1899_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1883 (i : Fin 32) :
    forwardStepOK (-768) (charge 176 (240 + i.val)) shift
      (S (240 + i.val + 1)) (S 177) (T 176 (240 + i.val + 1))
      (T 176 (240 + i.val)) (T 177 (240 + i.val))
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1883.entries OriginalRow227TriangleForward1883.checked
    ⟨i.val, by rw [size1883]; exact i.isLt⟩
  change (entry1883 i).check = true at h
  rcases fields1883 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1884 : OriginalRow227TriangleForward1884.entries.size = 32 := rfl

def entry1884 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1884.entries[i.val]'(by rw [size1884]; exact i.isLt)

theorem fields1884 (i : Fin 32) :
    (entry1884 i).IA = shift ∧ (entry1884 i).ID = S (272 + i.val + 1) ∧
      (entry1884 i).IC = S 177 ∧ (entry1884 i).Inext = T 176 (272 + i.val + 1) ∧
      (entry1884 i).Icur = T 176 (272 + i.val) ∧
      (entry1884 i).output = T 177 (272 + i.val) ∧
      (entry1884 i).charge = charge 176 (272 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1895_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1900_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1884 (i : Fin 32) :
    forwardStepOK (-768) (charge 176 (272 + i.val)) shift
      (S (272 + i.val + 1)) (S 177) (T 176 (272 + i.val + 1))
      (T 176 (272 + i.val)) (T 177 (272 + i.val))
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1884.entries OriginalRow227TriangleForward1884.checked
    ⟨i.val, by rw [size1884]; exact i.isLt⟩
  change (entry1884 i).check = true at h
  rcases fields1884 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1885 : OriginalRow227TriangleForward1885.entries.size = 21 := rfl

def entry1885 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1885.entries[i.val]'(by rw [size1885]; exact i.isLt)

theorem fields1885 (i : Fin 21) :
    (entry1885 i).IA = shift ∧ (entry1885 i).ID = S (304 + i.val + 1) ∧
      (entry1885 i).IC = S 177 ∧ (entry1885 i).Inext = T 176 (304 + i.val + 1) ∧
      (entry1885 i).Icur = T 176 (304 + i.val) ∧
      (entry1885 i).output = T 177 (304 + i.val) ∧
      (entry1885 i).charge = charge 176 (304 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root323).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root324).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root325).symm, (OriginalRow227RootBindings05.S_eq_root177).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow176.block1896_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow177.block1901_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1885 (i : Fin 21) :
    forwardStepOK (-768) (charge 176 (304 + i.val)) shift
      (S (304 + i.val + 1)) (S 177) (T 176 (304 + i.val + 1))
      (T 176 (304 + i.val)) (T 177 (304 + i.val))
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1885.entries OriginalRow227TriangleForward1885.checked
    ⟨i.val, by rw [size1885]; exact i.isLt⟩
  change (entry1885 i).check = true at h
  rcases fields1885 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 176 ≤ d) (hhi : d < 325) :
    forwardStepOK (-768) (charge 176 d) shift (S (d + 1)) (S 177)
      (T 176 (d + 1)) (T 176 d) (T 177 d)
      (OriginalRow227Roots.root_pos 177 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 176 (by decide)) = true := by
  by_cases h240 : d < 240
  ·
    by_cases h208 : d < 208
    ·
      have hi : d - 176 < 32 := by omega
      have heq : 176 + (d - 176) = d := by omega
      simpa only [heq] using step1881 ⟨d - 176, hi⟩
    ·
      have hi : d - 208 < 32 := by omega
      have heq : 208 + (d - 208) = d := by omega
      simpa only [heq] using step1882 ⟨d - 208, hi⟩
  ·
    by_cases h272 : d < 272
    ·
      have hi : d - 240 < 32 := by omega
      have heq : 240 + (d - 240) = d := by omega
      simpa only [heq] using step1883 ⟨d - 240, hi⟩
    ·
      by_cases h304 : d < 304
      ·
        have hi : d - 272 < 32 := by omega
        have heq : 272 + (d - 272) = d := by omega
        simpa only [heq] using step1884 ⟨d - 272, hi⟩
      ·
        have hi : d - 304 < 21 := by omega
        have heq : 304 + (d - 304) = d := by omega
        simpa only [heq] using step1885 ⟨d - 304, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.fields1881,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.step1881,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.fields1882,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.step1882,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.fields1883,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.step1883,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.fields1884,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.step1884,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.fields1885,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.step1885,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow177
