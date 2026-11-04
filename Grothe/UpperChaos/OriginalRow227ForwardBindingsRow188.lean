import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow187
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow188
import Grothe.UpperChaos.OriginalRow227TriangleForward1936
import Grothe.UpperChaos.OriginalRow227TriangleForward1937
import Grothe.UpperChaos.OriginalRow227TriangleForward1938
import Grothe.UpperChaos.OriginalRow227TriangleForward1939

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1936 : OriginalRow227TriangleForward1936.entries.size = 32 := rfl

def entry1936 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1936.entries[i.val]'(by rw [size1936]; exact i.isLt)

theorem fields1936 (i : Fin 32) :
    (entry1936 i).IA = shift ∧ (entry1936 i).ID = S (187 + i.val + 1) ∧
      (entry1936 i).IC = S 188 ∧ (entry1936 i).Inext = T 187 (187 + i.val + 1) ∧
      (entry1936 i).Icur = T 187 (187 + i.val) ∧
      (entry1936 i).output = T 188 (187 + i.val) ∧
      (entry1936 i).charge = charge 187 (187 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root188).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root189).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1947_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1952_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1936 (i : Fin 32) :
    forwardStepOK (-768) (charge 187 (187 + i.val)) shift
      (S (187 + i.val + 1)) (S 188) (T 187 (187 + i.val + 1))
      (T 187 (187 + i.val)) (T 188 (187 + i.val))
      (OriginalRow227Roots.root_pos 188 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 187 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1936.entries OriginalRow227TriangleForward1936.checked
    ⟨i.val, by rw [size1936]; exact i.isLt⟩
  change (entry1936 i).check = true at h
  rcases fields1936 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1937 : OriginalRow227TriangleForward1937.entries.size = 32 := rfl

def entry1937 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1937.entries[i.val]'(by rw [size1937]; exact i.isLt)

theorem fields1937 (i : Fin 32) :
    (entry1937 i).IA = shift ∧ (entry1937 i).ID = S (219 + i.val + 1) ∧
      (entry1937 i).IC = S 188 ∧ (entry1937 i).Inext = T 187 (219 + i.val + 1) ∧
      (entry1937 i).Icur = T 187 (219 + i.val) ∧
      (entry1937 i).output = T 188 (219 + i.val) ∧
      (entry1937 i).charge = charge 187 (219 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1948_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1953_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1937 (i : Fin 32) :
    forwardStepOK (-768) (charge 187 (219 + i.val)) shift
      (S (219 + i.val + 1)) (S 188) (T 187 (219 + i.val + 1))
      (T 187 (219 + i.val)) (T 188 (219 + i.val))
      (OriginalRow227Roots.root_pos 188 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 187 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1937.entries OriginalRow227TriangleForward1937.checked
    ⟨i.val, by rw [size1937]; exact i.isLt⟩
  change (entry1937 i).check = true at h
  rcases fields1937 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1938 : OriginalRow227TriangleForward1938.entries.size = 32 := rfl

def entry1938 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1938.entries[i.val]'(by rw [size1938]; exact i.isLt)

theorem fields1938 (i : Fin 32) :
    (entry1938 i).IA = shift ∧ (entry1938 i).ID = S (251 + i.val + 1) ∧
      (entry1938 i).IC = S 188 ∧ (entry1938 i).Inext = T 187 (251 + i.val + 1) ∧
      (entry1938 i).Icur = T 187 (251 + i.val) ∧
      (entry1938 i).output = T 188 (251 + i.val) ∧
      (entry1938 i).charge = charge 187 (251 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1949_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1954_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1938 (i : Fin 32) :
    forwardStepOK (-768) (charge 187 (251 + i.val)) shift
      (S (251 + i.val + 1)) (S 188) (T 187 (251 + i.val + 1))
      (T 187 (251 + i.val)) (T 188 (251 + i.val))
      (OriginalRow227Roots.root_pos 188 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 187 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1938.entries OriginalRow227TriangleForward1938.checked
    ⟨i.val, by rw [size1938]; exact i.isLt⟩
  change (entry1938 i).check = true at h
  rcases fields1938 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1939 : OriginalRow227TriangleForward1939.entries.size = 31 := rfl

def entry1939 (i : Fin 31) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1939.entries[i.val]'(by rw [size1939]; exact i.isLt)

theorem fields1939 (i : Fin 31) :
    (entry1939 i).IA = shift ∧ (entry1939 i).ID = S (283 + i.val + 1) ∧
      (entry1939 i).IC = S 188 ∧ (entry1939 i).Inext = T 187 (283 + i.val + 1) ∧
      (entry1939 i).Icur = T 187 (283 + i.val) ∧
      (entry1939 i).output = T 188 (283 + i.val) ∧
      (entry1939 i).charge = charge 187 (283 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root313).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root314).symm, (OriginalRow227RootBindings05.S_eq_root188).symm,
      (OriginalRow227TriangleBindingsRow187.block1951_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow187.block1950_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow188.block1955_value ⟨30, by decide⟩).symm, rfl⟩

theorem step1939 (i : Fin 31) :
    forwardStepOK (-768) (charge 187 (283 + i.val)) shift
      (S (283 + i.val + 1)) (S 188) (T 187 (283 + i.val + 1))
      (T 187 (283 + i.val)) (T 188 (283 + i.val))
      (OriginalRow227Roots.root_pos 188 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 187 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1939.entries OriginalRow227TriangleForward1939.checked
    ⟨i.val, by rw [size1939]; exact i.isLt⟩
  change (entry1939 i).check = true at h
  rcases fields1939 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 187 ≤ d) (hhi : d < 314) :
    forwardStepOK (-768) (charge 187 d) shift (S (d + 1)) (S 188)
      (T 187 (d + 1)) (T 187 d) (T 188 d)
      (OriginalRow227Roots.root_pos 188 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 187 (by decide)) = true := by
  by_cases h251 : d < 251
  ·
    by_cases h219 : d < 219
    ·
      have hi : d - 187 < 32 := by omega
      have heq : 187 + (d - 187) = d := by omega
      simpa only [heq] using step1936 ⟨d - 187, hi⟩
    ·
      have hi : d - 219 < 32 := by omega
      have heq : 219 + (d - 219) = d := by omega
      simpa only [heq] using step1937 ⟨d - 219, hi⟩
  ·
    by_cases h283 : d < 283
    ·
      have hi : d - 251 < 32 := by omega
      have heq : 251 + (d - 251) = d := by omega
      simpa only [heq] using step1938 ⟨d - 251, hi⟩
    ·
      have hi : d - 283 < 31 := by omega
      have heq : 283 + (d - 283) = d := by omega
      simpa only [heq] using step1939 ⟨d - 283, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.fields1936,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.step1936,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.fields1937,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.step1937,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.fields1938,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.step1938,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.fields1939,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.step1939,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow188
