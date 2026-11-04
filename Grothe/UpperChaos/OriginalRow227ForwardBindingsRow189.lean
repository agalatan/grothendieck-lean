import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189
import Grothe.UpperChaos.OriginalRow227TriangleForward1940
import Grothe.UpperChaos.OriginalRow227TriangleForward1941
import Grothe.UpperChaos.OriginalRow227TriangleForward1942
import Grothe.UpperChaos.OriginalRow227TriangleForward1943

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1940 : OriginalRow227TriangleForward1940.entries.size = 32 := rfl

def entry1940 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1940.entries[i.val]'(by rw [size1940]; exact i.isLt)

theorem fields1940 (i : Fin 32) :
    (entry1940 i).IA = shift ∧ (entry1940 i).ID = S (188 + i.val + 1) ∧
      (entry1940 i).IC = S 189 ∧ (entry1940 i).Inext = T 188 (188 + i.val + 1) ∧
      (entry1940 i).Icur = T 188 (188 + i.val) ∧
      (entry1940 i).output = T 189 (188 + i.val) ∧
      (entry1940 i).charge = charge 188 (188 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1940 (i : Fin 32) :
    forwardStepOK (-768) (charge 188 (188 + i.val)) shift
      (S (188 + i.val + 1)) (S 189) (T 188 (188 + i.val + 1))
      (T 188 (188 + i.val)) (T 189 (188 + i.val))
      (OriginalRow227Roots.root_pos 189 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 188 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1940.entries OriginalRow227TriangleForward1940.checked
    ⟨i.val, by rw [size1940]; exact i.isLt⟩
  change (entry1940 i).check = true at h
  rcases fields1940 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1941 : OriginalRow227TriangleForward1941.entries.size = 32 := rfl

def entry1941 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1941.entries[i.val]'(by rw [size1941]; exact i.isLt)

theorem fields1941 (i : Fin 32) :
    (entry1941 i).IA = shift ∧ (entry1941 i).ID = S (220 + i.val + 1) ∧
      (entry1941 i).IC = S 189 ∧ (entry1941 i).Inext = T 188 (220 + i.val + 1) ∧
      (entry1941 i).Icur = T 188 (220 + i.val) ∧
      (entry1941 i).output = T 189 (220 + i.val) ∧
      (entry1941 i).charge = charge 188 (220 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1941 (i : Fin 32) :
    forwardStepOK (-768) (charge 188 (220 + i.val)) shift
      (S (220 + i.val + 1)) (S 189) (T 188 (220 + i.val + 1))
      (T 188 (220 + i.val)) (T 189 (220 + i.val))
      (OriginalRow227Roots.root_pos 189 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 188 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1941.entries OriginalRow227TriangleForward1941.checked
    ⟨i.val, by rw [size1941]; exact i.isLt⟩
  change (entry1941 i).check = true at h
  rcases fields1941 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1942 : OriginalRow227TriangleForward1942.entries.size = 32 := rfl

def entry1942 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1942.entries[i.val]'(by rw [size1942]; exact i.isLt)

theorem fields1942 (i : Fin 32) :
    (entry1942 i).IA = shift ∧ (entry1942 i).ID = S (252 + i.val + 1) ∧
      (entry1942 i).IC = S 189 ∧ (entry1942 i).Inext = T 188 (252 + i.val + 1) ∧
      (entry1942 i).Icur = T 188 (252 + i.val) ∧
      (entry1942 i).output = T 189 (252 + i.val) ∧
      (entry1942 i).charge = charge 188 (252 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1942 (i : Fin 32) :
    forwardStepOK (-768) (charge 188 (252 + i.val)) shift
      (S (252 + i.val + 1)) (S 189) (T 188 (252 + i.val + 1))
      (T 188 (252 + i.val)) (T 189 (252 + i.val))
      (OriginalRow227Roots.root_pos 189 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 188 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1942.entries OriginalRow227TriangleForward1942.checked
    ⟨i.val, by rw [size1942]; exact i.isLt⟩
  change (entry1942 i).check = true at h
  rcases fields1942 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1943 : OriginalRow227TriangleForward1943.entries.size = 29 := rfl

def entry1943 (i : Fin 29) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1943.entries[i.val]'(by rw [size1943]; exact i.isLt)

theorem fields1943 (i : Fin 29) :
    (entry1943 i).IA = shift ∧ (entry1943 i).ID = S (284 + i.val + 1) ∧
      (entry1943 i).IC = S 189 ∧ (entry1943 i).Inext = T 188 (284 + i.val + 1) ∧
      (entry1943 i).Icur = T 188 (284 + i.val) ∧
      (entry1943 i).output = T 189 (284 + i.val) ∧
      (entry1943 i).charge = charge 188 (284 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root189).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨28, by decide⟩).symm, rfl⟩

theorem step1943 (i : Fin 29) :
    forwardStepOK (-768) (charge 188 (284 + i.val)) shift
      (S (284 + i.val + 1)) (S 189) (T 188 (284 + i.val + 1))
      (T 188 (284 + i.val)) (T 189 (284 + i.val))
      (OriginalRow227Roots.root_pos 189 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 188 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1943.entries OriginalRow227TriangleForward1943.checked
    ⟨i.val, by rw [size1943]; exact i.isLt⟩
  change (entry1943 i).check = true at h
  rcases fields1943 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 188 ≤ d) (hhi : d < 313) :
    forwardStepOK (-768) (charge 188 d) shift (S (d + 1)) (S 189)
      (T 188 (d + 1)) (T 188 d) (T 189 d)
      (OriginalRow227Roots.root_pos 189 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 188 (by decide)) = true := by
  by_cases h252 : d < 252
  ·
    by_cases h220 : d < 220
    ·
      have hi : d - 188 < 32 := by omega
      have heq : 188 + (d - 188) = d := by omega
      simpa only [heq] using step1940 ⟨d - 188, hi⟩
    ·
      have hi : d - 220 < 32 := by omega
      have heq : 220 + (d - 220) = d := by omega
      simpa only [heq] using step1941 ⟨d - 220, hi⟩
  ·
    by_cases h284 : d < 284
    ·
      have hi : d - 252 < 32 := by omega
      have heq : 252 + (d - 252) = d := by omega
      simpa only [heq] using step1942 ⟨d - 252, hi⟩
    ·
      have hi : d - 284 < 29 := by omega
      have heq : 284 + (d - 284) = d := by omega
      simpa only [heq] using step1943 ⟨d - 284, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.fields1940,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.step1940,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.fields1941,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.step1941,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.fields1942,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.step1942,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.fields1943,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.step1943,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow189
