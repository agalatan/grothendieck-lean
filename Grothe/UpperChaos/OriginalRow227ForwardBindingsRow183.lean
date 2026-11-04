import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow183
import Grothe.UpperChaos.OriginalRow227TriangleForward1911
import Grothe.UpperChaos.OriginalRow227TriangleForward1912
import Grothe.UpperChaos.OriginalRow227TriangleForward1913
import Grothe.UpperChaos.OriginalRow227TriangleForward1914
import Grothe.UpperChaos.OriginalRow227TriangleForward1915

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1911 : OriginalRow227TriangleForward1911.entries.size = 32 := rfl

def entry1911 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1911.entries[i.val]'(by rw [size1911]; exact i.isLt)

theorem fields1911 (i : Fin 32) :
    (entry1911 i).IA = shift ∧ (entry1911 i).ID = S (182 + i.val + 1) ∧
      (entry1911 i).IC = S 183 ∧ (entry1911 i).Inext = T 182 (182 + i.val + 1) ∧
      (entry1911 i).Icur = T 182 (182 + i.val) ∧
      (entry1911 i).output = T 183 (182 + i.val) ∧
      (entry1911 i).charge = charge 182 (182 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1927_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1911 (i : Fin 32) :
    forwardStepOK (-768) (charge 182 (182 + i.val)) shift
      (S (182 + i.val + 1)) (S 183) (T 182 (182 + i.val + 1))
      (T 182 (182 + i.val)) (T 183 (182 + i.val))
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1911.entries OriginalRow227TriangleForward1911.checked
    ⟨i.val, by rw [size1911]; exact i.isLt⟩
  change (entry1911 i).check = true at h
  rcases fields1911 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1912 : OriginalRow227TriangleForward1912.entries.size = 32 := rfl

def entry1912 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1912.entries[i.val]'(by rw [size1912]; exact i.isLt)

theorem fields1912 (i : Fin 32) :
    (entry1912 i).IA = shift ∧ (entry1912 i).ID = S (214 + i.val + 1) ∧
      (entry1912 i).IC = S 183 ∧ (entry1912 i).Inext = T 182 (214 + i.val + 1) ∧
      (entry1912 i).Icur = T 182 (214 + i.val) ∧
      (entry1912 i).output = T 183 (214 + i.val) ∧
      (entry1912 i).charge = charge 182 (214 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1928_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1912 (i : Fin 32) :
    forwardStepOK (-768) (charge 182 (214 + i.val)) shift
      (S (214 + i.val + 1)) (S 183) (T 182 (214 + i.val + 1))
      (T 182 (214 + i.val)) (T 183 (214 + i.val))
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1912.entries OriginalRow227TriangleForward1912.checked
    ⟨i.val, by rw [size1912]; exact i.isLt⟩
  change (entry1912 i).check = true at h
  rcases fields1912 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1913 : OriginalRow227TriangleForward1913.entries.size = 32 := rfl

def entry1913 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1913.entries[i.val]'(by rw [size1913]; exact i.isLt)

theorem fields1913 (i : Fin 32) :
    (entry1913 i).IA = shift ∧ (entry1913 i).ID = S (246 + i.val + 1) ∧
      (entry1913 i).IC = S 183 ∧ (entry1913 i).Inext = T 182 (246 + i.val + 1) ∧
      (entry1913 i).Icur = T 182 (246 + i.val) ∧
      (entry1913 i).output = T 183 (246 + i.val) ∧
      (entry1913 i).charge = charge 182 (246 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1929_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1913 (i : Fin 32) :
    forwardStepOK (-768) (charge 182 (246 + i.val)) shift
      (S (246 + i.val + 1)) (S 183) (T 182 (246 + i.val + 1))
      (T 182 (246 + i.val)) (T 183 (246 + i.val))
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1913.entries OriginalRow227TriangleForward1913.checked
    ⟨i.val, by rw [size1913]; exact i.isLt⟩
  change (entry1913 i).check = true at h
  rcases fields1913 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1914 : OriginalRow227TriangleForward1914.entries.size = 32 := rfl

def entry1914 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1914.entries[i.val]'(by rw [size1914]; exact i.isLt)

theorem fields1914 (i : Fin 32) :
    (entry1914 i).IA = shift ∧ (entry1914 i).ID = S (278 + i.val + 1) ∧
      (entry1914 i).IC = S 183 ∧ (entry1914 i).Inext = T 182 (278 + i.val + 1) ∧
      (entry1914 i).Icur = T 182 (278 + i.val) ∧
      (entry1914 i).output = T 183 (278 + i.val) ∧
      (entry1914 i).charge = charge 182 (278 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1930_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1914 (i : Fin 32) :
    forwardStepOK (-768) (charge 182 (278 + i.val)) shift
      (S (278 + i.val + 1)) (S 183) (T 182 (278 + i.val + 1))
      (T 182 (278 + i.val)) (T 183 (278 + i.val))
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1914.entries OriginalRow227TriangleForward1914.checked
    ⟨i.val, by rw [size1914]; exact i.isLt⟩
  change (entry1914 i).check = true at h
  rcases fields1914 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1915 : OriginalRow227TriangleForward1915.entries.size = 9 := rfl

def entry1915 (i : Fin 9) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1915.entries[i.val]'(by rw [size1915]; exact i.isLt)

theorem fields1915 (i : Fin 9) :
    (entry1915 i).IA = shift ∧ (entry1915 i).ID = S (310 + i.val + 1) ∧
      (entry1915 i).IC = S 183 ∧ (entry1915 i).Inext = T 182 (310 + i.val + 1) ∧
      (entry1915 i).Icur = T 182 (310 + i.val) ∧
      (entry1915 i).output = T 183 (310 + i.val) ∧
      (entry1915 i).charge = charge 182 (310 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root183).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow183.block1931_value ⟨8, by decide⟩).symm, rfl⟩

theorem step1915 (i : Fin 9) :
    forwardStepOK (-768) (charge 182 (310 + i.val)) shift
      (S (310 + i.val + 1)) (S 183) (T 182 (310 + i.val + 1))
      (T 182 (310 + i.val)) (T 183 (310 + i.val))
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1915.entries OriginalRow227TriangleForward1915.checked
    ⟨i.val, by rw [size1915]; exact i.isLt⟩
  change (entry1915 i).check = true at h
  rcases fields1915 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 182 ≤ d) (hhi : d < 319) :
    forwardStepOK (-768) (charge 182 d) shift (S (d + 1)) (S 183)
      (T 182 (d + 1)) (T 182 d) (T 183 d)
      (OriginalRow227Roots.root_pos 183 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 182 (by decide)) = true := by
  by_cases h246 : d < 246
  ·
    by_cases h214 : d < 214
    ·
      have hi : d - 182 < 32 := by omega
      have heq : 182 + (d - 182) = d := by omega
      simpa only [heq] using step1911 ⟨d - 182, hi⟩
    ·
      have hi : d - 214 < 32 := by omega
      have heq : 214 + (d - 214) = d := by omega
      simpa only [heq] using step1912 ⟨d - 214, hi⟩
  ·
    by_cases h278 : d < 278
    ·
      have hi : d - 246 < 32 := by omega
      have heq : 246 + (d - 246) = d := by omega
      simpa only [heq] using step1913 ⟨d - 246, hi⟩
    ·
      by_cases h310 : d < 310
      ·
        have hi : d - 278 < 32 := by omega
        have heq : 278 + (d - 278) = d := by omega
        simpa only [heq] using step1914 ⟨d - 278, hi⟩
      ·
        have hi : d - 310 < 9 := by omega
        have heq : 310 + (d - 310) = d := by omega
        simpa only [heq] using step1915 ⟨d - 310, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.fields1911,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.step1911,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.fields1912,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.step1912,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.fields1913,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.step1913,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.fields1914,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.step1914,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.fields1915,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.step1915,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow183
