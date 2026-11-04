import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow186
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187
import Grothe.UpperChaos.OriginalRow227TriangleForward1931
import Grothe.UpperChaos.OriginalRow227TriangleForward1932
import Grothe.UpperChaos.OriginalRow227TriangleForward1933
import Grothe.UpperChaos.OriginalRow227TriangleForward1934
import Grothe.UpperChaos.OriginalRow227TriangleForward1935

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1931 : OriginalRow227TriangleForward1931.entries.size = 32 := rfl

def entry1931 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1931.entries[i.val]'(by rw [size1931]; exact i.isLt)

theorem fields1931 (i : Fin 32) :
    (entry1931 i).IA = shift ∧ (entry1931 i).ID = S (186 + i.val + 1) ∧
      (entry1931 i).IC = S 187 ∧ (entry1931 i).Inext = T 186 (186 + i.val + 1) ∧
      (entry1931 i).Icur = T 186 (186 + i.val) ∧
      (entry1931 i).output = T 187 (186 + i.val) ∧
      (entry1931 i).charge = charge 186 (186 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root187).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1942_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1931 (i : Fin 32) :
    forwardStepOK (-768) (charge 186 (186 + i.val)) shift
      (S (186 + i.val + 1)) (S 187) (T 186 (186 + i.val + 1))
      (T 186 (186 + i.val)) (T 187 (186 + i.val))
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1931.entries OriginalRow227TriangleForward1931.checked
    ⟨i.val, by rw [size1931]; exact i.isLt⟩
  change (entry1931 i).check = true at h
  rcases fields1931 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1932 : OriginalRow227TriangleForward1932.entries.size = 32 := rfl

def entry1932 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1932.entries[i.val]'(by rw [size1932]; exact i.isLt)

theorem fields1932 (i : Fin 32) :
    (entry1932 i).IA = shift ∧ (entry1932 i).ID = S (218 + i.val + 1) ∧
      (entry1932 i).IC = S 187 ∧ (entry1932 i).Inext = T 186 (218 + i.val + 1) ∧
      (entry1932 i).Icur = T 186 (218 + i.val) ∧
      (entry1932 i).output = T 187 (218 + i.val) ∧
      (entry1932 i).charge = charge 186 (218 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1943_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1932 (i : Fin 32) :
    forwardStepOK (-768) (charge 186 (218 + i.val)) shift
      (S (218 + i.val + 1)) (S 187) (T 186 (218 + i.val + 1))
      (T 186 (218 + i.val)) (T 187 (218 + i.val))
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1932.entries OriginalRow227TriangleForward1932.checked
    ⟨i.val, by rw [size1932]; exact i.isLt⟩
  change (entry1932 i).check = true at h
  rcases fields1932 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1933 : OriginalRow227TriangleForward1933.entries.size = 32 := rfl

def entry1933 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1933.entries[i.val]'(by rw [size1933]; exact i.isLt)

theorem fields1933 (i : Fin 32) :
    (entry1933 i).IA = shift ∧ (entry1933 i).ID = S (250 + i.val + 1) ∧
      (entry1933 i).IC = S 187 ∧ (entry1933 i).Inext = T 186 (250 + i.val + 1) ∧
      (entry1933 i).Icur = T 186 (250 + i.val) ∧
      (entry1933 i).output = T 187 (250 + i.val) ∧
      (entry1933 i).charge = charge 186 (250 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1944_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1933 (i : Fin 32) :
    forwardStepOK (-768) (charge 186 (250 + i.val)) shift
      (S (250 + i.val + 1)) (S 187) (T 186 (250 + i.val + 1))
      (T 186 (250 + i.val)) (T 187 (250 + i.val))
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1933.entries OriginalRow227TriangleForward1933.checked
    ⟨i.val, by rw [size1933]; exact i.isLt⟩
  change (entry1933 i).check = true at h
  rcases fields1933 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1934 : OriginalRow227TriangleForward1934.entries.size = 32 := rfl

def entry1934 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1934.entries[i.val]'(by rw [size1934]; exact i.isLt)

theorem fields1934 (i : Fin 32) :
    (entry1934 i).IA = shift ∧ (entry1934 i).ID = S (282 + i.val + 1) ∧
      (entry1934 i).IC = S 187 ∧ (entry1934 i).Inext = T 186 (282 + i.val + 1) ∧
      (entry1934 i).Icur = T 186 (282 + i.val) ∧
      (entry1934 i).output = T 187 (282 + i.val) ∧
      (entry1934 i).charge = charge 186 (282 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1945_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1934 (i : Fin 32) :
    forwardStepOK (-768) (charge 186 (282 + i.val)) shift
      (S (282 + i.val + 1)) (S 187) (T 186 (282 + i.val + 1))
      (T 186 (282 + i.val)) (T 187 (282 + i.val))
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1934.entries OriginalRow227TriangleForward1934.checked
    ⟨i.val, by rw [size1934]; exact i.isLt⟩
  change (entry1934 i).check = true at h
  rcases fields1934 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1935 : OriginalRow227TriangleForward1935.entries.size = 1 := rfl

def entry1935 (i : Fin 1) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1935.entries[i.val]'(by rw [size1935]; exact i.isLt)

theorem fields1935 (i : Fin 1) :
    (entry1935 i).IA = shift ∧ (entry1935 i).ID = S (314 + i.val + 1) ∧
      (entry1935 i).IC = S 187 ∧ (entry1935 i).Inext = T 186 (314 + i.val + 1) ∧
      (entry1935 i).Icur = T 186 (314 + i.val) ∧
      (entry1935 i).output = T 187 (314 + i.val) ∧
      (entry1935 i).charge = charge 186 (314 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root315).symm, (OriginalRow227RootBindings05.S_eq_root187).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow186.block1946_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1951_value ⟨0, by decide⟩).symm, rfl⟩

theorem step1935 (i : Fin 1) :
    forwardStepOK (-768) (charge 186 (314 + i.val)) shift
      (S (314 + i.val + 1)) (S 187) (T 186 (314 + i.val + 1))
      (T 186 (314 + i.val)) (T 187 (314 + i.val))
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1935.entries OriginalRow227TriangleForward1935.checked
    ⟨i.val, by rw [size1935]; exact i.isLt⟩
  change (entry1935 i).check = true at h
  rcases fields1935 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 186 ≤ d) (hhi : d < 315) :
    forwardStepOK (-768) (charge 186 d) shift (S (d + 1)) (S 187)
      (T 186 (d + 1)) (T 186 d) (T 187 d)
      (OriginalRow227Roots.root_pos 187 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 186 (by decide)) = true := by
  by_cases h250 : d < 250
  ·
    by_cases h218 : d < 218
    ·
      have hi : d - 186 < 32 := by omega
      have heq : 186 + (d - 186) = d := by omega
      simpa only [heq] using step1931 ⟨d - 186, hi⟩
    ·
      have hi : d - 218 < 32 := by omega
      have heq : 218 + (d - 218) = d := by omega
      simpa only [heq] using step1932 ⟨d - 218, hi⟩
  ·
    by_cases h282 : d < 282
    ·
      have hi : d - 250 < 32 := by omega
      have heq : 250 + (d - 250) = d := by omega
      simpa only [heq] using step1933 ⟨d - 250, hi⟩
    ·
      by_cases h314 : d < 314
      ·
        have hi : d - 282 < 32 := by omega
        have heq : 282 + (d - 282) = d := by omega
        simpa only [heq] using step1934 ⟨d - 282, hi⟩
      ·
        have hi : d - 314 < 1 := by omega
        have heq : 314 + (d - 314) = d := by omega
        simpa only [heq] using step1935 ⟨d - 314, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.fields1931,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.step1931,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.fields1932,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.step1932,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.fields1933,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.step1933,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.fields1934,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.step1934,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.fields1935,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.step1935,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow187
