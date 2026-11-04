import Mathlib.Tactic.FinCases
import Grothe.UpperChaos.OriginalRow227RatioLookup
import Grothe.UpperChaos.OriginalRow227Roots
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow191
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow192
import Grothe.UpperChaos.OriginalRow227TriangleForward1952
import Grothe.UpperChaos.OriginalRow227TriangleForward1953
import Grothe.UpperChaos.OriginalRow227TriangleForward1954
import Grothe.UpperChaos.OriginalRow227TriangleForward1955

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192

open ConditionalTableLookup

open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks
open ConditionalNormalizedCertificate OriginalRow227TriangleShared
open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup

theorem size1952 : OriginalRow227TriangleForward1952.entries.size = 32 := rfl

def entry1952 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1952.entries[i.val]'(by rw [size1952]; exact i.isLt)

theorem fields1952 (i : Fin 32) :
    (entry1952 i).IA = shift ∧ (entry1952 i).ID = S (191 + i.val + 1) ∧
      (entry1952 i).IC = S 192 ∧ (entry1952 i).Inext = T 191 (191 + i.val + 1) ∧
      (entry1952 i).Icur = T 191 (191 + i.val) ∧
      (entry1952 i).output = T 192 (191 + i.val) ∧
      (entry1952 i).charge = charge 191 (191 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings05.S_eq_root192).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root193).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root194).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root195).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root196).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root197).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root198).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root199).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root200).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root201).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root202).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root203).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root204).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root205).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root206).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root207).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root208).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root209).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root210).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root211).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root212).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root213).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root214).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root215).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root216).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root217).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root218).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root219).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root220).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root221).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root222).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1964_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root223).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1968_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1952 (i : Fin 32) :
    forwardStepOK (-768) (charge 191 (191 + i.val)) shift
      (S (191 + i.val + 1)) (S 192) (T 191 (191 + i.val + 1))
      (T 191 (191 + i.val)) (T 192 (191 + i.val))
      (OriginalRow227Roots.root_pos 192 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 191 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1952.entries OriginalRow227TriangleForward1952.checked
    ⟨i.val, by rw [size1952]; exact i.isLt⟩
  change (entry1952 i).check = true at h
  rcases fields1952 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1953 : OriginalRow227TriangleForward1953.entries.size = 32 := rfl

def entry1953 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1953.entries[i.val]'(by rw [size1953]; exact i.isLt)

theorem fields1953 (i : Fin 32) :
    (entry1953 i).IA = shift ∧ (entry1953 i).ID = S (223 + i.val + 1) ∧
      (entry1953 i).IC = S 192 ∧ (entry1953 i).Inext = T 191 (223 + i.val + 1) ∧
      (entry1953 i).Icur = T 191 (223 + i.val) ∧
      (entry1953 i).output = T 192 (223 + i.val) ∧
      (entry1953 i).charge = charge 191 (223 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings06.S_eq_root224).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root225).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root226).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root227).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root228).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root229).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root230).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root231).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root232).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root233).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root234).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root235).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root236).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root237).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root238).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root239).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root240).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root241).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root242).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root243).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root244).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root245).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root246).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root247).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root248).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root249).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root250).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root251).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root252).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root253).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root254).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1965_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root255).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1969_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1953 (i : Fin 32) :
    forwardStepOK (-768) (charge 191 (223 + i.val)) shift
      (S (223 + i.val + 1)) (S 192) (T 191 (223 + i.val + 1))
      (T 191 (223 + i.val)) (T 192 (223 + i.val))
      (OriginalRow227Roots.root_pos 192 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 191 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1953.entries OriginalRow227TriangleForward1953.checked
    ⟨i.val, by rw [size1953]; exact i.isLt⟩
  change (entry1953 i).check = true at h
  rcases fields1953 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1954 : OriginalRow227TriangleForward1954.entries.size = 32 := rfl

def entry1954 (i : Fin 32) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1954.entries[i.val]'(by rw [size1954]; exact i.isLt)

theorem fields1954 (i : Fin 32) :
    (entry1954 i).IA = shift ∧ (entry1954 i).ID = S (255 + i.val + 1) ∧
      (entry1954 i).IC = S 192 ∧ (entry1954 i).Inext = T 191 (255 + i.val + 1) ∧
      (entry1954 i).Icur = T 191 (255 + i.val) ∧
      (entry1954 i).output = T 192 (255 + i.val) ∧
      (entry1954 i).charge = charge 191 (255 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings07.S_eq_root256).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root257).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root258).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root259).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root260).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root261).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root262).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root263).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root264).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root265).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root266).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root267).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root268).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root269).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root270).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root271).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root272).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root273).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root274).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root275).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root276).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root277).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root278).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨22, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root279).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨23, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root280).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨25, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨24, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root281).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨26, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨25, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root282).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨27, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨26, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root283).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨28, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨27, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root284).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨29, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨28, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root285).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨30, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨29, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root286).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1966_value ⟨31, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨30, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root287).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨0, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1970_value ⟨31, by decide⟩).symm, rfl⟩

theorem step1954 (i : Fin 32) :
    forwardStepOK (-768) (charge 191 (255 + i.val)) shift
      (S (255 + i.val + 1)) (S 192) (T 191 (255 + i.val + 1))
      (T 191 (255 + i.val)) (T 192 (255 + i.val))
      (OriginalRow227Roots.root_pos 192 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 191 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1954.entries OriginalRow227TriangleForward1954.checked
    ⟨i.val, by rw [size1954]; exact i.isLt⟩
  change (entry1954 i).check = true at h
  rcases fields1954 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem size1955 : OriginalRow227TriangleForward1955.entries.size = 23 := rfl

def entry1955 (i : Fin 23) : ForwardEntry (-768) :=
  OriginalRow227TriangleForward1955.entries[i.val]'(by rw [size1955]; exact i.isLt)

theorem fields1955 (i : Fin 23) :
    (entry1955 i).IA = shift ∧ (entry1955 i).ID = S (287 + i.val + 1) ∧
      (entry1955 i).IC = S 192 ∧ (entry1955 i).Inext = T 191 (287 + i.val + 1) ∧
      (entry1955 i).Icur = T 191 (287 + i.val) ∧
      (entry1955 i).output = T 192 (287 + i.val) ∧
      (entry1955 i).charge = charge 191 (287 + i.val) := by
  fin_cases i
  · exact ⟨rfl, (OriginalRow227RootBindings08.S_eq_root288).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨1, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨0, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root289).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨2, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨1, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root290).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨3, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨2, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root291).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨4, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨3, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root292).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨5, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨4, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root293).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨6, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨5, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root294).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨7, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨6, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root295).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨8, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨7, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root296).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨9, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨8, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root297).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨10, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨9, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root298).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨11, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨10, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root299).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨12, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨11, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root300).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨13, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨12, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root301).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨14, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨13, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root302).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨15, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨14, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root303).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨16, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨15, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root304).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨17, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨16, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root305).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨18, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨17, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root306).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨19, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨18, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root307).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨20, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨19, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root308).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨21, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨20, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root309).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨22, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨21, by decide⟩).symm, rfl⟩
  · exact ⟨rfl, (OriginalRow227RootBindings09.S_eq_root310).symm, (OriginalRow227RootBindings05.S_eq_root192).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨24, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow191.block1967_value ⟨23, by decide⟩).symm,
      (OriginalRow227TriangleBindingsRow192.block1971_value ⟨22, by decide⟩).symm, rfl⟩

theorem step1955 (i : Fin 23) :
    forwardStepOK (-768) (charge 191 (287 + i.val)) shift
      (S (287 + i.val + 1)) (S 192) (T 191 (287 + i.val + 1))
      (T 191 (287 + i.val)) (T 192 (287 + i.val))
      (OriginalRow227Roots.root_pos 192 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 191 (by decide)) = true := by
  have h := blockCheck_get ForwardEntry.check OriginalRow227TriangleForward1955.entries OriginalRow227TriangleForward1955.checked
    ⟨i.val, by rw [size1955]; exact i.isLt⟩
  change (entry1955 i).check = true at h
  rcases fields1955 i with ⟨hA, hD, hC, hN, hU, hO, hq⟩
  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h

theorem forward_row (d : ℕ) (hlo : 191 ≤ d) (hhi : d < 310) :
    forwardStepOK (-768) (charge 191 d) shift (S (d + 1)) (S 192)
      (T 191 (d + 1)) (T 191 d) (T 192 d)
      (OriginalRow227Roots.root_pos 192 (by decide) (by decide))
      (OriginalRow227Roots.product_pos 191 (by decide)) = true := by
  by_cases h255 : d < 255
  ·
    by_cases h223 : d < 223
    ·
      have hi : d - 191 < 32 := by omega
      have heq : 191 + (d - 191) = d := by omega
      simpa only [heq] using step1952 ⟨d - 191, hi⟩
    ·
      have hi : d - 223 < 32 := by omega
      have heq : 223 + (d - 223) = d := by omega
      simpa only [heq] using step1953 ⟨d - 223, hi⟩
  ·
    by_cases h287 : d < 287
    ·
      have hi : d - 255 < 32 := by omega
      have heq : 255 + (d - 255) = d := by omega
      simpa only [heq] using step1954 ⟨d - 255, hi⟩
    ·
      have hi : d - 287 < 23 := by omega
      have heq : 287 + (d - 287) = d := by omega
      simpa only [heq] using step1955 ⟨d - 287, hi⟩

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.fields1952,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.step1952,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.fields1953,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.step1953,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.fields1954,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.step1954,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.fields1955,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.step1955,
      ``Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192.forward_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227ForwardBindingsRow192
