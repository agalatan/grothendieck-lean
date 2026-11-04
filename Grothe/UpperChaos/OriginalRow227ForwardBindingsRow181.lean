import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow180
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow181
import Grothe.UpperChaos.OriginalRow227TriangleForward1901
import Grothe.UpperChaos.OriginalRow227TriangleForward1902
import Grothe.UpperChaos.OriginalRow227TriangleForward1903
import Grothe.UpperChaos.OriginalRow227TriangleForward1904
import Grothe.UpperChaos.OriginalRow227TriangleForward1905

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1901 : OriginalRow227TriangleForward1901.entries.size = 32 := rfl

def entry1901 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1901.entries[i.val]'(by rw [size1901]; exact i.isLt)

theorem fields1901 (i : Fin 32) :
    (entry1901 i).IA = shift ∧ (entry1901 i).ID = S (180 + i.val + 1) ∧
      (entry1901 i).IC = S 181 ∧ (entry1901 i).Inext = T 180 (180 + i.val + 1) ∧
      (entry1901 i).Icur = T 180 (180 + i.val) ∧
      (entry1901 i).output = T 181 (180 + i.val) ∧
      (entry1901 i).charge = charge 180 (180 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root181).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root182).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root183).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root184).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root185).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1912_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1917_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1901 (i : Fin 32) :
    forwardStepOK (-768) (charge 180 (180 + i.val)) shift
      (S (180 + i.val + 1)) (S 181) (T 180 (180 + i.val + 1))
      (T 180 (180 + i.val)) (T 181 (180 + i.val))
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1901.entries OriginalRow227TriangleForward1901.checked
    ⟨i.val, by rw [size1901]; exact i.isLt⟩
  change (entry1901 i).check = true at h
  rcases fields1901 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1902 : OriginalRow227TriangleForward1902.entries.size = 32 := rfl

def entry1902 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1902.entries[i.val]'(by rw [size1902]; exact i.isLt)

theorem fields1902 (i : Fin 32) :
    (entry1902 i).IA = shift ∧ (entry1902 i).ID = S (212 + i.val + 1) ∧
      (entry1902 i).IC = S 181 ∧ (entry1902 i).Inext = T 180 (212 + i.val + 1) ∧
      (entry1902 i).Icur = T 180 (212 + i.val) ∧
      (entry1902 i).output = T 181 (212 + i.val) ∧
      (entry1902 i).charge = charge 180 (212 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1913_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1918_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1902 (i : Fin 32) :
    forwardStepOK (-768) (charge 180 (212 + i.val)) shift
      (S (212 + i.val + 1)) (S 181) (T 180 (212 + i.val + 1))
      (T 180 (212 + i.val)) (T 181 (212 + i.val))
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1902.entries OriginalRow227TriangleForward1902.checked
    ⟨i.val, by rw [size1902]; exact i.isLt⟩
  change (entry1902 i).check = true at h
  rcases fields1902 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1903 : OriginalRow227TriangleForward1903.entries.size = 32 := rfl

def entry1903 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1903.entries[i.val]'(by rw [size1903]; exact i.isLt)

theorem fields1903 (i : Fin 32) :
    (entry1903 i).IA = shift ∧ (entry1903 i).ID = S (244 + i.val + 1) ∧
      (entry1903 i).IC = S 181 ∧ (entry1903 i).Inext = T 180 (244 + i.val + 1) ∧
      (entry1903 i).Icur = T 180 (244 + i.val) ∧
      (entry1903 i).output = T 181 (244 + i.val) ∧
      (entry1903 i).charge = charge 180 (244 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1914_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1919_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1903 (i : Fin 32) :
    forwardStepOK (-768) (charge 180 (244 + i.val)) shift
      (S (244 + i.val + 1)) (S 181) (T 180 (244 + i.val + 1))
      (T 180 (244 + i.val)) (T 181 (244 + i.val))
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1903.entries OriginalRow227TriangleForward1903.checked
    ⟨i.val, by rw [size1903]; exact i.isLt⟩
  change (entry1903 i).check = true at h
  rcases fields1903 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1904 : OriginalRow227TriangleForward1904.entries.size = 32 := rfl

def entry1904 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1904.entries[i.val]'(by rw [size1904]; exact i.isLt)

theorem fields1904 (i : Fin 32) :
    (entry1904 i).IA = shift ∧ (entry1904 i).ID = S (276 + i.val + 1) ∧
      (entry1904 i).IC = S 181 ∧ (entry1904 i).Inext = T 180 (276 + i.val + 1) ∧
      (entry1904 i).Icur = T 180 (276 + i.val) ∧
      (entry1904 i).output = T 181 (276 + i.val) ∧
      (entry1904 i).charge = charge 180 (276 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1915_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1920_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1904 (i : Fin 32) :
    forwardStepOK (-768) (charge 180 (276 + i.val)) shift
      (S (276 + i.val + 1)) (S 181) (T 180 (276 + i.val + 1))
      (T 180 (276 + i.val)) (T 181 (276 + i.val))
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1904.entries OriginalRow227TriangleForward1904.checked
    ⟨i.val, by rw [size1904]; exact i.isLt⟩
  change (entry1904 i).check = true at h
  rcases fields1904 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1905 : OriginalRow227TriangleForward1905.entries.size = 13 := rfl

def entry1905 (i : Fin 13) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1905.entries[i.val]'(by rw [size1905]; exact i.isLt)

theorem fields1905 (i : Fin 13) :
    (entry1905 i).IA = shift ∧ (entry1905 i).ID = S (308 + i.val + 1) ∧
      (entry1905 i).IC = S 181 ∧ (entry1905 i).Inext = T 180 (308 + i.val + 1) ∧
      (entry1905 i).Icur = T 180 (308 + i.val) ∧
      (entry1905 i).output = T 181 (308 + i.val) ∧
      (entry1905 i).charge = charge 180 (308 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root317).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root318).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root319).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root320).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings10.S_eq_root321).symm, (OriginalRow227RootBindings05.S_eq_root181).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow180.block1916_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow181.block1921_value ⟨12, by decide⟩).symm, rfl⟩

theorem step1905 (i : Fin 13) :
    forwardStepOK (-768) (charge 180 (308 + i.val)) shift
      (S (308 + i.val + 1)) (S 181) (T 180 (308 + i.val + 1))
      (T 180 (308 + i.val)) (T 181 (308 + i.val))
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1905.entries OriginalRow227TriangleForward1905.checked
    ⟨i.val, by rw [size1905]; exact i.isLt⟩
  change (entry1905 i).check = true at h
  rcases fields1905 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 180 ≤ d) (hhi : d < 321) :
    forwardStepOK (-768) (charge 180 d) shift (S (d + 1)) (S 181)
      (T 180 (d + 1)) (T 180 d) (T 181 d)
      (OriginalRow227Roots.root_pos 181 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 180 (by decide)) = true := by
  by_cases h244 : d < 244
  ·
    by_cases h212 : d < 212
    ·
      have hi : d - 180 < 32 := by omega
      have heq : 180 + (d - 180) = d := by omega
      simpa only [heq] using step1901 ⟨d - 180, hi⟩
    ·
      have hi : d - 212 < 32 := by omega
      have heq : 212 + (d - 212) = d := by omega
      simpa only [heq] using step1902 ⟨d - 212, hi⟩
  ·
    by_cases h276 : d < 276
    ·
      have hi : d - 244 < 32 := by omega
      have heq : 244 + (d - 244) = d := by omega
      simpa only [heq] using step1903 ⟨d - 244, hi⟩
    ·
      by_cases h308 : d < 308
      ·
        have hi : d - 276 < 32 := by omega
        have heq : 276 + (d - 276) = d := by omega
        simpa only [heq] using step1904 ⟨d - 276, hi⟩
      ·
        have hi : d - 308 < 13 := by omega
        have heq : 308 + (d - 308) = d := by omega
        simpa only [heq] using step1905 ⟨d - 308, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.fields1901,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.step1901,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.fields1902,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.step1902,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.fields1903,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.step1903,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.fields1904,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.step1904,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.fields1905,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.step1905,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow181
