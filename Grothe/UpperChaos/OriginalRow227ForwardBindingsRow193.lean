import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow193
import Grothe.UpperChaos.OriginalRow227TriangleForward1956
import Grothe.UpperChaos.OriginalRow227TriangleForward1957
import Grothe.UpperChaos.OriginalRow227TriangleForward1958
import Grothe.UpperChaos.OriginalRow227TriangleForward1959

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1956 : OriginalRow227TriangleForward1956.entries.size = 32 := rfl

def entry1956 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1956.entries[i.val]'(by rw [size1956]; exact i.isLt)

theorem fields1956 (i : Fin 32) :
    (entry1956 i).IA = shift ∧ (entry1956 i).ID = S (192 + i.val + 1) ∧
      (entry1956 i).IC = S 193 ∧ (entry1956 i).Inext = T 192 (192 + i.val + 1) ∧
      (entry1956 i).Icur = T 192 (192 + i.val) ∧
      (entry1956 i).output = T 193 (192 + i.val) ∧
      (entry1956 i).charge = charge 192 (192 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1972_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1956 (i : Fin 32) :
    forwardStepOK (-768) (charge 192 (192 + i.val)) shift
      (S (192 + i.val + 1)) (S 193) (T 192 (192 + i.val + 1))
      (T 192 (192 + i.val)) (T 193 (192 + i.val))
      (OriginalRow227Roots.root_pos 193 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 192 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1956.entries OriginalRow227TriangleForward1956.checked
    ⟨i.val, by rw [size1956]; exact i.isLt⟩
  change (entry1956 i).check = true at h
  rcases fields1956 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1957 : OriginalRow227TriangleForward1957.entries.size = 32 := rfl

def entry1957 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1957.entries[i.val]'(by rw [size1957]; exact i.isLt)

theorem fields1957 (i : Fin 32) :
    (entry1957 i).IA = shift ∧ (entry1957 i).ID = S (224 + i.val + 1) ∧
      (entry1957 i).IC = S 193 ∧ (entry1957 i).Inext = T 192 (224 + i.val + 1) ∧
      (entry1957 i).Icur = T 192 (224 + i.val) ∧
      (entry1957 i).output = T 193 (224 + i.val) ∧
      (entry1957 i).charge = charge 192 (224 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1973_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1957 (i : Fin 32) :
    forwardStepOK (-768) (charge 192 (224 + i.val)) shift
      (S (224 + i.val + 1)) (S 193) (T 192 (224 + i.val + 1))
      (T 192 (224 + i.val)) (T 193 (224 + i.val))
      (OriginalRow227Roots.root_pos 193 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 192 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1957.entries OriginalRow227TriangleForward1957.checked
    ⟨i.val, by rw [size1957]; exact i.isLt⟩
  change (entry1957 i).check = true at h
  rcases fields1957 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1958 : OriginalRow227TriangleForward1958.entries.size = 32 := rfl

def entry1958 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1958.entries[i.val]'(by rw [size1958]; exact i.isLt)

theorem fields1958 (i : Fin 32) :
    (entry1958 i).IA = shift ∧ (entry1958 i).ID = S (256 + i.val + 1) ∧
      (entry1958 i).IC = S 193 ∧ (entry1958 i).Inext = T 192 (256 + i.val + 1) ∧
      (entry1958 i).Icur = T 192 (256 + i.val) ∧
      (entry1958 i).output = T 193 (256 + i.val) ∧
      (entry1958 i).charge = charge 192 (256 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1974_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1958 (i : Fin 32) :
    forwardStepOK (-768) (charge 192 (256 + i.val)) shift
      (S (256 + i.val + 1)) (S 193) (T 192 (256 + i.val + 1))
      (T 192 (256 + i.val)) (T 193 (256 + i.val))
      (OriginalRow227Roots.root_pos 193 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 192 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1958.entries OriginalRow227TriangleForward1958.checked
    ⟨i.val, by rw [size1958]; exact i.isLt⟩
  change (entry1958 i).check = true at h
  rcases fields1958 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1959 : OriginalRow227TriangleForward1959.entries.size = 21 := rfl

def entry1959 (i : Fin 21) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1959.entries[i.val]'(by rw [size1959]; exact i.isLt)

theorem fields1959 (i : Fin 21) :
    (entry1959 i).IA = shift ∧ (entry1959 i).ID = S (288 + i.val + 1) ∧
      (entry1959 i).IC = S 193 ∧ (entry1959 i).Inext = T 192 (288 + i.val + 1) ∧
      (entry1959 i).Icur = T 192 (288 + i.val) ∧
      (entry1959 i).output = T 193 (288 + i.val) ∧
      (entry1959 i).charge = charge 192 (288 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings06.S_eq_root193).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow193.block1975_value ⟨20, by decide⟩).symm, rfl⟩

theorem step1959 (i : Fin 21) :
    forwardStepOK (-768) (charge 192 (288 + i.val)) shift
      (S (288 + i.val + 1)) (S 193) (T 192 (288 + i.val + 1))
      (T 192 (288 + i.val)) (T 193 (288 + i.val))
      (OriginalRow227Roots.root_pos 193 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 192 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1959.entries OriginalRow227TriangleForward1959.checked
    ⟨i.val, by rw [size1959]; exact i.isLt⟩
  change (entry1959 i).check = true at h
  rcases fields1959 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 192 ≤ d) (hhi : d < 309) :
    forwardStepOK (-768) (charge 192 d) shift (S (d + 1)) (S 193)
      (T 192 (d + 1)) (T 192 d) (T 193 d)
      (OriginalRow227Roots.root_pos 193 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 192 (by decide)) = true := by
  by_cases h256 : d < 256
  ·
    by_cases h224 : d < 224
    ·
      have hi : d - 192 < 32 := by omega
      have heq : 192 + (d - 192) = d := by omega
      simpa only [heq] using step1956 ⟨d - 192, hi⟩
    ·
      have hi : d - 224 < 32 := by omega
      have heq : 224 + (d - 224) = d := by omega
      simpa only [heq] using step1957 ⟨d - 224, hi⟩
  ·
    by_cases h288 : d < 288
    ·
      have hi : d - 256 < 32 := by omega
      have heq : 256 + (d - 256) = d := by omega
      simpa only [heq] using step1958 ⟨d - 256, hi⟩
    ·
      have hi : d - 288 < 21 := by omega
      have heq : 288 + (d - 288) = d := by omega
      simpa only [heq] using step1959 ⟨d - 288, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.fields1956,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.step1956,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.fields1957,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.step1957,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.fields1958,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.step1958,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.fields1959,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.step1959,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow193
