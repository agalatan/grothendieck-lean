import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow182
import Grothe.UpperChaos.OriginalRow227TriangleForward1906
import Grothe.UpperChaos.OriginalRow227TriangleForward1907
import Grothe.UpperChaos.OriginalRow227TriangleForward1908
import Grothe.UpperChaos.OriginalRow227TriangleForward1909
import Grothe.UpperChaos.OriginalRow227TriangleForward1910

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1906 : OriginalRow227TriangleForward1906.entries.size = 32 := rfl

def entry1906 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1906.entries[i.val]'(by rw [size1906]; exact i.isLt)

theorem fields1906 (i : Fin 32) :
    (entry1906 i).IA = shift ∧ (entry1906 i).ID = S (181 + i.val + 1) ∧
      (entry1906 i).IC = S 182 ∧ (entry1906 i).Inext = T 181 (181 + i.val + 1) ∧
      (entry1906 i).Icur = T 181 (181 + i.val) ∧
      (entry1906 i).output = T 182 (181 + i.val) ∧
      (entry1906 i).charge = charge 181 (181 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1922_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1906 (i : Fin 32) :
    forwardStepOK (-768) (charge 181 (181 + i.val)) shift
      (S (181 + i.val + 1)) (S 182) (T 181 (181 + i.val + 1))
      (T 181 (181 + i.val)) (T 182 (181 + i.val))
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1906.entries OriginalRow227TriangleForward1906.checked
    ⟨i.val, by rw [size1906]; exact i.isLt⟩
  change (entry1906 i).check = true at h
  rcases fields1906 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1907 : OriginalRow227TriangleForward1907.entries.size = 32 := rfl

def entry1907 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1907.entries[i.val]'(by rw [size1907]; exact i.isLt)

theorem fields1907 (i : Fin 32) :
    (entry1907 i).IA = shift ∧ (entry1907 i).ID = S (213 + i.val + 1) ∧
      (entry1907 i).IC = S 182 ∧ (entry1907 i).Inext = T 181 (213 + i.val + 1) ∧
      (entry1907 i).Icur = T 181 (213 + i.val) ∧
      (entry1907 i).output = T 182 (213 + i.val) ∧
      (entry1907 i).charge = charge 181 (213 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1923_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1907 (i : Fin 32) :
    forwardStepOK (-768) (charge 181 (213 + i.val)) shift
      (S (213 + i.val + 1)) (S 182) (T 181 (213 + i.val + 1))
      (T 181 (213 + i.val)) (T 182 (213 + i.val))
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1907.entries OriginalRow227TriangleForward1907.checked
    ⟨i.val, by rw [size1907]; exact i.isLt⟩
  change (entry1907 i).check = true at h
  rcases fields1907 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1908 : OriginalRow227TriangleForward1908.entries.size = 32 := rfl

def entry1908 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1908.entries[i.val]'(by rw [size1908]; exact i.isLt)

theorem fields1908 (i : Fin 32) :
    (entry1908 i).IA = shift ∧ (entry1908 i).ID = S (245 + i.val + 1) ∧
      (entry1908 i).IC = S 182 ∧ (entry1908 i).Inext = T 181 (245 + i.val + 1) ∧
      (entry1908 i).Icur = T 181 (245 + i.val) ∧
      (entry1908 i).output = T 182 (245 + i.val) ∧
      (entry1908 i).charge = charge 181 (245 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1924_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1908 (i : Fin 32) :
    forwardStepOK (-768) (charge 181 (245 + i.val)) shift
      (S (245 + i.val + 1)) (S 182) (T 181 (245 + i.val + 1))
      (T 181 (245 + i.val)) (T 182 (245 + i.val))
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1908.entries OriginalRow227TriangleForward1908.checked
    ⟨i.val, by rw [size1908]; exact i.isLt⟩
  change (entry1908 i).check = true at h
  rcases fields1908 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1909 : OriginalRow227TriangleForward1909.entries.size = 32 := rfl

def entry1909 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1909.entries[i.val]'(by rw [size1909]; exact i.isLt)

theorem fields1909 (i : Fin 32) :
    (entry1909 i).IA = shift ∧ (entry1909 i).ID = S (277 + i.val + 1) ∧
      (entry1909 i).IC = S 182 ∧ (entry1909 i).Inext = T 181 (277 + i.val + 1) ∧
      (entry1909 i).Icur = T 181 (277 + i.val) ∧
      (entry1909 i).output = T 182 (277 + i.val) ∧
      (entry1909 i).charge = charge 181 (277 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1925_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1909 (i : Fin 32) :
    forwardStepOK (-768) (charge 181 (277 + i.val)) shift
      (S (277 + i.val + 1)) (S 182) (T 181 (277 + i.val + 1))
      (T 181 (277 + i.val)) (T 182 (277 + i.val))
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1909.entries OriginalRow227TriangleForward1909.checked
    ⟨i.val, by rw [size1909]; exact i.isLt⟩
  change (entry1909 i).check = true at h
  rcases fields1909 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1910 : OriginalRow227TriangleForward1910.entries.size = 11 := rfl

def entry1910 (i : Fin 11) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1910.entries[i.val]'(by rw [size1910]; exact i.isLt)

theorem fields1910 (i : Fin 11) :
    (entry1910 i).IA = shift ∧ (entry1910 i).ID = S (309 + i.val + 1) ∧
      (entry1910 i).IC = S 182 ∧ (entry1910 i).Inext = T 181 (309 + i.val + 1) ∧
      (entry1910 i).Icur = T 181 (309 + i.val) ∧
      (entry1910 i).output = T 182 (309 + i.val) ∧
      (entry1910 i).charge = charge 181 (309 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root182).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow182.block1926_value ⟨10, by decide⟩).symm, rfl⟩

theorem step1910 (i : Fin 11) :
    forwardStepOK (-768) (charge 181 (309 + i.val)) shift
      (S (309 + i.val + 1)) (S 182) (T 181 (309 + i.val + 1))
      (T 181 (309 + i.val)) (T 182 (309 + i.val))
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1910.entries OriginalRow227TriangleForward1910.checked
    ⟨i.val, by rw [size1910]; exact i.isLt⟩
  change (entry1910 i).check = true at h
  rcases fields1910 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 181 ≤ d) (hhi : d < 320) :
    forwardStepOK (-768) (charge 181 d) shift (S (d + 1)) (S 182)
      (T 181 (d + 1)) (T 181 d) (T 182 d)
      (OriginalRow227Roots.root_pos 182 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 181 (by decide)) = true := by
  by_cases h245 : d < 245
  ·
    by_cases h213 : d < 213
    ·
      have hi : d - 181 < 32 := by omega
      have heq : 181 + (d - 181) = d := by omega
      simpa only [heq] using step1906 ⟨d - 181, hi⟩
    ·
      have hi : d - 213 < 32 := by omega
      have heq : 213 + (d - 213) = d := by omega
      simpa only [heq] using step1907 ⟨d - 213, hi⟩
  ·
    by_cases h277 : d < 277
    ·
      have hi : d - 245 < 32 := by omega
      have heq : 245 + (d - 245) = d := by omega
      simpa only [heq] using step1908 ⟨d - 245, hi⟩
    ·
      by_cases h309 : d < 309
      ·
        have hi : d - 277 < 32 := by omega
        have heq : 277 + (d - 277) = d := by omega
        simpa only [heq] using step1909 ⟨d - 277, hi⟩
      ·
        have hi : d - 309 < 11 := by omega
        have heq : 309 + (d - 309) = d := by omega
        simpa only [heq] using step1910 ⟨d - 309, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.fields1906,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.step1906,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.fields1907,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.step1907,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.fields1908,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.step1908,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.fields1909,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.step1909,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.fields1910,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.step1910,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow182
