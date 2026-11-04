import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow185
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186
import Grothe.UpperChaos.OriginalRow227TriangleForward1926
import Grothe.UpperChaos.OriginalRow227TriangleForward1927
import Grothe.UpperChaos.OriginalRow227TriangleForward1928
import Grothe.UpperChaos.OriginalRow227TriangleForward1929
import Grothe.UpperChaos.OriginalRow227TriangleForward1930

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1926 : OriginalRow227TriangleForward1926.entries.size = 32 := rfl

def entry1926 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1926.entries[i.val]'(by rw [size1926]; exact i.isLt)

theorem fields1926 (i : Fin 32) :
    (entry1926 i).IA = shift ∧ (entry1926 i).ID = S (185 + i.val + 1) ∧
      (entry1926 i).IC = S 186 ∧ (entry1926 i).Inext = T 185 (185 + i.val + 1) ∧
      (entry1926 i).Icur = T 185 (185 + i.val) ∧
      (entry1926 i).output = T 186 (185 + i.val) ∧
      (entry1926 i).charge = charge 185 (185 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root186).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1937_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1926 (i : Fin 32) :
    forwardStepOK (-768) (charge 185 (185 + i.val)) shift
      (S (185 + i.val + 1)) (S 186) (T 185 (185 + i.val + 1))
      (T 185 (185 + i.val)) (T 186 (185 + i.val))
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1926.entries OriginalRow227TriangleForward1926.checked
    ⟨i.val, by rw [size1926]; exact i.isLt⟩
  change (entry1926 i).check = true at h
  rcases fields1926 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1927 : OriginalRow227TriangleForward1927.entries.size = 32 := rfl

def entry1927 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1927.entries[i.val]'(by rw [size1927]; exact i.isLt)

theorem fields1927 (i : Fin 32) :
    (entry1927 i).IA = shift ∧ (entry1927 i).ID = S (217 + i.val + 1) ∧
      (entry1927 i).IC = S 186 ∧ (entry1927 i).Inext = T 185 (217 + i.val + 1) ∧
      (entry1927 i).Icur = T 185 (217 + i.val) ∧
      (entry1927 i).output = T 186 (217 + i.val) ∧
      (entry1927 i).charge = charge 185 (217 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1938_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1927 (i : Fin 32) :
    forwardStepOK (-768) (charge 185 (217 + i.val)) shift
      (S (217 + i.val + 1)) (S 186) (T 185 (217 + i.val + 1))
      (T 185 (217 + i.val)) (T 186 (217 + i.val))
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1927.entries OriginalRow227TriangleForward1927.checked
    ⟨i.val, by rw [size1927]; exact i.isLt⟩
  change (entry1927 i).check = true at h
  rcases fields1927 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1928 : OriginalRow227TriangleForward1928.entries.size = 32 := rfl

def entry1928 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1928.entries[i.val]'(by rw [size1928]; exact i.isLt)

theorem fields1928 (i : Fin 32) :
    (entry1928 i).IA = shift ∧ (entry1928 i).ID = S (249 + i.val + 1) ∧
      (entry1928 i).IC = S 186 ∧ (entry1928 i).Inext = T 185 (249 + i.val + 1) ∧
      (entry1928 i).Icur = T 185 (249 + i.val) ∧
      (entry1928 i).output = T 186 (249 + i.val) ∧
      (entry1928 i).charge = charge 185 (249 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1939_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1928 (i : Fin 32) :
    forwardStepOK (-768) (charge 185 (249 + i.val)) shift
      (S (249 + i.val + 1)) (S 186) (T 185 (249 + i.val + 1))
      (T 185 (249 + i.val)) (T 186 (249 + i.val))
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1928.entries OriginalRow227TriangleForward1928.checked
    ⟨i.val, by rw [size1928]; exact i.isLt⟩
  change (entry1928 i).check = true at h
  rcases fields1928 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1929 : OriginalRow227TriangleForward1929.entries.size = 32 := rfl

def entry1929 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1929.entries[i.val]'(by rw [size1929]; exact i.isLt)

theorem fields1929 (i : Fin 32) :
    (entry1929 i).IA = shift ∧ (entry1929 i).ID = S (281 + i.val + 1) ∧
      (entry1929 i).IC = S 186 ∧ (entry1929 i).Inext = T 185 (281 + i.val + 1) ∧
      (entry1929 i).Icur = T 185 (281 + i.val) ∧
      (entry1929 i).output = T 186 (281 + i.val) ∧
      (entry1929 i).charge = charge 185 (281 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1940_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1929 (i : Fin 32) :
    forwardStepOK (-768) (charge 185 (281 + i.val)) shift
      (S (281 + i.val + 1)) (S 186) (T 185 (281 + i.val + 1))
      (T 185 (281 + i.val)) (T 186 (281 + i.val))
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1929.entries OriginalRow227TriangleForward1929.checked
    ⟨i.val, by rw [size1929]; exact i.isLt⟩
  change (entry1929 i).check = true at h
  rcases fields1929 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1930 : OriginalRow227TriangleForward1930.entries.size = 3 := rfl

def entry1930 (i : Fin 3) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1930.entries[i.val]'(by rw [size1930]; exact i.isLt)

theorem fields1930 (i : Fin 3) :
    (entry1930 i).IA = shift ∧ (entry1930 i).ID = S (313 + i.val + 1) ∧
      (entry1930 i).IC = S 186 ∧ (entry1930 i).Inext = T 185 (313 + i.val + 1) ∧
      (entry1930 i).Icur = T 185 (313 + i.val) ∧
      (entry1930 i).output = T 186 (313 + i.val) ∧
      (entry1930 i).charge = charge 185 (313 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root316).symm, (OriginalRow227RootBindings05.S_eq_root186).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow185.block1941_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨2, by decide⟩).symm, rfl⟩

theorem step1930 (i : Fin 3) :
    forwardStepOK (-768) (charge 185 (313 + i.val)) shift
      (S (313 + i.val + 1)) (S 186) (T 185 (313 + i.val + 1))
      (T 185 (313 + i.val)) (T 186 (313 + i.val))
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1930.entries OriginalRow227TriangleForward1930.checked
    ⟨i.val, by rw [size1930]; exact i.isLt⟩
  change (entry1930 i).check = true at h
  rcases fields1930 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 185 ≤ d) (hhi : d < 316) :
    forwardStepOK (-768) (charge 185 d) shift (S (d + 1)) (S 186)
      (T 185 (d + 1)) (T 185 d) (T 186 d)
      (OriginalRow227Roots.root_pos 186 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 185 (by decide)) = true := by
  by_cases h249 : d < 249
  ·
    by_cases h217 : d < 217
    ·
      have hi : d - 185 < 32 := by omega
      have heq : 185 + (d - 185) = d := by omega
      simpa only [heq] using step1926 ⟨d - 185, hi⟩
    ·
      have hi : d - 217 < 32 := by omega
      have heq : 217 + (d - 217) = d := by omega
      simpa only [heq] using step1927 ⟨d - 217, hi⟩
  ·
    by_cases h281 : d < 281
    ·
      have hi : d - 249 < 32 := by omega
      have heq : 249 + (d - 249) = d := by omega
      simpa only [heq] using step1928 ⟨d - 249, hi⟩
    ·
      by_cases h313 : d < 313
      ·
        have hi : d - 281 < 32 := by omega
        have heq : 281 + (d - 281) = d := by omega
        simpa only [heq] using step1929 ⟨d - 281, hi⟩
      ·
        have hi : d - 313 < 3 := by omega
        have heq : 313 + (d - 313) = d := by omega
        simpa only [heq] using step1930 ⟨d - 313, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.fields1926,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.step1926,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.fields1927,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.step1927,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.fields1928,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.step1928,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.fields1929,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.step1929,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.fields1930,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.step1930,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow186
