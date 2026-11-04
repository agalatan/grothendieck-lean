import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow179
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180
import Grothe.UpperChaos.OriginalRow227TriangleForward1896
import Grothe.UpperChaos.OriginalRow227TriangleForward1897
import Grothe.UpperChaos.OriginalRow227TriangleForward1898
import Grothe.UpperChaos.OriginalRow227TriangleForward1899
import Grothe.UpperChaos.OriginalRow227TriangleForward1900

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1896 : OriginalRow227TriangleForward1896.entries.size = 32 := rfl

def entry1896 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1896.entries[i.val]'(by rw [size1896]; exact i.isLt)

theorem fields1896 (i : Fin 32) :
    (entry1896 i).IA = shift ∧ (entry1896 i).ID = S (179 + i.val + 1) ∧
      (entry1896 i).IC = S 180 ∧ (entry1896 i).Inext = T 179 (179 + i.val + 1) ∧
      (entry1896 i).Icur = T 179 (179 + i.val) ∧
      (entry1896 i).output = T 180 (179 + i.val) ∧
      (entry1896 i).charge = charge 179 (179 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root180).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1907_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1896 (i : Fin 32) :
    forwardStepOK (-768) (charge 179 (179 + i.val)) shift
      (S (179 + i.val + 1)) (S 180) (T 179 (179 + i.val + 1))
      (T 179 (179 + i.val)) (T 180 (179 + i.val))
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1896.entries OriginalRow227TriangleForward1896.checked
    ⟨i.val, by rw [size1896]; exact i.isLt⟩
  change (entry1896 i).check = true at h
  rcases fields1896 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1897 : OriginalRow227TriangleForward1897.entries.size = 32 := rfl

def entry1897 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1897.entries[i.val]'(by rw [size1897]; exact i.isLt)

theorem fields1897 (i : Fin 32) :
    (entry1897 i).IA = shift ∧ (entry1897 i).ID = S (211 + i.val + 1) ∧
      (entry1897 i).IC = S 180 ∧ (entry1897 i).Inext = T 179 (211 + i.val + 1) ∧
      (entry1897 i).Icur = T 179 (211 + i.val) ∧
      (entry1897 i).output = T 180 (211 + i.val) ∧
      (entry1897 i).charge = charge 179 (211 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1908_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1897 (i : Fin 32) :
    forwardStepOK (-768) (charge 179 (211 + i.val)) shift
      (S (211 + i.val + 1)) (S 180) (T 179 (211 + i.val + 1))
      (T 179 (211 + i.val)) (T 180 (211 + i.val))
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1897.entries OriginalRow227TriangleForward1897.checked
    ⟨i.val, by rw [size1897]; exact i.isLt⟩
  change (entry1897 i).check = true at h
  rcases fields1897 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1898 : OriginalRow227TriangleForward1898.entries.size = 32 := rfl

def entry1898 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1898.entries[i.val]'(by rw [size1898]; exact i.isLt)

theorem fields1898 (i : Fin 32) :
    (entry1898 i).IA = shift ∧ (entry1898 i).ID = S (243 + i.val + 1) ∧
      (entry1898 i).IC = S 180 ∧ (entry1898 i).Inext = T 179 (243 + i.val + 1) ∧
      (entry1898 i).Icur = T 179 (243 + i.val) ∧
      (entry1898 i).output = T 180 (243 + i.val) ∧
      (entry1898 i).charge = charge 179 (243 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1909_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1898 (i : Fin 32) :
    forwardStepOK (-768) (charge 179 (243 + i.val)) shift
      (S (243 + i.val + 1)) (S 180) (T 179 (243 + i.val + 1))
      (T 179 (243 + i.val)) (T 180 (243 + i.val))
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1898.entries OriginalRow227TriangleForward1898.checked
    ⟨i.val, by rw [size1898]; exact i.isLt⟩
  change (entry1898 i).check = true at h
  rcases fields1898 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1899 : OriginalRow227TriangleForward1899.entries.size = 32 := rfl

def entry1899 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1899.entries[i.val]'(by rw [size1899]; exact i.isLt)

theorem fields1899 (i : Fin 32) :
    (entry1899 i).IA = shift ∧ (entry1899 i).ID = S (275 + i.val + 1) ∧
      (entry1899 i).IC = S 180 ∧ (entry1899 i).Inext = T 179 (275 + i.val + 1) ∧
      (entry1899 i).Icur = T 179 (275 + i.val) ∧
      (entry1899 i).output = T 180 (275 + i.val) ∧
      (entry1899 i).charge = charge 179 (275 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1910_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1899 (i : Fin 32) :
    forwardStepOK (-768) (charge 179 (275 + i.val)) shift
      (S (275 + i.val + 1)) (S 180) (T 179 (275 + i.val + 1))
      (T 179 (275 + i.val)) (T 180 (275 + i.val))
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1899.entries OriginalRow227TriangleForward1899.checked
    ⟨i.val, by rw [size1899]; exact i.isLt⟩
  change (entry1899 i).check = true at h
  rcases fields1899 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1900 : OriginalRow227TriangleForward1900.entries.size = 15 := rfl

def entry1900 (i : Fin 15) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1900.entries[i.val]'(by rw [size1900]; exact i.isLt)

theorem fields1900 (i : Fin 15) :
    (entry1900 i).IA = shift ∧ (entry1900 i).ID = S (307 + i.val + 1) ∧
      (entry1900 i).IC = S 180 ∧ (entry1900 i).Inext = T 179 (307 + i.val + 1) ∧
      (entry1900 i).Icur = T 179 (307 + i.val) ∧
      (entry1900 i).output = T 180 (307 + i.val) ∧
      (entry1900 i).charge = charge 179 (307 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root322).symm, (OriginalRow227RootBindings05.S_eq_root180).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow179.block1911_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨14, by decide⟩).symm, rfl⟩

theorem step1900 (i : Fin 15) :
    forwardStepOK (-768) (charge 179 (307 + i.val)) shift
      (S (307 + i.val + 1)) (S 180) (T 179 (307 + i.val + 1))
      (T 179 (307 + i.val)) (T 180 (307 + i.val))
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1900.entries OriginalRow227TriangleForward1900.checked
    ⟨i.val, by rw [size1900]; exact i.isLt⟩
  change (entry1900 i).check = true at h
  rcases fields1900 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 179 ≤ d) (hhi : d < 322) :
    forwardStepOK (-768) (charge 179 d) shift (S (d + 1)) (S 180)
      (T 179 (d + 1)) (T 179 d) (T 180 d)
      (OriginalRow227Roots.root_pos 180 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 179 (by decide)) = true := by
  by_cases h243 : d < 243
  ·
    by_cases h211 : d < 211
    ·
      have hi : d - 179 < 32 := by omega
      have heq : 179 + (d - 179) = d := by omega
      simpa only [heq] using step1896 ⟨d - 179, hi⟩
    ·
      have hi : d - 211 < 32 := by omega
      have heq : 211 + (d - 211) = d := by omega
      simpa only [heq] using step1897 ⟨d - 211, hi⟩
  ·
    by_cases h275 : d < 275
    ·
      have hi : d - 243 < 32 := by omega
      have heq : 243 + (d - 243) = d := by omega
      simpa only [heq] using step1898 ⟨d - 243, hi⟩
    ·
      by_cases h307 : d < 307
      ·
        have hi : d - 275 < 32 := by omega
        have heq : 275 + (d - 275) = d := by omega
        simpa only [heq] using step1899 ⟨d - 275, hi⟩
      ·
        have hi : d - 307 < 15 := by omega
        have heq : 307 + (d - 307) = d := by omega
        simpa only [heq] using step1900 ⟨d - 307, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.fields1896,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.step1896,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.fields1897,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.step1897,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.fields1898,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.step1898,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.fields1899,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.step1899,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.fields1900,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.step1900,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow180
