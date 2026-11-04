import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow189
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow190
import Grothe.UpperChaos.OriginalRow227TriangleForward1944
import Grothe.UpperChaos.OriginalRow227TriangleForward1945
import Grothe.UpperChaos.OriginalRow227TriangleForward1946
import Grothe.UpperChaos.OriginalRow227TriangleForward1947

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1944 : OriginalRow227TriangleForward1944.entries.size = 32 := rfl

def entry1944 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1944.entries[i.val]'(by rw [size1944]; exact i.isLt)

theorem fields1944 (i : Fin 32) :
    (entry1944 i).IA = shift ∧ (entry1944 i).ID = S (189 + i.val + 1) ∧
      (entry1944 i).IC = S 190 ∧ (entry1944 i).Inext = T 189 (189 + i.val + 1) ∧
      (entry1944 i).Icur = T 189 (189 + i.val) ∧
      (entry1944 i).output = T 190 (189 + i.val) ∧
      (entry1944 i).charge = charge 189 (189 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root190).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root191).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1956_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1960_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1944 (i : Fin 32) :
    forwardStepOK (-768) (charge 189 (189 + i.val)) shift
      (S (189 + i.val + 1)) (S 190) (T 189 (189 + i.val + 1))
      (T 189 (189 + i.val)) (T 190 (189 + i.val))
      (OriginalRow227Roots.root_pos 190 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 189 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1944.entries OriginalRow227TriangleForward1944.checked
    ⟨i.val, by rw [size1944]; exact i.isLt⟩
  change (entry1944 i).check = true at h
  rcases fields1944 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1945 : OriginalRow227TriangleForward1945.entries.size = 32 := rfl

def entry1945 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1945.entries[i.val]'(by rw [size1945]; exact i.isLt)

theorem fields1945 (i : Fin 32) :
    (entry1945 i).IA = shift ∧ (entry1945 i).ID = S (221 + i.val + 1) ∧
      (entry1945 i).IC = S 190 ∧ (entry1945 i).Inext = T 189 (221 + i.val + 1) ∧
      (entry1945 i).Icur = T 189 (221 + i.val) ∧
      (entry1945 i).output = T 190 (221 + i.val) ∧
      (entry1945 i).charge = charge 189 (221 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1957_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1961_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1945 (i : Fin 32) :
    forwardStepOK (-768) (charge 189 (221 + i.val)) shift
      (S (221 + i.val + 1)) (S 190) (T 189 (221 + i.val + 1))
      (T 189 (221 + i.val)) (T 190 (221 + i.val))
      (OriginalRow227Roots.root_pos 190 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 189 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1945.entries OriginalRow227TriangleForward1945.checked
    ⟨i.val, by rw [size1945]; exact i.isLt⟩
  change (entry1945 i).check = true at h
  rcases fields1945 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1946 : OriginalRow227TriangleForward1946.entries.size = 32 := rfl

def entry1946 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1946.entries[i.val]'(by rw [size1946]; exact i.isLt)

theorem fields1946 (i : Fin 32) :
    (entry1946 i).IA = shift ∧ (entry1946 i).ID = S (253 + i.val + 1) ∧
      (entry1946 i).IC = S 190 ∧ (entry1946 i).Inext = T 189 (253 + i.val + 1) ∧
      (entry1946 i).Icur = T 189 (253 + i.val) ∧
      (entry1946 i).output = T 190 (253 + i.val) ∧
      (entry1946 i).charge = charge 189 (253 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1958_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1962_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1946 (i : Fin 32) :
    forwardStepOK (-768) (charge 189 (253 + i.val)) shift
      (S (253 + i.val + 1)) (S 190) (T 189 (253 + i.val + 1))
      (T 189 (253 + i.val)) (T 190 (253 + i.val))
      (OriginalRow227Roots.root_pos 190 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 189 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1946.entries OriginalRow227TriangleForward1946.checked
    ⟨i.val, by rw [size1946]; exact i.isLt⟩
  change (entry1946 i).check = true at h
  rcases fields1946 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1947 : OriginalRow227TriangleForward1947.entries.size = 27 := rfl

def entry1947 (i : Fin 27) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1947.entries[i.val]'(by rw [size1947]; exact i.isLt)

theorem fields1947 (i : Fin 27) :
    (entry1947 i).IA = shift ∧ (entry1947 i).ID = S (285 + i.val + 1) ∧
      (entry1947 i).IC = S 190 ∧ (entry1947 i).Inext = T 189 (285 + i.val + 1) ∧
      (entry1947 i).Icur = T 189 (285 + i.val) ∧
      (entry1947 i).output = T 190 (285 + i.val) ∧
      (entry1947 i).charge = charge 189 (285 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root311).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root312).symm, (OriginalRow227RootBindings05.S_eq_root190).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow189.block1959_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow190.block1963_value ⟨26, by decide⟩).symm, rfl⟩

theorem step1947 (i : Fin 27) :
    forwardStepOK (-768) (charge 189 (285 + i.val)) shift
      (S (285 + i.val + 1)) (S 190) (T 189 (285 + i.val + 1))
      (T 189 (285 + i.val)) (T 190 (285 + i.val))
      (OriginalRow227Roots.root_pos 190 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 189 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1947.entries OriginalRow227TriangleForward1947.checked
    ⟨i.val, by rw [size1947]; exact i.isLt⟩
  change (entry1947 i).check = true at h
  rcases fields1947 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 189 ≤ d) (hhi : d < 312) :
    forwardStepOK (-768) (charge 189 d) shift (S (d + 1)) (S 190)
      (T 189 (d + 1)) (T 189 d) (T 190 d)
      (OriginalRow227Roots.root_pos 190 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 189 (by decide)) = true := by
  by_cases h253 : d < 253
  ·
    by_cases h221 : d < 221
    ·
      have hi : d - 189 < 32 := by omega
      have heq : 189 + (d - 189) = d := by omega
      simpa only [heq] using step1944 ⟨d - 189, hi⟩
    ·
      have hi : d - 221 < 32 := by omega
      have heq : 221 + (d - 221) = d := by omega
      simpa only [heq] using step1945 ⟨d - 221, hi⟩
  ·
    by_cases h285 : d < 285
    ·
      have hi : d - 253 < 32 := by omega
      have heq : 253 + (d - 253) = d := by omega
      simpa only [heq] using step1946 ⟨d - 253, hi⟩
    ·
      have hi : d - 285 < 27 := by omega
      have heq : 285 + (d - 285) = d := by omega
      simpa only [heq] using step1947 ⟨d - 285, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.fields1944,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.step1944,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.fields1945,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.step1945,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.fields1946,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.step1946,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.fields1947,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.step1947,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow190
